/** @file

  Copyright (c) 2011-2014, ARM Limited. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "../../MdePkg/Include/PiPei.h"

#include "../Include/Library/ArmPlatformLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"
#include "../../MdePkg/Include/Library/PcdLib.h"

EFI_STATUS
EFIAPI
PlatformPeim (
  VOID
  )
{
  BuildFvHob (PcdGet64 (PcdFvBaseAddress), PcdGet32 (PcdFvSize));

  return EFI_SUCCESS;
}
