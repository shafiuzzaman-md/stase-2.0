/** @file
  Master header file for Hardware Light Control.


**/
#ifndef _SMM_LIGHT_H_
#define _SMM_LIGHT_H_

#include "../../MdePkg/Include/Library/PcdLib.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../MdePkg/Include/Protocol/SmmCommunication.h"
#include "../../MdePkg/Include/Guid/EventGroup.h"
#include "../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../MdePkg/Include/Library/MmServicesTableLib.h"
#include "../../MdePkg/Include/Protocol/MmReportStatusCodeHandler.h"

// #include <Protocol/Led.h>

#define REGISTER_RSC           0x1
#define RE_REGISTER_RSC        0x2
#define UNREGISTER_FROM_RSC    0x3

typedef enum {
  LIGHT_OFF = 0x0,
  SLOW_FLASH = 0x10,
  MED_FLASH,
  FAST_FLASH,
  SOS,
  STEADY_ON,
  MAX_LIGHT_TYPE
} LIGHT_STATUS_TYPES;


typedef struct {
  UINTN         Function;
  EFI_STATUS    ReturnStatus;
  BOOLEAN       Disable;             
} SMM_LIGHT_FUNCTION_COMMUNICATION;

//
// Size of SMM communicate header, without including the payload.
//
#define SMM_COMMUNICATE_HEADER_SIZE  (OFFSET_OF (EFI_SMM_COMMUNICATE_HEADER, Data))

//
// Size of Smm Function Communication struct.
//
#define SMM_LIGHT_FUNCTION_COMMUNICATION_SIZE  (sizeof(SMM_LIGHT_FUNCTION_COMMUNICATION))

typedef struct _EFI_MM_FRONTPANEL_LED_PROTOCOL EFI_MM_FRONTPANEL_LED_PROTOCOL;

typedef
EFI_STATUS
(EFIAPI *EFI_LED_STATUS_FUNCTION)(
  IN EFI_MM_FRONTPANEL_LED_PROTOCOL    *This
  );

struct _EFI_MM_FRONTPANEL_LED_PROTOCOL {
  UINTN Index;
  UINTN Function;
  UINTN Duration;
  EFI_LED_STATUS_FUNCTION StatusUpdate;
};

#endif