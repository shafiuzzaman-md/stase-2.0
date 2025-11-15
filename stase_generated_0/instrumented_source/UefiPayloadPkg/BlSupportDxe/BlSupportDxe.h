/** @file
  The header file of bootloader support DXE.

Copyright (c) 2021, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef __DXE_BOOTLOADER_SUPPORT_H__
#define __DXE_BOOTLOADER_SUPPORT_H__

#include "../../MdePkg/Include/PiDxe.h"

#include "../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../MdePkg/Include/Library/DxeServicesTableLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/UefiLib.h"
#include "../../MdePkg/Include/Library/IoLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"

#include "../../MdePkg/Include/Guid/SmBios.h"
#include "../Include/Guid/AcpiBoardInfoGuid.h"
#include "../../MdePkg/Include/Guid/GraphicsInfoHob.h"

#endif
