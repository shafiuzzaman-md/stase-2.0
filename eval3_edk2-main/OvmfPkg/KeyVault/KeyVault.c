//
// KeyVault SMM Driver
//
// Provides secure token-based vault management via MM communication.
//

#include "KeyVault.h"

KEY_VAULT_INFO      VaultInfo;
EFI_HANDLE          DispatchHandle;

//
// Compute how much space remains in a vault token data field after accounting for name and hash.
//
INTN
RemainingContentSpace (
  IN KEY_VAULT_COMM  *Buffer
  )
{
  UINTN  NameLength = AsciiStrLen (Buffer->TokenName) + 1;
  return TOKEN_DATA_SIZE - NameLength - sizeof (HASH_CONTENT);
}

//
// Validate whether the given buffer would exceed internal limits.
//
BOOLEAN
IsBufferOversized (
  IN KEY_VAULT_COMM  *Buffer
  )
{
  return RemainingContentSpace (Buffer) < Buffer->TokenContentLength;
}

//
// Retrieve actual content length from token layout.
//
UINTN
GetTokenContentLength (
  IN VAULT_TOKEN  *Token
  )
{
  CHAR8  *DataEnd       = ((CHAR8 *)Token->data) + TOKEN_DATA_SIZE;
  INTN   ContentLength  = DataEnd - Token->content;
  ASSERT (ContentLength > 0);
  return (UINTN)ContentLength;
}

//
// Initialize token memory layout from user buffer.
//
RETURN_STATUS
InitVaultTokenFromCommBuffer (
  IN  KEY_VAULT_COMM  *Buffer,
  OUT VAULT_TOKEN     *Token
  )
{
  RETURN_STATUS  Status;
  UINTN          Length;

  Length = AsciiStrnLenS (Buffer->TokenName, sizeof (Buffer->TokenName));
  if ((Length == 0) || (Length == sizeof (Buffer->TokenName))) {
    return EFI_INVALID_PARAMETER;
  }

  UINTN TotalSize = Length + 1 + sizeof (HASH_CONTENT) + Buffer->TokenContentLength;
  if (TotalSize > sizeof (Token->data)) {
    return EFI_INVALID_PARAMETER;
  }

  SetMem (Token, sizeof (VAULT_TOKEN), 0);
  VOID *Cursor = Token->data;

  Status = AsciiStrnCpyS (Cursor, sizeof (Token->data), Buffer->TokenName, Length + 1);
  if (EFI_ERROR (Status)) {
    goto fail;
  }
  Token->name = Cursor;
  Cursor = (CHAR8 *)Cursor + Length + 1;

  HASH_CONTENT Hash;
  AltHash (Buffer->TokenSecret, AsciiStrnLenS (Buffer->TokenSecret, sizeof (Buffer->TokenSecret)), Hash, HASH_PASSES);
  CopyMem (Cursor, Hash, sizeof (Hash));
  Token->hash = Cursor;
  Cursor = (CHAR8 *)Cursor + sizeof (Hash);

  CopyMem (Cursor, Buffer->TokenContent, Buffer->TokenContentLength);
  Token->content = Cursor;

  return EFI_SUCCESS;

fail:
  SetMem (Token, sizeof (VAULT_TOKEN), 0);
  return EFI_INVALID_PARAMETER;
}

//
// Compare token against expected name and hash.
//
BOOLEAN
TokenMatches (
  VAULT_TOKEN   *Token,
  CHAR8         *Name,
  HASH_CONTENT  Hash
  )
{
  return (AsciiStrCmp (Token->name, Name) == 0) &&
         (CompareMem (Token->hash, Hash, sizeof (HASH_CONTENT)) == 0);
}

//
// Allocate and register a new token.
//
EFI_STATUS
EFIAPI
CreateVaultKey (
  IN OUT KEY_VAULT_COMM  *Buffer
  )
{
  if (IsBufferOversized (Buffer)) {
    return EFI_INVALID_PARAMETER;
  }

  if ((VaultInfo.free == NULL) || (VaultInfo.count > VAULT_MAX_TOKENS)) {
    return EFI_OUT_OF_RESOURCES;
  }

  for (VAULT_CHUNK *current = VaultInfo.headToken; current != NULL; current = current->next) {
    if (AsciiStrCmp (current->token.name, Buffer->TokenName) == 0) {
      return EFI_INVALID_PARAMETER;
    }
  }

  VAULT_CHUNK *chunk = VaultInfo.free;
  VaultInfo.free = chunk->next;
  VaultInfo.count++;
  chunk->next = NULL;

  if (VaultInfo.headToken == NULL) {
    VaultInfo.headToken = chunk;
  } else {
    VAULT_CHUNK *current = VaultInfo.headToken;
    while (current->next != NULL) {
      current = current->next;
    }
    current->next = chunk;
  }

  SetMem (&chunk->token, sizeof (VAULT_TOKEN), 0);
  return InitVaultTokenFromCommBuffer (Buffer, &chunk->token);
}

//
// Locate token matching credentials.
//
EFI_STATUS
findToken (
  IN  KEY_VAULT_COMM  *Buffer,
  OUT VAULT_TOKEN     **Token,
  OUT VAULT_CHUNK     **Chunk
  )
{
  if (Token == NULL) {
    return EFI_INVALID_PARAMETER;
  }

  *Token = NULL;
  UINTN SecretLength = AsciiStrLen (Buffer->TokenSecret);
  HASH_CONTENT Hashed;
  AltHash (Buffer->TokenSecret, SecretLength, Hashed, HASH_PASSES);
  SetMem (Buffer->TokenSecret, sizeof (TOKEN_SECRET), 0);

  for (VAULT_CHUNK *chunk = VaultInfo.headToken; chunk != NULL; chunk = chunk->next) {
    if (!TokenMatches (&chunk->token, Buffer->TokenName, Hashed)) {
      continue;
    }

    *Token = &chunk->token;
    if (Chunk != NULL) {
      *Chunk = chunk;
    }

    return EFI_SUCCESS;
  }

  return EFI_NOT_FOUND;
}

//
// Retrieve and copy token content to caller.
//
EFI_STATUS
EFIAPI
ReadVaultKey (
  IN OUT KEY_VAULT_COMM  *Buffer
  )
{
  VAULT_TOKEN *Token = NULL;
  EFI_STATUS Status = findToken (Buffer, &Token, NULL);
  if (EFI_ERROR (Status)) {
    return Status;
  }

  UINTN Length = GetTokenContentLength (Token);
  CopyMem (Buffer->TokenContent, Token->content, Length);
  Buffer->TokenContentLength = Length;

  return EFI_SUCCESS;
}

//
// Delete matching token and return chunk to free pool.
//
EFI_STATUS
EFIAPI
DeleteVaultKey (
  IN OUT KEY_VAULT_COMM  *Buffer
  )
{
  VAULT_CHUNK *Chunk = NULL;
  VAULT_TOKEN *Token = NULL;
  EFI_STATUS Status = findToken (Buffer, &Token, &Chunk);
  if (EFI_ERROR (Status)) {
    return Status;
  }

  VAULT_CHUNK *prev = NULL;
  VAULT_CHUNK *cur = VaultInfo.headToken;

  while (cur != NULL) {
    if (cur == Chunk) {
      if (prev == NULL) {
        VaultInfo.headToken = cur->next;
      } else {
        prev->next = cur->next;
      }

      cur->next = VaultInfo.free;
      VaultInfo.free = cur;
      if (VaultInfo.count > 0) {
        VaultInfo.count--;
      } else {
        return EFI_ABORTED;
      }

      return EFI_SUCCESS;
    }

    prev = cur;
    cur = cur->next;
  }

  return EFI_NOT_FOUND;
}

//
// Convert vault token content from UCS2 to ISO2022-KR encoding.
//
EFI_STATUS
EFIAPI
ConvertVaultKey (
  IN OUT KEY_VAULT_COMM  *Buffer
  )
{
  VAULT_TOKEN *Token = NULL;
  EFI_STATUS Status = findToken (Buffer, &Token, NULL);
  if (EFI_ERROR (Status) || Token == NULL) {
    return Status;
  }

  UINTN ContentLength = GetTokenContentLength (Token);
  if (ContentLength == 0) {
    return EFI_INVALID_PARAMETER;
  }

  CHAR8 *Original;
  Status = gSmst->SmmAllocatePool (EfiRuntimeServicesData, ContentLength, (VOID **)&Original);
  if (EFI_ERROR (Status)) {
    return Status;
  }

  CopyMem (Original, Token->content, ContentLength);
  UINTN Available = (UINTN)((CHAR8 *)&Token->data[0] + sizeof (Token->data) - (CHAR8 *)Token->content);

  if ((Available == 0) || (Available > sizeof (Token->data))) {
    return EFI_INVALID_PARAMETER;
  }

  SetMem (Token->content, Available, 0);
  return UCS2ToISO2022KR (Original, ContentLength, Token->content, Available);
}

//
// MM handler dispatch entry point.
//
EFI_STATUS
EFIAPI
KeyVaultHandler (
  IN     EFI_HANDLE  DispatchHandle,
  IN     CONST VOID  *Context,
  IN OUT VOID        *CommBuffer,
  IN OUT UINTN       *CommBufferSize
  )
{
  if ((CommBuffer == NULL) || (CommBufferSize == NULL) || (*CommBufferSize < sizeof (KEY_VAULT_COMM))) {
    return EFI_SUCCESS;
  }

  KEY_VAULT_COMM *Buffer;
  EFI_STATUS Status = gSmst->SmmAllocatePool (EfiRuntimeServicesData, sizeof (KEY_VAULT_COMM), (VOID **)&Buffer);
  if (EFI_ERROR (Status)) {
    ((KEY_VAULT_COMM *)CommBuffer)->Status = EFI_OUT_OF_RESOURCES;
    return EFI_SUCCESS;
  }

  SetMem (Buffer, sizeof (KEY_VAULT_COMM), 0);
  CopyMem (Buffer, CommBuffer, sizeof (KEY_VAULT_COMM));

  if ((AsciiStrnLenS (Buffer->TokenName, sizeof (Buffer->TokenName)) == sizeof (Buffer->TokenName)) ||
      (AsciiStrnLenS (Buffer->TokenSecret, sizeof (Buffer->TokenSecret)) == sizeof (Buffer->TokenSecret))) {
    Buffer->Status = EFI_INVALID_PARAMETER;
    goto copy_back;
  }

  if (Buffer->TokenContentLength > sizeof (Buffer->TokenContent)) {
    Buffer->Status = EFI_INVALID_PARAMETER;
    goto copy_back;
  }

  if (Buffer->Action > VAULT_KEY_CONVERT) {
    Buffer->Status = EFI_INVALID_PARAMETER;
    goto copy_back;
  }

  switch (Buffer->Action) {
    case VAULT_KEY_CREATE:
      Status = CreateVaultKey (Buffer);
      break;
    case VAULT_KEY_READ:
      Status = ReadVaultKey (Buffer);
      break;
    case VAULT_KEY_DELETE:
      Status = DeleteVaultKey (Buffer);
      break;
    case VAULT_KEY_CONVERT:
      Status = ConvertVaultKey (Buffer);
      break;
    default:
      Status = EFI_INVALID_PARAMETER;
      break;
  }

  Buffer->Status = Status;

copy_back:
  CopyMem (CommBuffer, Buffer, sizeof (KEY_VAULT_COMM));
  return EFI_SUCCESS;
}

//
// Free allocated pages and unregister the MM handler.
//
EFI_STATUS
VaultKeyAbort (
  VOID
  )
{
  if (VaultInfo.BaseAddress != (EFI_PHYSICAL_ADDRESS)NULL) {
    gSmst->SmmFreePages (VaultInfo.BaseAddress, VAULT_PAGE_COUNT);
  }

  if (DispatchHandle != (EFI_HANDLE)NULL) {
    gMmst->MmiHandlerUnRegister (&DispatchHandle);
    DispatchHandle = (EFI_HANDLE)NULL;
  }

  return EFI_ABORTED;
}

//
// Initialization entry point for the KeyVault SMM driver.
//
EFI_STATUS
EFIAPI
KeyVaultInit (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{
  if (sizeof (EFI_PHYSICAL_ADDRESS) <= 4) {
    return EFI_ABORTED;
  }

  EFI_STATUS Status = gSmst->SmmAllocatePages (
                        AllocateAnyPages,
                        EfiRuntimeServicesData,
                        VAULT_PAGE_COUNT,
                        &VaultInfo.BaseAddress
                      );
  if (EFI_ERROR (Status)) {
    return EFI_ABORTED;
  }

  VaultInfo.count = 0;
  VaultInfo.MappedLength = VAULT_PAGE_COUNT * EFI_PAGE_SIZE;
  DispatchHandle = NULL;

  VOID *Empty = (VOID *)(VaultInfo.BaseAddress + sizeof (VaultInfo));
  VOID *End = (VOID *)((UINTN)VaultInfo.BaseAddress + VaultInfo.MappedLength - 1);
  VAULT_CHUNK *ChunkBase = (VAULT_CHUNK *)Empty;

  for (UINTN i = 0; i < VAULT_MAX_TOKENS && (VOID *)(&ChunkBase[i]) < End; i++) {
    VAULT_CHUNK *Chunk = &ChunkBase[i];
    SetMem (Chunk, sizeof (VAULT_CHUNK), 0);
    Chunk->next = VaultInfo.free;
    VaultInfo.free = Chunk;
  }

  Status = gMmst->MmiHandlerRegister (
              KeyVaultHandler,
              &gEfiKeyVaultCommGuid,
              &DispatchHandle
            );
  if (EFI_ERROR (Status)) {
    return VaultKeyAbort ();
  }

  return Status;
}