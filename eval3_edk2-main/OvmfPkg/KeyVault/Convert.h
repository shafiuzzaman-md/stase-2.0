// Convert.h
//
// Header for UCS-2 to ISO-2022-KR character set conversion routines.
//

#ifndef _CONVERT_H_
#define _CONVERT_H_

#include <PiSmm.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>

///
/// Convert a UCS-2 encoded string to ISO-2022-KR encoded output buffer.
/// The conversion handles ASCII, Hangul, Hanja, and Symbol ranges using external lookup tables.
///
/// @param[in]  Buf        Pointer to UCS-2 encoded input string (CHAR8 cast of UINT16 array).
/// @param[in]  Length     Length of the input string in bytes.
/// @param[out] Outbuf     Output buffer to hold ISO-2022-KR encoded result.
/// @param[in]  OutLength  Length of the output buffer in bytes.
///
/// @retval EFI_SUCCESS            Conversion succeeded.
/// @retval EFI_OUT_OF_RESOURCES  Output buffer too small or mapping failed.
///
EFI_STATUS
UCS2ToISO2022KR (
  IN  CHAR8   *Buf,
  IN  UINTN    Length,
  OUT CHAR8   *Outbuf,
  IN  UINTN    OutLength
  );

#endif // _CONVERT_H_