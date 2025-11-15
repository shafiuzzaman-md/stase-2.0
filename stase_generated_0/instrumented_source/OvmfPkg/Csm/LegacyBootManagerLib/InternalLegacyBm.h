/** @file

Copyright (c) 2011 - 2018, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _INTERNAL_LEGACY_BM_H_
#define _INTERNAL_LEGACY_BM_H_

#include "../../../MdePkg/Include/PiDxe.h"
#include "../Include/Guid/LegacyDevOrder.h"
#include "../../../MdePkg/Include/Guid/GlobalVariable.h"
#include "../Include/Protocol/LegacyBios.h"
#include "../../../MdePkg/Include/Protocol/PciRootBridgeIo.h"
#include "../../../MdePkg/Include/Protocol/PciIo.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdeModulePkg/Include/Library/UefiBootManagerLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/PerformanceLib.h"

#pragma pack(1)
typedef struct {
  UINT16    BbsIndex;
} LEGACY_BM_BOOT_OPTION_BBS_DATA;
#pragma pack()

/**
  Boot the legacy system with the boot option.

  @param  BootOption The legacy boot option which have BBS device path
                     On return, BootOption->Status contains the boot status.
                     EFI_UNSUPPORTED    There is no legacybios protocol, do not support
                                        legacy boot.
                     EFI_STATUS         The status of LegacyBios->LegacyBoot ().
**/
VOID
EFIAPI
LegacyBmBoot (
  IN  EFI_BOOT_MANAGER_LOAD_OPTION  *BootOption
  );

/**
  Refresh all legacy boot options.

**/
VOID
EFIAPI
LegacyBmRefreshAllBootOption (
  VOID
  );

#endif // _INTERNAL_LEGACY_BM_H_
