/** @file
  Master header files for DxeCorePerformanceLib instance.

  This header file holds the prototypes of the Performance and PerformanceEx Protocol published by this
  library instance at its constructor.

Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#ifndef _DXE_CORE_PERFORMANCE_LIB_INTERNAL_H_
#define _DXE_CORE_PERFORMANCE_LIB_INTERNAL_H_

#include "../../../MdePkg/Include/PiDxe.h"

#include "../../Include/Guid/Performance.h"
#include "../../Include/Guid/PerformanceMeasurement.h"
#include "../../Include/Guid/ExtendedFirmwarePerformance.h"
#include "../../Include/Guid/ZeroGuid.h"
#include "../../../MdePkg/Include/Guid/EventGroup.h"
#include "../../Include/Guid/FirmwarePerformance.h"
#include "../../Include/Guid/PiSmmCommunicationRegionTable.h"

#include "../../../MdePkg/Include/Protocol/DriverBinding.h"
#include "../../../MdePkg/Include/Protocol/LoadedImage.h"
#include "../../../MdePkg/Include/Protocol/ComponentName2.h"
#include "../../../MdePkg/Include/Protocol/DevicePathToText.h"
#include "../../../MdePkg/Include/Protocol/SmmCommunication.h"

#include "../../../MdePkg/Include/Library/PerformanceLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/HobLib.h"
#include "../../../MdePkg/Include/Library/BaseLib.h"
#include "../../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../../MdePkg/Include/Library/TimerLib.h"
#include "../../../MdePkg/Include/Library/PcdLib.h"
#include "../../../MdePkg/Include/Library/DevicePathLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"
#include "../../../MdePkg/Include/Library/UefiRuntimeServicesTableLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/UefiLib.h"
#include "../../../MdePkg/Include/Library/ReportStatusCodeLib.h"
#include "../../../MdePkg/Include/Library/DxeServicesLib.h"
#include "../../../MdePkg/Include/Library/PeCoffGetEntryPointLib.h"

/**
  Create performance record with event description and a timestamp.

  @param CallerIdentifier  - Image handle or pointer to caller ID GUID.
  @param Guid              - Pointer to a GUID.
  @param String            - Pointer to a string describing the measurement.
  @param TimeStamp         - 64-bit time stamp.
  @param Address           - Pointer to a location in memory relevant to the measurement.
  @param Identifier        - Performance identifier describing the type of measurement.
  @param Attribute         - The attribute of the measurement. According to attribute can create a start
                             record for PERF_START/PERF_START_EX, or a end record for PERF_END/PERF_END_EX,
                             or a general record for other Perf macros.

  @retval EFI_SUCCESS           - Successfully created performance record.
  @retval EFI_OUT_OF_RESOURCES  - Ran out of space to store the records.
  @retval EFI_INVALID_PARAMETER - Invalid parameter passed to function - NULL
                                  pointer or invalid PerfId.
**/
EFI_STATUS
EFIAPI
CreatePerformanceMeasurement (
  IN CONST VOID                        *CallerIdentifier  OPTIONAL,
  IN CONST VOID                        *Guid      OPTIONAL,
  IN CONST CHAR8                       *String    OPTIONAL,
  IN       UINT64                      TimeStamp  OPTIONAL,
  IN       UINT64                      Address    OPTIONAL,
  IN       UINT32                      Identifier,
  IN       PERF_MEASUREMENT_ATTRIBUTE  Attribute
  );

#endif
