/** @file
  The header file for SMM SwDispatch2 module.

  Copyright (c) 2021, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef SMM_SW_DISPATCH2_H_
#define SMM_SW_DISPATCH2_H_

#include "../../MdePkg/Include/PiDxe.h"
#include "../../MdePkg/Include/Protocol/SmmSwDispatch2.h"
#include "../../MdePkg/Include/Protocol/SmmCpu.h"
#include "../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/IoLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../Include/Guid/SmmRegisterInfoGuid.h"
#include "../../MdePkg/Include/Library/HobLib.h"

#define SMI_SW_HANDLER_SIGNATURE  SIGNATURE_32('s','s','w','h')
#define MAXIMUM_SWI_VALUE         0xFF
#define SMM_CONTROL_PORT          0xB2
#define SMM_DATA_PORT             0xB3

typedef struct {
  UINTN         Signature;
  LIST_ENTRY    Link;
  EFI_HANDLE    DispatchHandle;
  UINTN         SwSmiInputValue;
  UINTN         DispatchFunction;
} EFI_SMM_SW_DISPATCH2_CONTEXT;

#endif
