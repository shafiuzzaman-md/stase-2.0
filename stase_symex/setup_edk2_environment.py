#!/usr/bin/env python3
import sys, subprocess, shutil, textwrap
from pathlib import Path
from setup_common import next_workspace, validate_path, copy_source_tree


# ──────────────────────────────────────────────────────────────────────
# NEW: centralised stub-header generator
# ──────────────────────────────────────────────────────────────────────
def write_stub_header(src_root: Path, ws: Path) -> Path:
    stub_dir = ws / "include"
    stub_dir.mkdir(parents=True, exist_ok=True)

    header_text = textwrap.dedent("""\
        #ifndef STASE_REGISTER_STUBS_H
        #define STASE_REGISTER_STUBS_H
        /* ─── basic integers ───────────────────────────────────────── */
        typedef unsigned int        UINT32;
        typedef unsigned short      UINT16;
        typedef unsigned char       UINT8;
        typedef unsigned long long  UINT64;
        typedef unsigned long long  UINTN;

        extern int klee_range(int,int,const char*);

        static inline UINT8 IoRead8(UINTN Port) {
            return (UINT8)klee_range(0, 256, "IoRead8_ret");
        }

        /* ─── x86 / SMM helper structs ─────────────────────────────── */
        typedef struct { UINT16 Limit; UINTN Base; } IA32_DESCRIPTOR;
        typedef struct { UINT64 _reserved; }         SMRAM_SAVE_STATE_MAP;
        typedef struct { UINT32 _raw; }              CPUID_VERSION_INFO_ECX;
        typedef struct { UINT32 _raw; }              CPUID_VERSION_INFO_EDX;
        typedef UINT8                                X86_ASSEMBLY_PATCH_LABEL;

        /* Dummy shim so #include \"SmmProfileArch.h\" succeeds */
        #ifndef _SMM_PROFILE_ARCH_H_
        #define _SMM_PROFILE_ARCH_H_
        typedef struct { UINT8 _dummy; } SMM_PROFILE_ARCH_PLACEHOLDER;
        #endif

        /* ─── frequently-used EDK II macros / globals ──────────────── */
        #ifndef PcdGet32
        # define PcdGet32(TokenName) (0U)
        #endif
        #ifndef _PCD_GET_MODE_32_PcdSmmLegacyPropertyMask
        # define _PCD_GET_MODE_32_PcdSmmLegacyPropertyMask 0U
        #endif

        #ifndef CHAR16
        typedef UINT16 CHAR16;
        #endif
        extern CHAR16 SmmLegacyVariableName[];

        /* a dummy SMM stack base to satisfy references */
        static UINT64 mSmmStackArrayBase = 0;

        #ifndef EFI_STATUS
        typedef UINT64 EFI_STATUS;
        #endif

        typedef struct _EFI_MM_SYSTEM_TABLE EFI_MM_SYSTEM_TABLE;
        static char _gMmst_blob[1] = {0};
        static EFI_MM_SYSTEM_TABLE *gMmst = (EFI_MM_SYSTEM_TABLE *)_gMmst_blob;

        #endif /* STASE_REGISTER_STUBS_H */
    """)

    (stub_dir / "register_stubs.h").write_text(header_text)

    # Optionally copy the real header if you still want the full struct
    real_hdr = src_root / "UefiCpuPkg/PiSmmCpuDxeSmm/Ia32/SmmProfileArch.h"
    if real_hdr.exists():
        shutil.copy(real_hdr, stub_dir)

    print(f"[✓] Wrote stub header → {stub_dir}/register_stubs.h")
    return stub_dir



def main() -> None:
    if len(sys.argv) != 2:
        print("Usage: python3 setup_edk2_environment.py <edk2-src>")
        sys.exit(1)

    src = Path(sys.argv[1]).resolve()
    validate_path(src, "EDK2")

    ws = next_workspace()
    instr_src = ws / "instrumented_source"
    copy_source_tree(src, instr_src)

    # still copy any helper C stubs
    helper = Path(__file__).with_name("uefi_helper_stubs.c")
    if helper.exists():
        shutil.copy(helper, ws / "uefi_helper_stubs.c")
        print("[✓] Copied uefi_helper_stubs.c")

    # preprocessing passes
    subprocess.run(["python3", "process_headerfiles.py", str(instr_src), "--out-dir", str(ws)], check=True)
    subprocess.run(["python3", "comment_out_static_assert.py", str(instr_src), "--out-dir", str(ws)], check=True)
    subprocess.run(["python3", "extract_protocol_guids.py", str(instr_src), "--out-dir", str(ws)], check=True)

    # NEW: generate universal stubs
    write_stub_header(src, ws)

    print(f"[✓] Setup completed in {ws}/")


if __name__ == "__main__":
    main()
