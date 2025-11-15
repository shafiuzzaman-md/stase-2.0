/** @file
  header file for Executing some code on the Smm Stack
**/

#ifndef _RDTSCONTROL_H_
#define _RDTSCONTROL_H_

#include "../../MdePkg/Include/PiSmm.h"
#include "../../MdePkg/Include/Library/UefiDriverEntryPoint.h"
#include "../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../MdePkg/Include/Library/MmServicesTableLib.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/SmmMemLib.h"
#include "../../MdeModulePkg/Include/Protocol/SmmVariable.h"
#include "../../MdeModulePkg/Include/Protocol/SmmMemoryAttribute.h"
#include "../../MdeModulePkg/Include/Protocol/SmmLegacyDispatch.h"

#define MAX_LENGTH 1024

typedef enum RDTSC_CONTROL_TYPE RDTSC_CONTROL_TYPE;

enum RDTSC_CONTROL_TYPE {
  TYPE_SET_RDTSC,
  TYPE_GET_RDTSC,
  TYPE_CLR_RDTSC
};

typedef struct {
  CHAR8     SetRdtsc[12];
  CHAR8     ClrRdtsc[12];
  CHAR8     GetRdtsc[12];
} RDTSC_CONTROL_OPS;

typedef struct {
  EFI_STATUS          Status;
  UINTN               Result;
  RDTSC_CONTROL_TYPE  Type;
  CHAR8               Data[1];
} RDTSC_CONTROL_DATA;

#endif
