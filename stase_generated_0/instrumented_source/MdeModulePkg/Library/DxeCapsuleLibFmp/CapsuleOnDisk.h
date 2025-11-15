/** @file
  Defines several datastructures used by Capsule On Disk feature.
  They are mainly used for FAT files.

  Copyright (c) 2019, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _CAPSULES_ON_DISK_H_
#define _CAPSULES_ON_DISK_H_

#include "../../../MdePkg/Include/Uefi.h"
#include "../../../MdePkg/Include/Pi/PiMultiPhase.h"

#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/FileHandleLib.h"
#include "../../Include/Library/CapsuleLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../Include/Library/UefiBootManagerLib.h"

#include "../../../MdePkg/Include/Protocol/SimpleFileSystem.h"
#include "../../../MdePkg/Include/Protocol/DiskIo.h"
#include "../../../MdePkg/Include/Protocol/BlockIo.h"

#include "../../Include/Guid/CapsuleVendor.h"
#include "../../../MdePkg/Include/Guid/FileInfo.h"
#include "../../../MdePkg/Include/Guid/GlobalVariable.h"

//
// This data structure is the part of FILE_INFO_ENTRY
//
#define FILE_INFO_SIGNATURE  SIGNATURE_32 ('F', 'L', 'I', 'F')

//
// LoadOptionNumber of the boot option where the capsules is relocated.
//
#define COD_RELOCATION_LOAD_OPTION_VAR_NAME  L"CodRelocationLoadOption"

//
// (20 * (6+5+2))+1) unicode characters from EFI FAT spec (doubled for bytes)
//
#define MAX_FILE_NAME_SIZE  522
#define MAX_FILE_NAME_LEN   (MAX_FILE_NAME_SIZE / sizeof(CHAR16))
#define MAX_FILE_INFO_LEN   (OFFSET_OF(EFI_FILE_INFO, FileName) + MAX_FILE_NAME_LEN)

typedef struct {
  UINTN            Signature;
  LIST_ENTRY       Link;                 ///  Linked list members.
  EFI_FILE_INFO    *FileInfo;            ///  Pointer to the FileInfo struct for this file or NULL.
  CHAR16           *FileNameFirstPart;   ///  Text to the left of right-most period in the file name. String is capitialized
  CHAR16           *FileNameSecondPart;  ///  Text to the right of right-most period in the file name.String is capitialized. Maybe NULL
} FILE_INFO_ENTRY;

typedef struct {
  //
  // image address.
  //
  VOID             *ImageAddress;
  //
  // The file info of the image comes from.
  //  if FileInfo == NULL. means image does not come from file
  //
  EFI_FILE_INFO    *FileInfo;
} IMAGE_INFO;

#endif // _CAPSULES_ON_DISK_H_
