/** @file
  Sample to provide SecTemporaryRamDone function.

  Copyright (c) 2014 - 2016, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "../../../MdePkg/Include/PiPei.h"

#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../Include/Library/FspWrapperApiLib.h"
#include "../../Include/Library/FspWrapperPlatformLib.h"
#include "../../../IntelFsp2Pkg/Include/Guid/FspHeaderFile.h"

/**
This interface disables temporary memory in SEC Phase.
**/
VOID
EFIAPI
SecPlatformDisableTemporaryMemory (
  VOID
  )
{
  EFI_STATUS       Status;
  VOID             *TempRamExitParam;
  FSP_INFO_HEADER  *FspHeader;

  FspHeader = FspFindFspHeader (PcdGet32 (PcdFspmBaseAddress));
  if (FspHeader == NULL) {
    return;
  }

  DEBUG ((DEBUG_INFO, "SecPlatformDisableTemporaryMemory enter\n"));

  TempRamExitParam = UpdateTempRamExitParam ();
  Status           = CallTempRamExit (TempRamExitParam);
  DEBUG ((DEBUG_INFO, "TempRamExit status: 0x%x\n", Status));
  ASSERT_EFI_ERROR (Status);

  return;
}
