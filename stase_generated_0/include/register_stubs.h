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

/* Dummy shim so #include "SmmProfileArch.h" succeeds */
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
