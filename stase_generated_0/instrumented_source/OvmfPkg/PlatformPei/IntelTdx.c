/** @file
  Initialize Intel TDX support.

  Copyright (c) 2021, Intel Corporation. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include "../../MdePkg/Include/PiPei.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/HobLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../MdePkg/Include/IndustryStandard/Tdx.h"
#include "../Include/IndustryStandard/QemuFwCfg.h"
#include "../Include/Library/QemuFwCfgLib.h"
#include "../../MdePkg/Include/Library/PeiServicesLib.h"
#include "../../MdePkg/Include/Library/TdxLib.h"
#include "../Include/Library/TdxHelperLib.h"
#include "../Include/Library/PlatformInitLib.h"
#include "../Include/WorkArea.h"
#include "../../MdePkg/Include/ConfidentialComputingGuestAttr.h"
#include "Platform.h"

/**
  This Function checks if TDX is available, if present then it sets
  the dynamic PCDs for Tdx guest.
  **/
VOID
IntelTdxInitialize (
  VOID
  )
{
 #ifdef MDE_CPU_X64
  RETURN_STATUS  PcdStatus;

  if (!TdIsEnabled ()) {
    return;
  }

  TdxHelperBuildGuidHobForTdxMeasurement ();

  PcdStatus = PcdSet64S (PcdConfidentialComputingGuestAttr, CCAttrIntelTdx);
  ASSERT_RETURN_ERROR (PcdStatus);

  PcdStatus = PcdSet64S (PcdTdxSharedBitMask, TdSharedPageMask ());
  ASSERT_RETURN_ERROR (PcdStatus);

  PcdStatus = PcdSetBoolS (PcdSetNxForStack, TRUE);
  ASSERT_RETURN_ERROR (PcdStatus);
 #endif
}
