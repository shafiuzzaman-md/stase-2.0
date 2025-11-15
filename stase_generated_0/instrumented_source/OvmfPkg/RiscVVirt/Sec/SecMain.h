/** @file
  Master header file for SecCore.

  Copyright (c) 2022, Ventana Micro Systems Inc. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef SEC_MAIN_H_
#define SEC_MAIN_H_

#include "../../../MdePkg/Include/PiPei.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdeModulePkg/Include/Library/DebugAgentLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/ExtractGuidedSectionLib.h"
#include "../../../MdePkg/Include/Library/IoLib.h"
#include "../../../MdePkg/Include/Library/HobLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/PeCoffExtraActionLib.h"
#include "../../../MdePkg/Include/Library/PeCoffGetEntryPointLib.h"
#include "../../../MdePkg/Include/Library/PeCoffLib.h"
#include "../../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../../MdePkg/Include/Library/PeiServicesTablePointerLib.h"
#include "../../../MdePkg/Include/Library/DebugPrintErrorLevelLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/BaseRiscVSbiLib.h"
#include "../../../EmbeddedPkg/Include/Library/PrePiLib.h"
#include "../../Include/Library/PlatformInitLib.h"
#include "../../../EmbeddedPkg/Include/Library/PrePiHobListPointerLib.h"
#include "../../../MdePkg/Include/Library/SerialPortLib.h"
#include <Register/RiscV64/RiscVImpl.h>

/**
  Entry point to the C language phase of SEC. After the SEC assembly
  code has initialized some temporary memory and set up the stack,
  the control is transferred to this function.

  @param SizeOfRam           Size of the temporary memory available for use.
  @param TempRamBase         Base address of temporary ram
  @param BootFirmwareVolume  Base address of the Boot Firmware Volume.
**/
VOID
NORETURN
EFIAPI
SecStartup (
  IN  UINTN  BootHartId,
  IN  VOID   *DeviceTreeAddress
  );

/**
  Auto-generated function that calls the library constructors for all of the module's
  dependent libraries.  This function must be called by the SEC Core once a stack has
  been established.

**/
VOID
EFIAPI
ProcessLibraryConstructorList (
  VOID
  );

/**
  Perform Platform PEIM initialization.

  @return EFI_SUCCESS     The platform initialized successfully.
  @retval  Others        - As the error code indicates

**/
EFI_STATUS
EFIAPI
PlatformPeimInitialization (
  VOID
  );

/**
  Perform Memory PEIM initialization.

  @return EFI_SUCCESS     The platform initialized successfully.
  @retval  Others        - As the error code indicates

**/
EFI_STATUS
EFIAPI
MemoryPeimInitialization (
  VOID
  );

/**
  Perform CPU PEIM initialization.

  @return EFI_SUCCESS     The platform initialized successfully.
  @retval  Others        - As the error code indicates

**/
EFI_STATUS
EFIAPI
CpuPeimInitialization (
  VOID
  );

#endif
