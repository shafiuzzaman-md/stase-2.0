/** @file
  Save Non-Volatile Variables to a file system.

  Copyright (c) 2009 - 2011, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef __NV_VARS_FILE_LIB_INSTANCE__
#define __NV_VARS_FILE_LIB_INSTANCE__

#include "../../../MdePkg/Include/Uefi.h"

#include "../../../MdePkg/Include/Guid/FileInfo.h"

#include "../../../MdePkg/Include/Protocol/SimpleFileSystem.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/FileHandleLib.h"
#include "../../Include/Library/SerializeVariablesLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"

/**
  Loads the non-volatile variables from the NvVars file on the
  given file system.

  @param[in]  FsHandle - Handle for a gEfiSimpleFileSystemProtocolGuid instance

  @return     EFI_STATUS based on the success or failure of load operation

**/
EFI_STATUS
LoadNvVarsFromFs (
  EFI_HANDLE  FsHandle
  );

/**
  Saves the non-volatile variables into the NvVars file on the
  given file system.

  @param[in]  FsHandle - Handle for a gEfiSimpleFileSystemProtocolGuid instance

  @return     EFI_STATUS based on the success or failure of load operation

**/
EFI_STATUS
SaveNvVarsToFs (
  EFI_HANDLE  FsHandle
  );

#endif
