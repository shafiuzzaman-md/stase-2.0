#!/usr/bin/env bash
# config – STASE batch runner
set -euo pipefail

cd "$(dirname "$0")/../stase_symex"
proj="../eval3_edk2-main"
##############################################################################
# 1. Define analysis cases (one line per vulnerability, |‑separated fields)
#    Format:
#    entry_src|entry_func|vuln|target_src|assert_line|assertion|sym_vars
#    sym_vars – whitespace‑separated list of   TYPE[*] NAME   tokens
##############################################################################

##############################################################################
# 1. Vulnerability case definitions
##############################################################################
vul1_entry_src="UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c"
vul1_entry_func="SmmLegacyMmiHandler"
vul1_type="STACK_EXEC"
vul1_target_src="UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c"
vul1_assert_line="42"
vul1_assertion="((Attribute & EFI_MEMORY_XP) != 0)"
vul1_sym_vars="VOID* CommBuffer UINTN* CommBufferSize"
vul1_conc_vars=""
vul1_comment_lines="8 184 198 202 31 32 33 34 35 36 37"
vul1_stub_funcs="DisableReadOnlyPageWriteProtect EnableReadOnlyPageWriteProtect"
vul1_global_decl='CHAR16 SmmLegacyVariableName[64]'
vul1_global_concrete='klee_make_symbolic(SmmLegacyVariableName, sizeof(SmmLegacyVariableName), "SmmLegacyVariableName");'

# 2. OOB_WRITE from PxeDhcpInput
#     • entry-point   : PxeDhcpInput  (Dhcp4Impl.c)
#     • sink          : gEfiNetPoolPrivate->Bucket[Index] = Pool->Next
#                       (AllocateFromBucket in NetHeap.c)
#     • assertion     : Index must stay inside the Bucket[] array
##############################################################################
vul2_entry_src="NetworkPkg/Dhcp4Dxe/Dhcp4Impl.c"
vul2_entry_func="PxeDhcpInput"
vul2_type="OOB_WRITE"
vul2_target_src="NetworkPkg/Library/DxeNetLib/NetHeap.c"
vul2_assert_line="189"                               # <—- update if needed
vul2_assertion="(Index < NET_POOL_MAX_BUCKETS)"
vul2_sym_vars="EFI_PXE_BASE_CODE_PACKET* Pkt UINTN Len"
vul2_conc_vars=""
vul2_comment_lines=""                                # nothing special to hide
vul2_stub_funcs=""                                   # no extra stubs required
vul2_global_decl='UINT8 _dummy_global;'
vul2_global_concrete=""

##############################################################################
# 2. Register all cases
##############################################################################
cases=(
  #"${vul1_entry_src}|${vul1_entry_func}|${vul1_type}|${vul1_target_src}|${vul1_assert_line}|${vul1_assertion}|${vul1_sym_vars}|${vul1_conc_vars}|${vul1_comment_lines}|${vul1_stub_funcs}|${vul1_global_decl}|${vul1_global_concrete}"
  "${vul2_entry_src}|${vul2_entry_func}|${vul2_type}|${vul2_target_src}|${vul2_assert_line}|${vul2_assertion}|${vul2_sym_vars}|${vul2_conc_vars}|${vul2_comment_lines}|${vul2_stub_funcs}|${vul2_global_decl}|${vul2_global_concrete}"
)


###########################################################################
# 0. One-time environment stubs 
###########################################################################

stubdir="stase_generated/include"
stub_abs="$(pwd)/$stubdir" 
mkdir -p "$stubdir"

printf '[init] Commenting out <Register/Intel/...> includes in %s\n' "$proj"
find "$proj" -type f \( -name '*.c' -o -name '*.h' -o -name '*.cpp' \) \
     -exec sed -i -E 's@^[[:space:]]*#include[[:space:]]+<Register/Intel/[^>]+>@// &@' {} +

printf '[init] Building EDKII environment stubs\n'
python3 setup_edk2_environment.py "$proj"


# ---------- create the stub header ----------
cat > "$stubdir/register_stubs.h" <<'EOF'
#ifndef STASE_REGISTER_STUBS_H
#define STASE_REGISTER_STUBS_H

/* ─── basic integers ──────────────────────────────────────────────── */
typedef unsigned int        UINT32;
typedef unsigned short      UINT16;
typedef unsigned char       UINT8;
typedef unsigned long long  UINT64;
typedef unsigned long long  UINTN;

/* prototype for symbolic helper */
extern int klee_range(int, int, const char*);

/* ─── IoRead8 stub (needs UINT8, UINTN, klee_range) ───────────────── */
static inline UINT8 IoRead8(UINTN Port)
{
  return (UINT8)klee_range(0, 256, "IoRead8_ret");
}

/* ───────────────────────  small CPU stubs  ────────────────────────── */
typedef struct { UINT16 Limit; UINTN Base; } IA32_DESCRIPTOR;
typedef struct { UINT64 _; }  SMRAM_SAVE_STATE_MAP;
typedef struct { UINT32 _; }  CPUID_VERSION_INFO_ECX;
typedef struct { UINT32 _; }  CPUID_VERSION_INFO_EDX;
typedef UINT8                 X86_ASSEMBLY_PATCH_LABEL;

/* ───────────────────────  helper macros  ──────────────────────────── */
#ifndef _SMM_PROFILE_ARCH_H_
#define _SMM_PROFILE_ARCH_H_
#endif

#ifndef PcdGet32
# define PcdGet32(TokenName) (0U)
#endif

/* Fallback value for PcdSmmLegacyPropertyMask (needed by SmmLegacy.c) */
#ifndef _PCD_GET_MODE_32_PcdSmmLegacyPropertyMask
# define _PCD_GET_MODE_32_PcdSmmLegacyPropertyMask  0U
#endif


extern int  klee_range(int,int,const char*);
extern void __assert_fail(const char*,const char*,unsigned,const char*);

/* ───────────────────────  CHAR16 and dummy variable  ──────────────── */
#ifndef CHAR16                        /* only if Base.h not included   */
typedef UINT16 CHAR16;                /* matches EDK II 16-bit type    */
#endif

extern CHAR16 SmmLegacyVariableName[];   /* declaration only — no data */

/* ───────────────────────  dummy globals  ──────────────────────────── */
#ifndef _STASE_MMM_STACK_DEFINED_
#define _STASE_MMM_STACK_DEFINED_
UINT64 mSmmStackArrayBase = 0;          /* satisfy extern reference    */
#endif

/* ───────────────────────  EFI_STATUS fallback  ────────────────────── */
#ifndef EFI_STATUS                      /* defined in UefiBaseType.h   */
typedef UINT64 EFI_STATUS;              /* 64-bit stand-in             */
#endif

/* ───────────────────────  EFI_MM_SYSTEM_TABLE fwd + gMmst  ────────── */
#ifndef _EFI_MM_SYSTEM_TABLE_FWD_
#define _EFI_MM_SYSTEM_TABLE_FWD_
typedef struct _EFI_MM_SYSTEM_TABLE EFI_MM_SYSTEM_TABLE;
#endif

#ifndef _STASE_GMMST_DUMMY_
#define _STASE_GMMST_DUMMY_
static char _gMmst_blob[1] = {0};
EFI_MM_SYSTEM_TABLE *gMmst = (EFI_MM_SYSTEM_TABLE *)_gMmst_blob;
#endif

#endif /* STASE_REGISTER_STUBS_H */

EOF

# ---------- copy a real SmmProfileArch.h into the stub dir -----
cp "$proj/UefiCpuPkg/PiSmmCpuDxeSmm/Ia32/SmmProfileArch.h"  "$stubdir/" 2>/dev/null || true
# ----------------------------------------------------------------------
# Wrap clang so every compile pre-includes our stub header automatically
# ----------------------------------------------------------------------
real_clang="/usr/lib/llvm-14/bin/clang"
wrapper_clang="$(pwd)/clang_with_stubs.sh"
cat > "$wrapper_clang" <<EOF
#!/usr/bin/env bash
exec "$real_clang" -I "$stub_abs" \
     -include "$stub_abs/register_stubs.h" "\$@"
EOF
chmod +x "$wrapper_clang"



##############################################################################
# 2. Main loop – instrument, generate driver, launch KLEE
##############################################################################
clang_bin="$wrapper_clang"
klee_bin="/harden/klee_build/bin/klee"

idx=0
for c in "${cases[@]}"; do
  IFS='|' read -r entry_src entry_func vuln target_src line assertion sym_list conc_list comment_str stub_str global_decl global_concrete <<<"$c"
  read -ra comment_lines <<< "$comment_str"
  read -ra stub_funcs <<< "$stub_str"
  ((++idx))
  printf '\n=========== Case #%d : %s (%s) ===========\n' "$idx" "$entry_func" "$vuln"

  # ------------------------------------------------------------------
  printf '[%d/3] Instrumenting %s\n' 1 "$target_src"
  python3 instrument.py \
  --target-src "$target_src" \
  --assert-line "$line" \
  --assertion "$assertion /* auto */" \
  --comment-lines "${comment_lines[@]}" \
  --stub-functions "${stub_funcs[@]}"



  # Build --symbolic flags
  sym_flags=()
  read -ra toks <<< "$sym_list"        # split on whitespace once
  for ((i=0; i<${#toks[@]}; i+=2)); do
    sym_flags+=( --symbolic "${toks[i]} ${toks[i+1]}" )
  done


  # Build --concrete flags
  con_flags=()
  IFS=';' read -ra init_arr <<< "${conc_list:-}"
  for stmt in "${init_arr[@]}"; do
    [[ -n "$stmt" ]] && con_flags+=( --concrete "$stmt;" )
  done

  # ------------------------------------------------------------------
  printf '[%d/3] Generating driver\n' 2
  python3 setup_driver.py \
      --entry-src  "$entry_src" \
      --entry-func "$entry_func" \
      --vuln       "$vuln" \
      --assert-line "$line" \
      --target-src "$target_src" \
      --global "$global_decl" \
      --concrete "$global_concrete" \
       "${sym_flags[@]}"          \
       "${con_flags[@]}"

  drv="../inputs/klee_driver_${entry_func}_${vuln}_${line}.c"

  # ------------------------------------------------------------------
  printf '[%d/3] Launching KLEE on %s\n' 3 "$(basename "$drv")"
  python3 run_analysis.py "$drv" \
      --clang-path "$clang_bin" \
      --klee-path  "$klee_bin"

done

echo -e '\nAll cases finished; check formatted-output directory for output json and stase_output directory for detailed output.'
