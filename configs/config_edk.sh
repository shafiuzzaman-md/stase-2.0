#!/usr/bin/env bash
# STASE EDK-II batch runner – one concise block per vulnerability
# ---------------------------------------------------------------
set -euo pipefail
cd "$(dirname "$0")/../stase_symex"        # stay with the helpers

# ─── edit paths if your layout differs ─────────────────────────────────
EDK_SRC="../eval3_edk2-main"
CLANG_SYS="/usr/lib/llvm-14/bin/clang"          # system clang
KLEE_BIN="/harden/klee_build/bin/klee" # klee
INPUTS_DIR="../inputs"
# ──────────────────────────────────────────────────────────────────────

# helper: fresh workspace + clang wrapper
new_workspace () {
    ws=$(python3 setup_edk2_environment.py "$EDK_SRC" \
          | tee /dev/stderr \
          | grep -oE 'Setup completed in .*$' | awk '{print $4}')

    stub="$ws/include"
    wrap="$ws/clang_with_stubs.sh"
    cat > "$wrap" <<EOF
#!/usr/bin/env bash
exec "$CLANG_SYS" -I "$stub" -include "$stub/register_stubs.h" "\$@"
EOF
    chmod +x "$wrap"
    export CLANG_WRAP="$wrap"
    echo "[✓] Workspace $ws  (wrapper → \$CLANG_WRAP)"
}


###############################################################################
# SmmLegacy :: STACK_EXEC  
###############################################################################
new_workspace

python3 instrument_edk2.py \
  --entry-src  UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
  --target-src UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
  --assert-line 42 \
  --assertion '((Attribute & EFI_MEMORY_XP) != 0)'\
   --comment-lines 8 184 198 202 31 32 33 34 35 36 37

python3 setup_driver.py \
  --entry-src  UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
  --entry-func SmmLegacyMmiHandler \
  --vuln       STACK_EXEC \
  --assert-line 42 \
  --target-src UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
  --symbolic  "VOID* CommBuffer" \
  --symbolic  "UINTN* CommBufferSize" \
  --global    "CHAR16 SmmLegacyVariableName[64]" \
  --concrete  'klee_make_symbolic(SmmLegacyVariableName, sizeof(SmmLegacyVariableName), "SmmLegacyVariableName");'

python3 run_analysis.py \
  "$INPUTS_DIR/klee_driver_SmmLegacyMmiHandler_STACK_EXEC_42.c" \
  --clang-path "$CLANG_WRAP" \
  --klee-path  "$KLEE_BIN"

###############################################################################
#SmmLegacyMmiHandler :: STACK_EXEC 
###############################################################################
# new_workspace

# python3 instrument_edk2.py \
#   --entry-src  UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
#   --target-src UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
#   --assert-line 42 \
#   --assertion 'klee_assert(!SmmIsRegionExecutable(Base, Size) && "SMM stack executable");'

# python3 setup_driver.py \
#   --entry-src  UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
#   --entry-func SmmLegacyMmiHandler \
#   --vuln       STACK_EXEC \
#   --assert-line 42 \
#   --target-src UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c \
#   --symbolic  "EFI_HANDLE DispatchHandle" \
#   --symbolic  "CONST VOID *Context" \
#   --symbolic  "VOID *CommBuffer" \
#   --symbolic  "UINTN *CommBufferSize"

# python3 run_analysis.py \
#   "$INPUTS_DIR/klee_driver_SmmLegacyMmiHandler_STACK_EXEC_42.c" \
#   --clang-path "$CLANG_WRAP" \
#   --klee-path  "$KLEE_BIN"

###############################################################################
# Add more vulnerabilities:  copy-paste the block above,
#    call new_workspace, then change filenames / assertions / symbolic vars.
###############################################################################

echo -e "\n[✓] All EDK-II analyses completed."
