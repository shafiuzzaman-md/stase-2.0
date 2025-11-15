/** @file
  The header file for Boot Script Executer module.

  This driver is dispatched by Dxe core and the driver will reload itself to ACPI reserved memory
  in the entry point. The functionality is to interpret and restore the S3 boot script

Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
Copyright (c) 2017, AMD Incorporated. All rights reserved.<BR>

SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _BOOT_SCRIPT_EXECUTOR_H_
#define _BOOT_SCRIPT_EXECUTOR_H_

#include "../../../../MdePkg/Include/PiDxe.h"

#include "../../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../../MdePkg/Include/Library/S3BootScriptLib.h"
#include "../../../../MdePkg/Include/Library/PeCoffLib.h"
#include "../../../../MdePkg/Include/Library/DxeServicesLib.h"
#include "../../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../../MdePkg/Include/Library/CacheMaintenanceLib.h"
#include "../../../../MdePkg/Include/Library/TimerLib.h"
#include "../../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../Include/Library/DebugAgentLib.h"
#include "../../../Include/Library/LockBoxLib.h"
#include "../../../Include/Library/CpuExceptionHandlerLib.h"
#include "../../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../../MdePkg/Include/Library/DxeServicesTableLib.h"

#include "../../../Include/Guid/AcpiS3Context.h"
#include "../../../Include/Guid/BootScriptExecutorVariable.h"
#include "../../../Include/Guid/MemoryProfile.h"

#include "../../../../MdePkg/Include/Protocol/DxeSmmReadyToLock.h"
#include "../../../../MdePkg/Include/IndustryStandard/Acpi.h"

#define PAGING_1G_ADDRESS_MASK_64  0x000FFFFFC0000000ull

/**
  a ASM function to transfer control to OS.

  @param  S3WakingVector  The S3 waking up vector saved in ACPI Facs table
  @param  AcpiLowMemoryBase a buffer under 1M which could be used during the transfer
**/
VOID
AsmTransferControl (
  IN   UINT32  S3WakingVector,
  IN   UINT32  AcpiLowMemoryBase
  );

/**
  a 32bit ASM function to transfer control to OS.

  @param  S3WakingVector  The S3 waking up vector saved in ACPI Facs table
  @param  AcpiLowMemoryBase a buffer under 1M which could be used during the transfer
**/
VOID
AsmTransferControl32 (
  IN   UINT32  S3WakingVector,
  IN   UINT32  AcpiLowMemoryBase
  );

/**
  a 16bit ASM function to transfer control to OS.
**/
VOID
AsmTransferControl16 (
  VOID
  );

/**
  Set a IDT entry for interrupt vector 3 for debug purpose.

  @param  AcpiS3Context  a pointer to a structure of ACPI_S3_CONTEXT

**/
VOID
SetIdtEntry (
  IN ACPI_S3_CONTEXT  *AcpiS3Context
  );

extern UINT32   AsmFixAddress16;
extern UINT32   AsmJmpAddr32;
extern BOOLEAN  mPage1GSupport;
extern UINT64   mAddressEncMask;

#endif //_BOOT_SCRIPT_EXECUTOR_H_
