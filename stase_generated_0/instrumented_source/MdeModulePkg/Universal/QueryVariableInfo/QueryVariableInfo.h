/** @file
  Master header file for Query Variable Info.

**/

#ifndef _QUERY_VARIABLE_INFO_H_
#define _QUERY_VARIABLE_INFO_H_

#include "../../../MdePkg/Include/PiSmm.h"
#include "../../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../../MdePkg/Include/Library/MmServicesTableLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"


typedef struct {
  UINT32   Attributes;
  UINTN    MaximumVariableStorageSize;
  UINTN    RemainingVariableStorageSize;
  UINTN    MaximumVariableSize;
} QUERY_VARIABLE_INFO;

#endif
