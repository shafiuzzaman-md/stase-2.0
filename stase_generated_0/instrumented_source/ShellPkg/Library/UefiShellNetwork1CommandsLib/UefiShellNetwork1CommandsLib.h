/** @file
  header file for NULL named library for network1 shell command functions.

  Copyright (c) 2010 - 2016, Intel Corporation. All rights reserved. <BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _UEFI_SHELL_NETWORK1_COMMANDS_LIB_H_
#define _UEFI_SHELL_NETWORK1_COMMANDS_LIB_H_

#include "../../../MdePkg/Include/Uefi.h"

#include "../../Include/Guid/ShellLibHiiGuid.h"

#include "../../../MdePkg/Include/Protocol/Cpu.h"
#include "../../../MdePkg/Include/Protocol/ServiceBinding.h"
#include "../../../MdePkg/Include/Protocol/Ip6.h"
#include "../../../MdePkg/Include/Protocol/Ip6Config.h"
#include "../../../MdePkg/Include/Protocol/Ip4.h"
#include "../../../MdePkg/Include/Protocol/Ip4Config2.h"
#include "../../../MdePkg/Include/Protocol/Arp.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../Include/Library/ShellCommandLib.h"
#include "../../Include/Library/ShellLib.h"
#include "../../../MdeModulePkg/Include/Library/SortLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdeModulePkg/Include/Library/HiiLib.h"
#include "../../../NetworkPkg/Include/Library/NetLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"

extern EFI_HII_HANDLE  gShellNetwork1HiiHandle;

/**
  Function for 'ping' command.

  @param[in] ImageHandle  Handle to the Image (NULL if Internal).
  @param[in] SystemTable  Pointer to the System Table (NULL if Internal).
**/
SHELL_STATUS
EFIAPI
ShellCommandRunPing (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  );

/**
  Function for 'ifconfig' command.

  @param[in] ImageHandle  Handle to the Image (NULL if Internal).
  @param[in] SystemTable  Pointer to the System Table (NULL if Internal).
**/
SHELL_STATUS
EFIAPI
ShellCommandRunIfconfig (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  );

#endif
