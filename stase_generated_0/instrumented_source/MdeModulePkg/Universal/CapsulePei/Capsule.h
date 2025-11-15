/** @file

Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>

SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _CAPSULE_PEIM_H_
#define _CAPSULE_PEIM_H_

#include "../../../MdePkg/Include/PiPei.h"
#include "../../../MdePkg/Include/Uefi/UefiSpec.h"

#include "../../../MdePkg/Include/Ppi/Capsule.h"
#include "../../../MdePkg/Include/Ppi/LoadFile.h"
#include "../../../MdePkg/Include/Ppi/ReadOnlyVariable2.h"
#include "../../Include/Guid/CapsuleVendor.h"

#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/PeimEntryPoint.h"
#include "../../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/HobLib.h"
#include "../../../MdePkg/Include/Library/PeiServicesTablePointerLib.h"
#include "../../../MdePkg/Include/Library/PrintLib.h"
#include "../../../MdePkg/Include/Library/PeCoffLib.h"
#include "../../../MdePkg/Include/Library/PeCoffGetEntryPointLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/ReportStatusCodeLib.h"
#include "../../Include/Library/DebugAgentLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/IndustryStandard/PeImage.h"
#include "Common/CommonHeader.h"

#ifdef MDE_CPU_IA32

  #pragma pack(1)

//
// Page-Map Level-4 Offset (PML4) and
// Page-Directory-Pointer Offset (PDPE) entries 4K & 2MB
//

typedef union {
  struct {
    UINT64    Present              : 1;  // 0 = Not present in memory, 1 = Present in memory
    UINT64    ReadWrite            : 1;  // 0 = Read-Only, 1= Read/Write
    UINT64    UserSupervisor       : 1;  // 0 = Supervisor, 1=User
    UINT64    WriteThrough         : 1;  // 0 = Write-Back caching, 1=Write-Through caching
    UINT64    CacheDisabled        : 1;  // 0 = Cached, 1=Non-Cached
    UINT64    Accessed             : 1;  // 0 = Not accessed, 1 = Accessed (set by CPU)
    UINT64    Reserved             : 1;  // Reserved
    UINT64    MustBeZero           : 2;  // Must Be Zero
    UINT64    Available            : 3;  // Available for use by system software
    UINT64    PageTableBaseAddress : 40; // Page Table Base Address
    UINT64    AvabilableHigh       : 11; // Available for use by system software
    UINT64    Nx                   : 1;  // No Execute bit
  } Bits;
  UINT64    Uint64;
} PAGE_MAP_AND_DIRECTORY_POINTER;

//
// Page Table Entry 2MB
//
typedef union {
  struct {
    UINT64    Present              : 1;  // 0 = Not present in memory, 1 = Present in memory
    UINT64    ReadWrite            : 1;  // 0 = Read-Only, 1= Read/Write
    UINT64    UserSupervisor       : 1;  // 0 = Supervisor, 1=User
    UINT64    WriteThrough         : 1;  // 0 = Write-Back caching, 1=Write-Through caching
    UINT64    CacheDisabled        : 1;  // 0 = Cached, 1=Non-Cached
    UINT64    Accessed             : 1;  // 0 = Not accessed, 1 = Accessed (set by CPU)
    UINT64    Dirty                : 1;  // 0 = Not Dirty, 1 = written by processor on access to page
    UINT64    MustBe1              : 1;  // Must be 1
    UINT64    Global               : 1;  // 0 = Not global page, 1 = global page TLB not cleared on CR3 write
    UINT64    Available            : 3;  // Available for use by system software
    UINT64    PAT                  : 1;  //
    UINT64    MustBeZero           : 8;  // Must be zero;
    UINT64    PageTableBaseAddress : 31; // Page Table Base Address
    UINT64    AvabilableHigh       : 11; // Available for use by system software
    UINT64    Nx                   : 1;  // 0 = Execute Code, 1 = No Code Execution
  } Bits;
  UINT64    Uint64;
} PAGE_TABLE_ENTRY;

//
// Page Table Entry 1GB
//
typedef union {
  struct {
    UINT64    Present              : 1;  // 0 = Not present in memory, 1 = Present in memory
    UINT64    ReadWrite            : 1;  // 0 = Read-Only, 1= Read/Write
    UINT64    UserSupervisor       : 1;  // 0 = Supervisor, 1=User
    UINT64    WriteThrough         : 1;  // 0 = Write-Back caching, 1=Write-Through caching
    UINT64    CacheDisabled        : 1;  // 0 = Cached, 1=Non-Cached
    UINT64    Accessed             : 1;  // 0 = Not accessed, 1 = Accessed (set by CPU)
    UINT64    Dirty                : 1;  // 0 = Not Dirty, 1 = written by processor on access to page
    UINT64    MustBe1              : 1;  // Must be 1
    UINT64    Global               : 1;  // 0 = Not global page, 1 = global page TLB not cleared on CR3 write
    UINT64    Available            : 3;  // Available for use by system software
    UINT64    PAT                  : 1;  //
    UINT64    MustBeZero           : 17; // Must be zero;
    UINT64    PageTableBaseAddress : 22; // Page Table Base Address
    UINT64    AvabilableHigh       : 11; // Available for use by system software
    UINT64    Nx                   : 1;  // 0 = Execute Code, 1 = No Code Execution
  } Bits;
  UINT64    Uint64;
} PAGE_TABLE_1G_ENTRY;

  #pragma pack()

typedef
EFI_STATUS
(*COALESCE_ENTRY) (
  SWITCH_32_TO_64_CONTEXT  *EntrypointContext,
  SWITCH_64_TO_32_CONTEXT  *ReturnContext
  );

#endif

#endif
