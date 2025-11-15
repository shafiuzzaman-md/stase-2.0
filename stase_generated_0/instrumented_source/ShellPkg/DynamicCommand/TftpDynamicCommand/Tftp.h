/** @file
  Header file for 'tftp' command functions.

  Copyright (c) 2010 - 2017, Intel Corporation. All rights reserved. <BR>
  Copyright (c) 2015, ARM Ltd. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _TFTP_H_
#define _TFTP_H_

#include "../../../MdePkg/Include/Uefi.h"

#include "../../../MdePkg/Include/Protocol/HiiPackageList.h"
#include "../../../MdePkg/Include/Protocol/ServiceBinding.h"
#include "../../../MdePkg/Include/Protocol/Mtftp4.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../Include/Library/ShellLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdeModulePkg/Include/Library/HiiLib.h"
#include "../../../NetworkPkg/Include/Library/NetLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdeModulePkg/Include/Library/UefiHiiServicesLib.h"

extern EFI_HII_HANDLE  mTftpHiiHandle;

typedef struct {
  UINTN    FileSize;
  UINTN    DownloadedNbOfBytes;
  UINTN    LastReportedNbOfBytes;
} DOWNLOAD_CONTEXT;

/**
  Function for 'tftp' command.

  @param[in]  ImageHandle     The image handle.
  @param[in]  SystemTable     The system table.

  @retval SHELL_SUCCESS            Command completed successfully.
  @retval SHELL_INVALID_PARAMETER  Command usage error.
  @retval SHELL_ABORTED            The user aborts the operation.
  @retval value                    Unknown error.
**/
SHELL_STATUS
RunTftp (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  );

/**
  Retrieve HII package list from ImageHandle and publish to HII database.

  @param ImageHandle            The image handle of the process.

  @return HII handle.
**/
EFI_HII_HANDLE
InitializeHiiPackage (
  EFI_HANDLE  ImageHandle
  );

#endif // _TFTP_H_
