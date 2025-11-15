/** @file
  Opal Password PEI driver which is used to unlock Opal Password for S3.

Copyright (c) 2016 - 2019, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _OPAL_PASSWORD_PEI_H_
#define _OPAL_PASSWORD_PEI_H_

#include "../../../../MdePkg/Include/PiPei.h"

#include "../../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../../MdePkg/Include/Library/IoLib.h"
#include "../../../../MdePkg/Include/Library/PciLib.h"
#include "../../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../../MdePkg/Include/Library/PeimEntryPoint.h"
#include "../../../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../../../MdeModulePkg/Include/Library/LockBoxLib.h"
#include "../../../Include/Library/TcgStorageOpalLib.h"
#include "../../../Include/Library/Tcg2PhysicalPresenceLib.h"
#include "../../../../MdePkg/Include/Library/PeiServicesTablePointerLib.h"

#include "../../../../MdePkg/Include/Protocol/StorageSecurityCommand.h"

#include "../../../../MdeModulePkg/Include/Ppi/IoMmu.h"
#include "../../../../MdeModulePkg/Include/Ppi/StorageSecurityCommand.h"

#include "OpalPasswordCommon.h"

//
// The generic command timeout value (unit in us) for Storage Security Command
// PPI ReceiveData/SendData services
//
#define SSC_PPI_GENERIC_TIMEOUT  30000000

#pragma pack(1)

#define OPAL_PEI_DEVICE_SIGNATURE  SIGNATURE_32 ('o', 'p', 'd', 's')

typedef struct {
  UINTN                                    Signature;
  EFI_STORAGE_SECURITY_COMMAND_PROTOCOL    Sscp;
  OPAL_DEVICE_LOCKBOX_DATA                 *Device;
  VOID                                     *Context;
  EDKII_PEI_STORAGE_SECURITY_CMD_PPI       *SscPpi;
  UINTN                                    DeviceIndex;
} OPAL_PEI_DEVICE;

#define OPAL_PEI_DEVICE_FROM_THIS(a)    \
  CR (a, OPAL_PEI_DEVICE, Sscp, OPAL_PEI_DEVICE_SIGNATURE)

#pragma pack()

#endif // _OPAL_PASSWORD_PEI_H_
