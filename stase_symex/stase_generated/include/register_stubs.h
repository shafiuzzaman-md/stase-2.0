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

