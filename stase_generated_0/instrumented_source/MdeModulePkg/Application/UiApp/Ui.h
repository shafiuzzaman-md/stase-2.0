/** @file
  FrontPage routines to handle the callbacks and browser calls

Copyright (c) 2011 - 2015, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _BDS_MODULE_H_
#define _BDS_MODULE_H_

#include "../../../MdePkg/Include/IndustryStandard/SmBios.h"

#include "../../Include/Guid/MdeModuleHii.h"
#include "../../../MdePkg/Include/Guid/StatusCodeDataTypeId.h"

#include "../../../MdePkg/Include/Protocol/Smbios.h"
#include "../../../MdePkg/Include/Protocol/HiiConfigAccess.h"

#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/ReportStatusCodeLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../Include/Library/HiiLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../Include/Library/UefiHiiServicesLib.h"
#include "../../Include/Library/UefiBootManagerLib.h"

#pragma pack(1)

///
/// HII specific Vendor Device Path definition.
///
typedef struct {
  VENDOR_DEVICE_PATH          VendorDevicePath;
  EFI_DEVICE_PATH_PROTOCOL    End;
} HII_VENDOR_DEVICE_PATH;

#pragma pack()

//
// The interface functions related to the Setup Browser Reset Reminder feature
//

/**
  Record the info that a reset is required.
  A module boolean variable is used to record whether a reset is required.

**/
VOID
EFIAPI
EnableResetRequired (
  VOID
  );

/**
  Check whether platform policy enables the reset reminder feature. The default is enabled.

**/
BOOLEAN
EFIAPI
IsResetReminderFeatureEnable (
  VOID
  );

/**
  Check if the user changed any option setting that needs a system reset to be effective.

**/
BOOLEAN
EFIAPI
IsResetRequired (
  VOID
  );

/**
  Check whether a reset is needed, and finish the reset reminder feature.
  If a reset is needed, pop up a menu to notice user, and finish the feature
  according to the user selection.

**/
VOID
EFIAPI
SetupResetReminder (
  VOID
  );

#endif
