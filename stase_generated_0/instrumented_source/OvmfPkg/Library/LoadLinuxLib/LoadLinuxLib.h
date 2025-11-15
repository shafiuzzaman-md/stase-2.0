/** @file
  Boot UEFI Linux.

  Copyright (c) 2008 - 2013, Intel Corporation. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _LOAD_LINUX_LIB_INCLUDED_
#define _LOAD_LINUX_LIB_INCLUDED_

#include "../../../MdePkg/Include/Uefi.h"
#include "../../Include/Library/LoadLinuxLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"

#include "../../Include/IndustryStandard/LinuxBzimage.h"

#include "../../../BaseTools/Source/C/Include/Protocol/GraphicsOutput.h"

VOID
EFIAPI
JumpToKernel (
  VOID  *KernelStart,
  VOID  *KernelBootParams
  );

VOID
EFIAPI
JumpToUefiKernel (
  EFI_HANDLE        ImageHandle,
  EFI_SYSTEM_TABLE  *SystemTable,
  VOID              *KernelBootParams,
  VOID              *KernelStart
  );

VOID
InitLinuxDescriptorTables (
  VOID
  );

VOID
SetLinuxDescriptorTables (
  VOID
  );

#endif
