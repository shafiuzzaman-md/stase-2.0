/** @file
  HddPassword PEI module which is used to unlock HDD password for S3.

  Copyright (c) 2019, Intel Corporation. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _HDD_PASSWORD_PEI_H_
#define _HDD_PASSWORD_PEI_H_

#include "../../MdePkg/Include/PiPei.h"
#include "../../MdePkg/Include/IndustryStandard/Atapi.h"

#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../MdePkg/Include/Library/PeimEntryPoint.h"
#include "../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../MdePkg/Include/Library/PciLib.h"
#include "../../MdeModulePkg/Include/Library/LockBoxLib.h"

#include "../../MdeModulePkg/Include/Ppi/AtaPassThru.h"

#include "HddPasswordCommon.h"

//
// Time out value for ATA PassThru PPI
//
#define ATA_TIMEOUT  30000000

#endif
