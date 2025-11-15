/** @file
Head file for BDS Platform specific code

Copyright (c) 2016, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent
**/

#ifndef PLATFORM_CONSOLE_H_
#define PLATFORM_CONSOLE_H_

#include "../../../MdePkg/Include/PiDxe.h"
#include "../../../MdePkg/Include/IndustryStandard/Pci.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Protocol/PciIo.h"

#define IS_PCI_ISA_PDECODE(_p)  IS_CLASS3 (_p, PCI_CLASS_BRIDGE, PCI_CLASS_BRIDGE_ISA_PDECODE, 0)

//
// Type definitions
//

//
// Platform Root Bridge
//
typedef struct {
  ACPI_HID_DEVICE_PATH        PciRootBridge;
  EFI_DEVICE_PATH_PROTOCOL    End;
} PLATFORM_ROOT_BRIDGE_DEVICE_PATH;

typedef
EFI_STATUS
(EFIAPI *SIMPLE_PROTOCOL_INSTANCE_CALLBACK)(
  IN EFI_HANDLE            Handle,
  IN VOID                 *Instance
  );

/**
  @param[in]  Handle - Handle of PCI device instance
  @param[in]  PciIo - PCI IO protocol instance
  @param[in]  Pci - PCI Header register block
**/
typedef
EFI_STATUS
(EFIAPI *VISIT_PCI_INSTANCE_CALLBACK)(
  IN EFI_HANDLE           Handle,
  IN EFI_PCI_IO_PROTOCOL  *PciIo,
  IN PCI_TYPE00           *Pci
  );

/**
  Platform console init. Include the platform firmware vendor, revision
  and so crc check.

**/
VOID
EFIAPI
PlatformConsoleInit (
  VOID
  );

#endif
