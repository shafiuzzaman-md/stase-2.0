//
// KeyHash.h
//
// Header for hashing operations used by the KeyVault driver.
// Defines a lightweight hash function and a SHA-256-like implementation.
//

#ifndef _KEYHASH_H_
#define _KEYHASH_H_

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

#define MAXCHAR 100000

///
/// Hash result buffer: 8 x 32-bit values (256 bits total).
///
typedef UINT32 HASH_CONTENT[8];

///
/// Byte swap helpers.
///
#define ByteSwap32(x) (\
  (((x) >> 24) & 0x000000FF) | \
  (((x) >> 8)  & 0x0000FF00) | \
  (((x) << 8)  & 0x00FF0000) | \
  (((x) << 24) & 0xFF000000))

#define ByteSwap64(x) (\
  (((x) >> 56) & 0x00000000000000FFULL) | \
  (((x) >> 40) & 0x000000000000FF00ULL) | \
  (((x) >> 24) & 0x0000000000FF0000ULL) | \
  (((x) >> 8)  & 0x00000000FF000000ULL) | \
  (((x) << 8)  & 0x000000FF00000000ULL) | \
  (((x) << 24) & 0x0000FF0000000000ULL) | \
  (((x) << 40) & 0x00FF000000000000ULL) | \
  (((x) << 56) & 0xFF00000000000000ULL))

///
/// SHA-like message block.
///
typedef union {
  UINT8   e[64];  ///< Byte-wise view
  UINT32  t[16];  ///< Word-wise view
  UINT64  s[8];   ///< Quad-word view
} KVH_MESSAGE_BLOCK;

///
/// Message padding state machine.
///
typedef enum {
  READ,
  PAD0,
  PAD1,
  FINISH
} KVH_STATUS;

// SHA-256-related functions
UINT32 SIG0  (UINT32 x);
UINT32 SIG1  (UINT32 x);
UINT32 ROTR  (UINT32 n, UINT16 x);
UINT32 SHR   (UINT32 n, UINT16 x);
UINT32 _SIG0 (UINT32 x);
UINT32 _SIG1 (UINT32 x);
UINT32 CH    (UINT32 x, UINT32 y, UINT32 z);
UINT32 MAJ   (UINT32 x, UINT32 y, UINT32 z);

// Utility and hashing routines
BOOLEAN CheckIsBigEndian (VOID);
VOID    CalculateHash    (VOID *RawBuffer, UINTN Length, HASH_CONTENT H);
UINTN   FillMessageBlock (VOID *RawBuffer, UINTN Length, KVH_MESSAGE_BLOCK *Block, KVH_STATUS *State, UINTN *BitsRead);
VOID    AltHash          (VOID *RawBuffer, UINTN Length, HASH_CONTENT H, UINTN Passes);

#endif // _KEYHASH_H_
