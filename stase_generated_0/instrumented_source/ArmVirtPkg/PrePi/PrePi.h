/** @file
*
*  Copyright (c) 2011-2012, ARM Limited. All rights reserved.
*
*  SPDX-License-Identifier: BSD-2-Clause-Patent
*
**/

#ifndef _PREPI_H_
#define _PREPI_H_

#include "../../MdePkg/Include/PiPei.h"

#include "../../MdePkg/Include/Library/PcdLib.h"
#include "../../ArmPkg/Include/Library/ArmLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/IoLib.h"
#include "../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"
#include "../../MdePkg/Include/Library/SerialPortLib.h"

#define SerialPrint(txt)  SerialPortWrite (txt, AsciiStrLen(txt)+1);

RETURN_STATUS
EFIAPI
TimerConstructor (
  VOID
  );

VOID
PrePiMain (
  IN  UINTN   UefiMemoryBase,
  IN  UINTN   StacksBase,
  IN  UINT64  StartTimeStamp
  );

EFI_STATUS
EFIAPI
MemoryPeim (
  IN EFI_PHYSICAL_ADDRESS  UefiMemoryBase,
  IN UINT64                UefiMemorySize
  );

EFI_STATUS
EFIAPI
PlatformPeim (
  VOID
  );

// Either implemented by PrePiLib or by MemoryInitPei
VOID
BuildMemoryTypeInformationHob (
  VOID
  );

// Initialize the Architecture specific controllers
VOID
ArchInitialize (
  VOID
  );

#endif /* _PREPI_H_ */
