/** @file
The library call to pass the device tree to DXE via HOB.

Copyright (c) 2021, Hewlett Packard Enterprise Development LP. All rights reserved.<BR>

SPDX-License-Identifier: BSD-2-Clause-Patent

**/

//
//// The package level header files this module uses
////
#include "../../../MdePkg/Include/PiPei.h"

#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/HobLib.h"

/**
  Cpu Peim initialization.

**/
EFI_STATUS
CpuPeimInitialization (
  VOID
  )
{
  //
  // for MMU type >= sv39
  //
  BuildCpuHob (56, 32);

  return EFI_SUCCESS;
}
