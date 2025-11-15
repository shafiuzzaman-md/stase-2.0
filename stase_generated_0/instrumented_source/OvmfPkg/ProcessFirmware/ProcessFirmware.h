#ifndef __PROCESS_FIRMWARE_H__
#define __PROCESS_FIRMWARE_H__

#include "../../MdePkg/Include/Library/MmServicesTableLib.h"
#include "../../MdePkg/Include/Library/BaseLib.h"
#include "../../MdePkg/Include/Library/BaseMemoryLib.h"
#include "../../MdePkg/Include/Library/DebugLib.h"
#include "../../MdePkg/Include/Library/SmmMemLib.h"
#include "../../MdeModulePkg/Include/Protocol/SmmVariable.h"
#include "../../MdeModulePkg/Include/Protocol/SmmMemoryAttribute.h"
#include "../../MdeModulePkg/Include/Protocol/SmmLegacyDispatch.h"
#include "../../MdePkg/Include/Library/SmmServicesTableLib.h"
#include "../../MdePkg/Include/Library/IoLib.h"

extern EFI_GUID gEfiProcessFirmwareProtocolGuid;
extern EFI_GUID gEfiProcessFirmwareReadyProtocolGuid;

#define BC_FW_MAGIC   0x6f70cf5d3f2470bd
#define FC_FW_MAGIC   0x6bec5f938ad898ff
#define LC_FW_MAGIC   0xe439af1936e6e990
#define TS_FW_MAGIC   0x4b28b858e9fda6b
#define VR_FW_MAGIC   0x02719ce80e6c7e4

#define TS_VALIDATE_CHECKSUM(input) \
  (((input) ^ 0x5a734ef5cdd672d7) ^                        \
  (((input) << 1) ^ (0x9224b8f0d1b099dd)) ^                \
  (((input) << 5) ^ 0x11c34479c98ef014) ^                  \
  (((input) >> 15) * 0x11c34479c98ef014) ^                 \
  (((input) << 11) + 0xb9441d43a9faa98d) ^                 \
  (((input) * 0xe38fc692d7f847e) ^ ((input) >> 1)) ^       \
  (((input) * 0x51a8a38dd5379662) + ((input) >> 2)) ^      \
  (((input) << 7) - 0x6b5929c24bffd462) ^                  \
  (((input) * 0xe26e3da9f5ad886e) + ((input) << 3)) ^      \
  (((input) * 0xd6a468ab13a1cc2) - ((input) >> 6)) ^       \
  (((input) >> 13) + 0x60385dee98c649b5) ^                 \
  (((input) * 0xa81b1efddf71176) - ((input) >> 4)) ^       \
  (((input) >> 9) * 0x11a36fc0da444b8) ^                   \
  (((input) >> 3) + 0x34be67bc741abfe2) ^                  \
  (((input) * 0x6764377d4333a2f2) + ((input) << 5)) ^      \
  (((input) >> 1) * 0xcd183fe7ccf1ff60) ^                  \
  (((input) << 17) ^ 0x2fb766248b5c9fc6) ^                 \
  (((input) << 19) - 0x835d29d55e75f5fc))

#define BC_REG_ID         0x2a00
#define BC_REG_FUNC       0x2a04
#define BC_REG_VALUE      0x2a08
#define BC_REG_STATUS     BC_REG_VALUE

#define FC_REG_ID         0x2d00
#define FC_REG_FUNC       0x2d04
#define FC_REG_VALUE      0x2d08
#define FC_REG_STATUS     FC_REG_VALUE

#define LC_REG_ID         0x2b00
#define LC_REG_FUNC       0x2b04
#define LC_REG_VALUE      0x2b08
#define LC_REG_STATUS     LC_REG_VALUE

#define TS_REG_ID         0x2e00
#define TS_REG_FUNC       0x2e04
#define TS_REG_VALUE      0x2e08
#define TS_REG_STATUS     TS_REG_VALUE

#define VR_REG_ID         0x2f00
#define VR_REG_FUNC       0x2f04
#define VR_REG_VALUE      0x2f08
#define VR_REG_STATUS     VR_REG_VALUE

#define BC_FUNC_LOAD    0xff
#define FC_FUNC_LOAD    0xff
#define LC_FUNC_LOAD    0xff
#define TS_FUNC_LOAD    0xff
#define VR_FUNC_LOAD    0xff

EFI_STATUS
EFIAPI
BCCheckFirmware (
  UINT64 *Settings,
  VOID   *Buffer
);

EFI_STATUS
EFIAPI
BCLoadFirmware (
  UINT64 Id,
  UINT64 *Settings
);

EFI_STATUS
EFIAPI
FCCheckFirmware (
  UINT64 *Settings,
  VOID   *Buffer
);

EFI_STATUS
EFIAPI
FCLoadFirmware (
  UINT64 Id,
  UINT64 *Settings
);

EFI_STATUS
EFIAPI
LCCheckFirmware (
  UINT64 *Settings,
  VOID   *Buffer
);

EFI_STATUS
EFIAPI
LCLoadFirmware (
  UINT64 Id,
  UINT64 *Settings
);

EFI_STATUS
EFIAPI
TSCheckFirmware (
  UINT64 *Settings,
  VOID   *Buffer
);

EFI_STATUS
EFIAPI
TSLoadFirmware (
  UINT64 Id,
  UINT64 *Settings
);

EFI_STATUS
EFIAPI
VRCheckFirmware (
  UINT64 *Settings,
  VOID   *Buffer
);

EFI_STATUS
EFIAPI
VRLoadFirmware (
  UINT64 Id,
  UINT64 *Settings
);

typedef struct _PROCESS_FIRMWARE_PROTOCOL {
    EFI_STATUS (EFIAPI *BCCheckFirmware)(UINT64 *Settings, VOID *Buffer);
    EFI_STATUS (EFIAPI *BCLoadFirmware)(UINT64 Id, UINT64 *Settings);

    EFI_STATUS (EFIAPI *FCCheckFirmware)(UINT64 *Settings, VOID *Buffer);
    EFI_STATUS (EFIAPI *FCLoadFirmware)(UINT64 Id, UINT64 *Settings);

    EFI_STATUS (EFIAPI *LCCheckFirmware)(UINT64 *Settings, VOID *Buffer);
    EFI_STATUS (EFIAPI *LCLoadFirmware)(UINT64 Id, UINT64 *Settings);

    EFI_STATUS (EFIAPI *TSCheckFirmware)(UINT64 *Settings, VOID *Buffer);
    EFI_STATUS (EFIAPI *TSLoadFirmware)(UINT64 Id, UINT64 *Settings);

    EFI_STATUS (EFIAPI *VRCheckFirmware)(UINT64 *Settings, VOID *Buffer);
    EFI_STATUS (EFIAPI *VRLoadFirmware)(UINT64 Id, UINT64 *Settings);
} PROCESS_FIRMWARE_PROTOCOL;

#endif
