/** @file

  Copyright (c) 2011, ARM Limited. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "../../MdePkg/Include/PiPei.h"

//
// The protocols, PPI and GUID definitions for this module
//
#include "../../MdePkg/Include/Ppi/MasterBootMode.h"
#include "../../MdePkg/Include/Ppi/BootInRecoveryMode.h"
#include "../../MdePkg/Include/Ppi/GuidedSectionExtraction.h"
//
// The Library classes this module consumes
//
#include "../Include/Library/ArmPlatformLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"
#include "../../MdePkg/Include/Library/PeimEntryPoint.h"
#include "../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../MdePkg/Include/Library/PcdLib.h"

EFI_STATUS
EFIAPI
InitializePlatformPeim (
  IN       EFI_PEI_FILE_HANDLE  FileHandle,
  IN CONST EFI_PEI_SERVICES     **PeiServices
  );

EFI_STATUS
EFIAPI
PlatformPeim (
  VOID
  );

//
// Module globals
//
CONST EFI_PEI_PPI_DESCRIPTOR  mPpiListBootMode = {
  (EFI_PEI_PPI_DESCRIPTOR_PPI | EFI_PEI_PPI_DESCRIPTOR_TERMINATE_LIST),
  &gEfiPeiMasterBootModePpiGuid,
  NULL
};

CONST EFI_PEI_PPI_DESCRIPTOR  mPpiListRecoveryBootMode = {
  (EFI_PEI_PPI_DESCRIPTOR_PPI | EFI_PEI_PPI_DESCRIPTOR_TERMINATE_LIST),
  &gEfiPeiBootInRecoveryModePpiGuid,
  NULL
};

/*++

Routine Description:



Arguments:

  FileHandle  - Handle of the file being invoked.
  PeiServices - Describes the list of possible PEI Services.

Returns:

  Status -  EFI_SUCCESS if the boot mode could be set

--*/
EFI_STATUS
EFIAPI
InitializePlatformPeim (
  IN       EFI_PEI_FILE_HANDLE  FileHandle,
  IN CONST EFI_PEI_SERVICES     **PeiServices
  )
{
  EFI_STATUS     Status;
  EFI_BOOT_MODE  BootMode;

  DEBUG ((DEBUG_LOAD | DEBUG_INFO, "Platform PEIM Loaded\n"));

  Status = PeiServicesSetBootMode (ArmPlatformGetBootMode ());
  ASSERT_EFI_ERROR (Status);

  PlatformPeim ();

  Status = PeiServicesGetBootMode (&BootMode);
  ASSERT_EFI_ERROR (Status);

  Status = PeiServicesInstallPpi (&mPpiListBootMode);
  ASSERT_EFI_ERROR (Status);

  if (BootMode == BOOT_IN_RECOVERY_MODE) {
    Status = PeiServicesInstallPpi (&mPpiListRecoveryBootMode);
    ASSERT_EFI_ERROR (Status);
  }

  return Status;
}
