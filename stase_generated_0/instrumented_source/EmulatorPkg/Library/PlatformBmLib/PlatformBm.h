/*++ @file

Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
Portions copyright (c) 2011, Apple Inc. All rights reserved.
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _PLATFORM_BM_H
#define _PLATFORM_BM_H

#include "../../../MdePkg/Include/PiDxe.h"

#include "../../Include/Guid/EmuSystemConfig.h"
#include "../../../MdePkg/Include/Guid/EventGroup.h"
#include "../../Include/Protocol/EmuThunk.h"
#include "../../Include/Protocol/EmuIoThunk.h"
#include "../../Include/Protocol/EmuGraphicsWindow.h"
#include "../../../MdeModulePkg/Include/Protocol/GenericMemoryTest.h"
#include "../../../MdePkg/Include/Protocol/LoadedImage.h"
#include "../../../MdePkg/Include/Protocol/FirmwareVolume2.h"

#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdeModulePkg/Include/Library/UefiBootManagerLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdeModulePkg/Include/Library/BootLogoLib.h"
#include "../../../MdePkg/Include/Library/HobLib.h"
#include "../../../MdeModulePkg/Include/Library/HiiLib.h"

#define CONSOLE_OUT  0x00000001
#define STD_ERROR    0x00000002
#define CONSOLE_IN   0x00000004
#define CONSOLE_ALL  (CONSOLE_OUT | CONSOLE_IN | STD_ERROR)

typedef struct {
  EFI_DEVICE_PATH_PROTOCOL    *DevicePath;
  UINTN                       ConnectType;
} BDS_CONSOLE_CONNECT_ENTRY;

extern BDS_CONSOLE_CONNECT_ENTRY  gPlatformConsole[];

#define gEndEntire \
  { \
    END_DEVICE_PATH_TYPE,\
    END_ENTIRE_DEVICE_PATH_SUBTYPE,\
    { \
      END_DEVICE_PATH_LENGTH,\
      0\
    }\
  }

typedef struct {
  EMU_VENDOR_DEVICE_PATH_NODE    EmuBus;
  EMU_VENDOR_DEVICE_PATH_NODE    EmuGraphicsWindow;
  EFI_DEVICE_PATH_PROTOCOL       End;
} EMU_PLATFORM_UGA_DEVICE_PATH;

//
// Platform BDS Functions
//

/**
  Perform the memory test base on the memory test intensive level,
  and update the memory resource.

  @param  Level         The memory test intensive level.

  @retval EFI_STATUS    Success test all the system memory and update
                        the memory resource

**/
EFI_STATUS
PlatformBootManagerMemoryTest (
  IN EXTENDMEM_COVERAGE_LEVEL  Level
  );

VOID
PlatformBdsConnectSequence (
  VOID
  );

#endif // _PLATFORM_BM_H
