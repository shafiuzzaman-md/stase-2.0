/** @file
  Include file for platform variable cleanup.

Copyright (c) 2015, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _PLAT_VAR_CLEANUP_
#define _PLAT_VAR_CLEANUP_

#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../Include/Library/HiiLib.h"
#include "../../Include/Library/PlatformVarCleanupLib.h"

#include "../../../MdePkg/Include/Protocol/Variable.h"
#include "../../Include/Protocol/VarCheck.h"
#include "../../../MdePkg/Include/Protocol/FormBrowser2.h"
#include "../../../MdePkg/Include/Protocol/HiiConfigAccess.h"
#include "../../../MdePkg/Include/Protocol/HiiConfigRouting.h"
#include "../../../BaseTools/Source/C/Include/Protocol/DevicePath.h"

#include "../../../MdePkg/Include/Guid/EventGroup.h"
#include "../../Include/Guid/MdeModuleHii.h"
#include "../../../MdePkg/Include/Guid/ImageAuthentication.h"
#include "../../Include/Guid/VarErrorFlag.h"

#include "PlatVarCleanupHii.h"

//
// This is the generated IFR binary data for each formset defined in VFR.
// This data array is ready to be used as input of HiiAddPackages() to
// create a packagelist (which contains Form packages, String packages, etc).
//
extern UINT8  PlatVarCleanupBin[];

//
// This is the generated String package data for all .UNI files.
// This data array is ready to be used as input of HiiAddPackages() to
// create a packagelist (which contains Form packages, String packages, etc).
//
extern UINT8  PlatformVarCleanupLibStrings[];

#define USER_VARIABLE_NODE_SIGNATURE  SIGNATURE_32 ('U', 'V', 'N', 'S')

typedef struct {
  UINTN         Signature;
  LIST_ENTRY    Link;
  EFI_GUID      Guid;
  CHAR16        *PromptString;
  LIST_ENTRY    NameLink;
} USER_VARIABLE_NODE;

#define USER_VARIABLE_FROM_LINK(a)  CR (a, USER_VARIABLE_NODE, Link, USER_VARIABLE_NODE_SIGNATURE)

#define USER_VARIABLE_NAME_NODE_SIGNATURE  SIGNATURE_32 ('U', 'V', 'N', 'N')

typedef struct {
  UINTN              Signature;
  LIST_ENTRY         Link;
  CHAR16             *Name;
  UINTN              DataSize;
  UINT32             Attributes;
  UINT16             Index;
  EFI_QUESTION_ID    QuestionId;
  CHAR16             *PromptString;
  CHAR16             *HelpString;
  BOOLEAN            Deleted;
} USER_VARIABLE_NAME_NODE;

#define USER_VARIABLE_NAME_FROM_LINK(a)  CR (a, USER_VARIABLE_NAME_NODE, Link, USER_VARIABLE_NAME_NODE_SIGNATURE)

#pragma pack(1)
//
// HII specific Vendor Device Path definition.
//
typedef struct {
  VENDOR_DEVICE_PATH          VendorDevicePath;
  EFI_DEVICE_PATH_PROTOCOL    End;
} HII_VENDOR_DEVICE_PATH;
#pragma pack()

#define VARIABLE_CLEANUP_HII_PRIVATE_SIGNATURE  SIGNATURE_32 ('V', 'C', 'H', 'P')

typedef struct {
  UINTN                              Signature;
  EFI_HANDLE                         DriverHandle;
  EFI_HII_HANDLE                     HiiHandle;
  EFI_HII_CONFIG_ACCESS_PROTOCOL     ConfigAccess;
  EFI_HII_CONFIG_ROUTING_PROTOCOL    *ConfigRouting;
  VARIABLE_CLEANUP_DATA              VariableCleanupData;
} VARIABLE_CLEANUP_HII_PRIVATE_DATA;

#define VARIABLE_CLEANUP_HII_PRIVATE_FROM_THIS(a)  CR (a, VARIABLE_CLEANUP_HII_PRIVATE_DATA, ConfigAccess, VARIABLE_CLEANUP_HII_PRIVATE_SIGNATURE)

#endif
