/** @file
  Internal function header for Redfish Platform Config Library.

  (C) Copyright 2021 Hewlett Packard Enterprise Development LP<BR>
  Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef REDFISH_PLATFORM_CONFIG_H_
#define REDFISH_PLATFORM_CONFIG_H_

#include "../../../MdePkg/Include/Uefi.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../Include/Library/RedfishPlatformConfigLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"

#include "../../Include/Protocol/EdkIIRedfishPlatformConfig.h"

///
/// Definition of REDFISH_PLATFORM_CONFIG_LIB_PRIVATE
///
typedef struct {
  EFI_EVENT                                 ProtocolEvent; ///< Protocol notification event.
  VOID                                      *Registration; ///< Protocol notification registration.
  EDKII_REDFISH_PLATFORM_CONFIG_PROTOCOL    *Protocol;
} REDFISH_PLATFORM_CONFIG_LIB_PRIVATE;

#endif
