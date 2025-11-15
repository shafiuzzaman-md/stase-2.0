/** @file
  The header file of bootloader support SMM.

  Copyright (c) 2021, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef BL_SUPPORT_SMM_H_
#define BL_SUPPORT_SMM_H_

#include "../../MdePkg/Include/PiDxe.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/IoLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"
#include "../../UefiCpuPkg/Include/Library/MtrrLib.h"
#include "../../MdePkg/Include/Library/UefiLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../MdePkg/Include/Library/PciLib.h"
#include "../../MdePkg/Include/Protocol/SmmSwDispatch2.h"
#include "../../MdePkg/Include/Protocol/SmmAccess2.h"
#include "../../MdePkg/Include/Protocol/MpService.h"
#include "../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
// #include <Register/Intel/ArchitecturalMsr.h>
#include "../Include/Guid/SmmRegisterInfoGuid.h"
#include "../Include/Guid/SmmS3CommunicationInfoGuid.h"
#include "../../MdePkg/Include/Guid/SmramMemoryReserve.h"

#define  EFI_MSR_SMRR_MASK            0xFFFFF000
#define  MSR_SMM_FEATURE_CONTROL      0x4E0
#define  SMRAM_SAVE_STATE_MAP_OFFSET  0xFC00    /// Save state offset from SMBASE

typedef struct {
  UINT32    Base;
  UINT32    Mask;
} SMRR_BASE_MASK;

#endif
