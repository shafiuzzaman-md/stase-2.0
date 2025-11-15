//
// KeyVault.h
//
// Header for the KeyVault SMM driver.
// Defines structures, constants, and communication interfaces.
//

#ifndef _KEYVAULT_H_
#define _KEYVAULT_H_

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

#include "Convert.h"
#include "KeyHash.h"

#define HASH_PASSES         32
#define VAULT_PAGE_COUNT     2
#define VAULT_HASH_SIZE     32
#define VAULT_MAX_TOKENS    10

///
/// Token data buffer size.
///
typedef CHAR8 TOKEN_DATA[128];
#define TOKEN_DATA_SIZE  sizeof(TOKEN_DATA)

///
/// In-memory representation of a vault token.
///
typedef struct {
  CHAR8       *name;
  CHAR8       *hash;
  CHAR8       *content;
  TOKEN_DATA   data;
} VAULT_TOKEN;

///
/// Valid action codes for the KeyVault communication interface.
///
typedef enum {
  VAULT_KEY_CREATE,
  VAULT_KEY_READ,
  VAULT_KEY_DELETE,
  VAULT_KEY_CONVERT
} VAULT_KEY_ACTION;

///
/// Name, secret, and content field sizes for tokens.
///
typedef CHAR8 TOKEN_NAME[16];
typedef CHAR8 TOKEN_CONTENT[256];
typedef CHAR8 TOKEN_SECRET[64];

///
/// Structure used for MM communication.
///
typedef struct {
  EFI_STATUS         Status;
  VAULT_KEY_ACTION   Action;
  EFI_GUID           VendorGuid;
  TOKEN_NAME         TokenName;
  TOKEN_SECRET       TokenSecret;
  TOKEN_CONTENT      TokenContent;
  UINTN              TokenContentLength;
} KEY_VAULT_COMM;

///
/// Vault function pointer types.
///
typedef EFI_STATUS (EFIAPI *KEY_VAULT_CREATE_KEY)(KEY_VAULT_COMM *);
typedef EFI_STATUS (EFIAPI *KEY_VAULT_READ_KEY)(KEY_VAULT_COMM *);
typedef EFI_STATUS (EFIAPI *KEY_VAULT_DELETE_KEY)(KEY_VAULT_COMM *);
typedef EFI_STATUS (EFIAPI *KEY_VAULT_TRANSLATE_KEY)(KEY_VAULT_COMM *);

///
/// Vault protocol table definition.
///
typedef struct {
  KEY_VAULT_CREATE_KEY     Create;
  KEY_VAULT_READ_KEY       Read;
  KEY_VAULT_DELETE_KEY     Delete;
  KEY_VAULT_TRANSLATE_KEY  Translate;
} KEY_VAULT_PROTOCOL;

///
/// Linked list node storing a token.
///
typedef struct _VAULT_CHUNK {
  struct _VAULT_CHUNK  *next;
  VAULT_TOKEN           token;
} VAULT_CHUNK;

///
/// Global vault metadata.
///
typedef struct {
  EFI_PHYSICAL_ADDRESS  BaseAddress;
  VAULT_CHUNK          *headToken;
  UINTN                 count;
  VAULT_CHUNK          *free;
  EFI_GUID             *GuidList;
  UINTN                 MappedLength;
} KEY_VAULT_INFO;

#endif // _KEYVAULT_H_