/** @file
  Legacy BIOS Platform support

  Copyright (c) 2006 - 2011, Intel Corporation. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef LEGACY_BIOS_PLATFORM_H_
#define LEGACY_BIOS_PLATFORM_H_

#include "../Include/FrameworkDxe.h"

#include "../../../MdePkg/Include/Protocol/PciIo.h"
#include "../../../MdePkg/Include/Protocol/PciRootBridgeIo.h"
#include "../../../BaseTools/Source/C/Include/Protocol/DevicePath.h"
#include "../Include/Protocol/LegacyInterrupt.h"
#include "../../../MdePkg/Include/Protocol/LegacyRegion2.h"
#include "../Include/Protocol/LegacyBiosPlatform.h"
#include "../Include/Protocol/FirmwareVolume.h"
#include "../../../MdePkg/Include/Protocol/DiskInfo.h"

#include "../../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/IoLib.h"
#include "../../../MdePkg/Include/Library/PciLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/DxeServicesLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"

#include "../../../MdePkg/Include/IndustryStandard/Pci.h"

//
// PIRQ information constants.
//
#define MAX_IRQ_ROUTING_ENTRIES   6
#define MAX_IRQ_PRIORITY_ENTRIES  7

#define V_INTEL_VENDOR_ID      0x8086
#define V_PIIX4_IDE_DEVICE_ID  0x7010

//
// Type declarations
//
typedef struct {
  UINT8     SetupValue;
  UINT16    DeviceType;
  UINT8     Class;
  UINT8     SubClass;
} EFI_SETUP_BBS_MAP;

typedef struct {
  UINT8    Class;
  UINT8    SubClass;
} PCI_CLASS_RECORD;

typedef struct {
  EFI_LEGACY_PIRQ_TABLE_HEADER    PirqTable;
  EFI_LEGACY_IRQ_ROUTING_ENTRY    IrqRoutingEntry[MAX_IRQ_ROUTING_ENTRIES];
} EFI_LEGACY_PIRQ_TABLE;

typedef struct {
  EFI_HANDLE    Handle;
  UINT16        Vid;
  UINT16        Did;
  UINT16        SvId;
  UINT16        SysId;
} DEVICE_STRUCTURE;

typedef struct {
  EFI_GUID    FileName;
  UINTN       Valid;
} SYSTEM_ROM_TABLE;

typedef struct {
  UINT32                               Signature;
  EFI_HANDLE                           Handle;
  EFI_LEGACY_BIOS_PLATFORM_PROTOCOL    LegacyBiosPlatform;
  EFI_HANDLE                           ImageHandle;
  EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL      *PciRootBridgeIo;
} LEGACY_BIOS_PLATFORM_INSTANCE;

#define LEGACY_BIOS_PLATFORM_INSTANCE_SIGNATURE  SIGNATURE_32('P','B','I','O')

#define LEGACY_BIOS_PLATFORM_INSTANCE_FROM_THIS(this) \
  CR (this, \
      LEGACY_BIOS_PLATFORM_INSTANCE, \
      LegacyBiosPlatform, \
      LEGACY_BIOS_PLATFORM_INSTANCE_SIGNATURE \
      )

#endif
