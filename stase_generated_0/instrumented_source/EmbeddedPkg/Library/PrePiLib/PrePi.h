/** @file
  Library that helps implement monolithic PEI (i.e. PEI part of SEC)

  Copyright (c) 2008 - 2009, Apple Inc. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _PI_PEI_H_
#define _PI_PEI_H_

#include "../../../MdePkg/Include/PiPei.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../Include/Library/PrePiLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/UefiDecompressLib.h"
#include "../../../MdePkg/Include/Library/PeCoffLib.h"
#include "../../../MdePkg/Include/Library/CacheMaintenanceLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/TimerLib.h"
#include "../../../MdePkg/Include/Library/PerformanceLib.h"

#include "../../../MdePkg/Include/Guid/MemoryAllocationHob.h"

#define GET_HOB_TYPE(Hob)     ((Hob).Header->HobType)
#define GET_HOB_LENGTH(Hob)   ((Hob).Header->HobLength)
#define GET_NEXT_HOB(Hob)     ((Hob).Raw + GET_HOB_LENGTH (Hob))
#define END_OF_HOB_LIST(Hob)  (GET_HOB_TYPE (Hob) == EFI_HOB_TYPE_END_OF_HOB_LIST)

//
// Get the data and data size field of GUID
//
#define GET_GUID_HOB_DATA(GuidHob)       ((VOID *) (((UINT8 *) &((GuidHob)->Name)) + sizeof (EFI_GUID)))
#define GET_GUID_HOB_DATA_SIZE(GuidHob)  (((GuidHob)->Header).HobLength - sizeof (EFI_HOB_GUID_TYPE))

#endif
