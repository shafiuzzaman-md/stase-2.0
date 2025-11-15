/** @file
  Reset System Library functions for OVMF

  Copyright (c) 2006 - 2019, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "../../../MdePkg/Include/Base.h"
#include "../../../MdePkg/Include/PiDxe.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/DxeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/IoLib.h"
#include "../../../MdeModulePkg/Include/Library/ResetSystemLib.h"
#include "../../../MdePkg/Include/Library/TimerLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeLib.h"
#include "../../Include/OvmfPlatforms.h"

EFI_STATUS
EFIAPI
DxeResetSystemLibMicrovmConstructor (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{
  UINTN                            Address = MICROVM_GED_MMIO_BASE;
  EFI_STATUS                       Status;
  EFI_GCD_MEMORY_SPACE_DESCRIPTOR  Descriptor;

  DEBUG ((DEBUG_INFO, "%a: start\n", __func__));

  Status = gDS->GetMemorySpaceDescriptor (Address, &Descriptor);
  if (EFI_ERROR (Status)) {
    DEBUG ((DEBUG_INFO, "%a: GetMemorySpaceDescriptor failed\n", __func__));
    return RETURN_UNSUPPORTED;
  }

  Status = gDS->SetMemorySpaceAttributes (
                  Address,
                  SIZE_4KB,
                  Descriptor.Attributes | EFI_MEMORY_RUNTIME
                  );
  if (EFI_ERROR (Status)) {
    DEBUG ((DEBUG_INFO, "%a: SetMemorySpaceAttributes failed\n", __func__));
    return RETURN_UNSUPPORTED;
  }

  DEBUG ((DEBUG_INFO, "%a: done\n", __func__));
  return EFI_SUCCESS;
}
