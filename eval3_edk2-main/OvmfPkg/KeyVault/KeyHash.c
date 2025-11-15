//
// KeyHash.c
//
// Provides cryptographic hashing support for the KeyVault driver.
// Includes both a custom "AltHash" and a SHA-256-compatible implementation.
//

#include "KeyHash.h"

///
/// Alternative lightweight hash used for obfuscation-like use cases.
///
VOID
AltHash (
  VOID           *RawBuffer,
  UINTN           Length,
  HASH_CONTENT    H,
  UINTN           Passes
  )
{
  UINTN   HashSize = sizeof (HASH_CONTENT);
  CHAR8  *HRaw     = (CHAR8 *)H;
  CHAR8  *Buf      = (CHAR8 *)RawBuffer;

  if (Length == 0) {
    SetMem (H, HashSize, 0);
    return;
  }

  if (Length < HashSize) {
    CopyMem (H, RawBuffer, Length);
    for (UINTN i = Length; i < HashSize; ++i) {
      HRaw[i] = Buf[i % Length];
    }
  } else {
    for (UINTN i = 0; i < Length * Passes; i += 13) {
      HRaw[i % HashSize] = Buf[i % Length];
    }
  }

  UINTN BlockSize  = sizeof (H[0]);
  UINTN BlockCount = HashSize / BlockSize;

  for (UINTN p = 0; p < Passes; ++p) {
    for (UINTN i = 0; i < BlockCount; ++i) {
      UINT32 Block = H[i];
      Block = (Block >> 2) ^ (Block << 3);
      UINTN  j = ((i + 1) * p) % BlockCount;
      Block ^= H[j];
      H[i] = Block;
    }
  }
}

///
/// Standard SHA-256 compatible hash computation routine.
///
VOID
CalculateHash (
  VOID         *RawBuffer,
  UINTN         Length,
  HASH_CONTENT  H
  )
{
  KVH_MESSAGE_BLOCK  MessageBlock;
  UINTN              NumberBitsRead = 0;
  KVH_STATUS         State = READ;

  UINT32 A, B, C, D, E, F, G, H0;
  UINTN  J;
  UINT32 T1, T2;
  UINT32 W[64];

  CONST UINT32 K[64] = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
    0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
    0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
    0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
    0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
  };

  CONST UINT32 H_TEMPLATE[8] = {
    0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
    0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
  };

  CopyMem (H, H_TEMPLATE, sizeof (H_TEMPLATE));

  while (FillMessageBlock (RawBuffer, Length, &MessageBlock, &State, &NumberBitsRead)) {
    for (J = 0; J < 16; ++J) {
      W[J] = CheckIsBigEndian () ? MessageBlock.t[J] : ByteSwap32 (MessageBlock.t[J]);
    }
    for (J = 16; J < 64; ++J) {
      W[J] = SIG1 (W[J - 2]) + W[J - 7] + SIG0 (W[J - 15]) + W[J - 16];
    }

    A = H[0]; B = H[1]; C = H[2]; D = H[3];
    E = H[4]; F = H[5]; G = H[6]; H0 = H[7];

    for (J = 0; J < 64; ++J) {
      T1 = H0 + _SIG1 (E) + CH (E, F, G) + K[J] + W[J];
      T2 = _SIG0 (A) + MAJ (A, B, C);

      H0 = G;
      G = F;
      F = E;
      E = D + T1;
      D = C;
      C = B;
      B = A;
      A = T1 + T2;
    }

    H[0] += A; H[1] += B; H[2] += C; H[3] += D;
    H[4] += E; H[5] += F; H[6] += G; H[7] += H0;
  }
}

UINTN
FillMessageBlock (
  IN      VOID                *RawBuffer,
  IN      UINTN               Length,
  IN OUT  KVH_MESSAGE_BLOCK   *MessageBlock,
  IN OUT  KVH_STATUS          *State,
  IN OUT  UINTN               *NumberBitsRead
  )
{
  UINTN NumberBytesLeft = Length - (*NumberBitsRead / 8);

  if (*State == FINISH) {
    return 0;
  }

  if (*State == PAD0 || *State == PAD1) {
    SetMem (MessageBlock->e, 56, 0);
    MessageBlock->s[7] = ByteSwap64 (*NumberBitsRead);
    *State = FINISH;
    return 1;
  }

  UINTN BytesToRead = (NumberBytesLeft > 64) ? 64 : NumberBytesLeft;
  CopyMem (MessageBlock->e, RawBuffer, BytesToRead);
  *NumberBitsRead += BytesToRead * 8;

  if (BytesToRead < 56) {
    MessageBlock->e[BytesToRead] = 0x80;
    SetMem (&MessageBlock->e[BytesToRead + 1], 56 - (BytesToRead + 1), 0);
    MessageBlock->s[7] = ByteSwap64 (*NumberBitsRead);
    *State = FINISH;
  } else if (BytesToRead < 64) {
    *State = PAD0;
    MessageBlock->e[BytesToRead] = 0x80;
    SetMem (&MessageBlock->e[BytesToRead + 1], 64 - (BytesToRead + 1), 0);
  } else if (BytesToRead == 0) {
    *State = PAD1;
  }

  return 1;
}

BOOLEAN
CheckIsBigEndian (VOID)
{
  UINTN N = 1;
  return (*(CHAR8 *)&N != 1);
}

UINT32 ROTR (UINT32 x, UINT16 a) { return (x >> a) | (x << (32 - a)); }
UINT32 SHR  (UINT32 x, UINT16 b) { return (x >> b); }
UINT32 SIG0 (UINT32 x) { return ROTR (x, 7) ^ ROTR (x, 18) ^ SHR (x, 3); }
UINT32 SIG1 (UINT32 x) { return ROTR (x, 17) ^ ROTR (x, 19) ^ SHR (x, 10); }
UINT32 _SIG0 (UINT32 x) { return ROTR (x, 2) ^ ROTR (x, 13) ^ ROTR (x, 22); }
UINT32 _SIG1 (UINT32 x) { return ROTR (x, 6) ^ ROTR (x, 11) ^ ROTR (x, 25); }
UINT32 CH (UINT32 x, UINT32 y, UINT32 z) { return (x & y) ^ (~x & z); }
UINT32 MAJ (UINT32 x, UINT32 y, UINT32 z) { return (x & y) ^ (x & z) ^ (y & z); }
