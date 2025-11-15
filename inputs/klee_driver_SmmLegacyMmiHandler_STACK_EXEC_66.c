// Auto-generated driver for SmmLegacyMmiHandler
#include "../stase_generated_last/global_stubs.h"
#include "../stase_generated_last/global_stub_defs.c"
#include "../stase_generated_last/uefi_helper_stubs.c"
#include "../stase_symex/klee/klee.h"
#include <string.h>
#include <stdlib.h>
#include "../stase_generated_8/instrumented_source/UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.h"

// ----- user globals -----
CHAR16 SmmLegacyVariableName[64];

// Instrumented entry-point source
#include "../stase_generated_last/instrumented_source/UefiCpuPkg/PiSmmCpuDxeSmm/SmmLegacy.c"

int main(void) {
    // Symbolic variables
    VOID* CommBuffer = malloc(sizeof(VOID));
    klee_make_symbolic(CommBuffer, sizeof(VOID), "CommBuffer");
    UINTN* CommBufferSize = malloc(sizeof(UINTN));
    klee_make_symbolic(CommBufferSize, sizeof(UINTN), "CommBufferSize");

    // Entry-point parameters (default init)
    IN EFI_HANDLE DispatchHandle = 0;
    IN CONST VOID *RegisterContext = NULL;

    // Concrete initialisation / constraints
    klee_make_symbolic(SmmLegacyVariableName, sizeof(SmmLegacyVariableName), "SmmLegacyVariableName");

    // Call entry-point
    SmmLegacyMmiHandler(DispatchHandle, RegisterContext, CommBuffer, CommBufferSize);
    return 0;
}
