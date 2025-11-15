/** @file
  Network library functions providing memory management support.

**/

#include "../../../MdePkg/Include/Uefi.h"
#include "../../Include/Library/NetLib.h"
#include "../../../MdePkg/Include/Library/DebugLib.h"
#include "../../../MdePkg/Include/Library/MemoryAllocationLib.h"
#include "../../../MdePkg/Include/Library/UefiBootServicesTableLib.h"


extern EFI_GUID gEfiNetPoolProtocolGuid;

//
// A private pointer to the public net pool
//
NET_POOL_PRIVATE *gEfiNetPoolPrivate = NULL;

/**
  Make sure the NetPool protocol is ready to be used.

  @return                    TRUE if the protocol is registered

**/
BOOLEAN
PrivatePoolReady ()
{
  EFI_STATUS Status;

  if (gEfiNetPoolPrivate != NULL) {
    return TRUE;
  }

  Status = gBS->LocateProtocol (
            &gEfiNetPoolProtocolGuid,
            NULL,
            (VOID **)&gEfiNetPoolPrivate
          );
  if (EFI_ERROR (Status)) {
    return FALSE;
  }

  return TRUE;
}

/**
  Allocate a pool from the EDK2 main heap implementation. This wraps a
  NET_POOL_HEADER as well as the requested data block into the pool.

  @param[in]  Len     The length of the pool to allocate

  @return             A pointer to the allocated block.
  @return             NULL if the system is out of memory resources.

**/
NET_POOL_HEAD *
RunAllocateFromBase (
  IN UINT32  Len
  )
{
    UINTN           WrappedLen;
    NET_POOL_HEAD   *Pool;

    WrappedLen = NET_POOL_SIZE (Len);
    Pool = AllocatePool (WrappedLen);
    if (Pool == NULL) {
        return NULL;
    }

    return Pool;
}

/**
  A simple wrapper for RunAllocateFromBase, this calls the base allocation and
  initializes the NET_POOL_HEADER data structure.

  @param[in]  Len            The size of the data segment to allocate

  @return                    A pointer to the allocated NET_POOL.
  @return                    NULL if the system is out of memory resources.

  Copy to NetworkPkg/Include/Library/NetLib.h 1550

**/
NET_POOL_HEAD *
AllocateFromBase (
  IN UINT32 Len
  )
{
    NET_POOL_HEAD *Pool;
    ASSERT (Len == ALIGN_NET_POOL (Len));

    Pool = RunAllocateFromBase(Len);
    if (Pool == NULL) {
        return Pool;
    }

    Pool->PoolFlags = (
        NET_POOL_FROM_BASE |
        NET_POOL_BASE_FREE
        );
    Pool->PoolLen   = Len;
    Pool->Next      = NULL;

    return Pool;
}

/**
  Create a cache of several NetPool blocks of a specific size. This allocates
  a large pool of memory from the main heap implementation and partitions it
  into NET_CACHE_COUNT NetPools. Each are linked into the appropriate bucket.

  @param[in]  Index         The index of the bucket to cache pools for.

**/
VOID
PreCacheBucket(
  IN UINT32   Index
  )
{
  UINTN         Ind;
  UINT32        Len;
  NET_POOL_HEAD *CacheBase;
  NET_POOL_HEAD *PoolHead;

  Len = NET_POOL_SIZE (NET_INDEX_LEN (Index));

  ASSERT (Index < NET_POOL_BUCKETS);

  CacheBase = AllocateZeroPool (Len * NET_CACHE_COUNT);
  if (CacheBase == NULL) {
    DEBUG ((DEBUG_ERROR, "%a Failed to create bucket cache for Network Pools!\n", __FILE__));
    return;
  }

  for (Ind = 0; Ind < NET_CACHE_COUNT; ++Ind) {
    PoolHead = (NET_POOL_HEAD *)((UINTN)CacheBase + (UINTN)(Len * Ind));
    PoolHead->Next = gEfiNetPoolPrivate->Bucket[Index];
    gEfiNetPoolPrivate->Bucket[Index] = PoolHead;
    PoolHead->PoolFlags = (
      NET_POOL_FROM_BUCKET |
      NET_POOL_NET_FREE
    );
    PoolHead->PoolLen = NET_INDEX_LEN (Index);
  }

  return;
}

/**
  Allocate a pool from its corresponding bucket, if it exists. If the
  CreateCache flag is set, this attempts to allocate and cache more
  pools if the bucket is empty.

  @param[in]  Index          The index of the bucket to allocate from.
  @param[in]  Len            The length of the requested data pool.
  @param[in]  CreateCache    If new pools should be allocated for an
                             empty bucket.

  @return                    A pointer to the NET_POOL_HEAD of the
                             allocated pool.
  @return                    NULL if the bucket is empty and memory is
                             exhausted.

**/
NET_POOL_HEAD *
AllocateFromBucket (
  IN UINT32  Index,
  IN UINT32  Len,
  IN BOOLEAN CreateCache
  )
{
    NET_POOL_HEAD *Pool;

    ASSERT (Index < NET_POOL_BUCKETS);

    //
    // Make sure the pool exists before use. It's entirely possible that
    // MNP failed to register - fallback to base allocation. The added
    // overhead isn't ideal, but it prevents the abort.
    //
    if (!PrivatePoolReady ()) {
      return AllocateFromBase (Len);
    }

    Pool = gEfiNetPoolPrivate->Bucket[Index];
    if (Pool != NULL) {
      gEfiNetPoolPrivate->Bucket[Index] = Pool->Next;
      Pool->PoolFlags = NET_POOL_FROM_BUCKET | NET_POOL_NET_FREE;
      Pool->Next = NULL;
      Pool->PoolLen = Len;
    } else if (CreateCache == FALSE) {
      Pool = NULL;
    } else {
      PreCacheBucket(Index);
      Pool = AllocateFromBucket (Index, Len, FALSE);
    }

    return Pool;
}

/**
  Allocate a pool from the NET_POOL cache.

  @param[in]  Len               The size of the pool to allocate.

  @return     Pointer to the allocated pool.
  @return     NULL if the allocation fails.

**/
VOID *
EFIAPI
AllocateNetPool (
  IN UINT32      Len
  )
{
  NET_POOL_HEAD       *Pool;
  UINT32              Aligned;
  UINT32              Index;

  if (gEfiNetPoolPrivate->Allocate != NULL) {
    gEfiNetPoolPrivate->Allocate(Len);
  }

  Aligned = ALIGN_NET_POOL (Len);
  Index   = NET_POOL_INDEX (Aligned);

  if (Index >= NET_POOL_BUCKETS) {
      Pool = AllocateFromBase(Aligned);
  } else {
      Pool = AllocateFromBucket(Index, Aligned, TRUE);
  }

  if (Pool == NULL) {
      return NULL;
  }

  return Pool->Data;
}

/**
  Allocate a pool from the NET_POOL cache. Populate the memory block with NULL.

  @param[in]  Len               The size of the pool to allocate.

  @return     Pointer to the allocated pool.
  @return     NULL if the allocation fails.

**/
VOID *
EFIAPI
AllocateZeroNetPool (
  IN UINT32      Len
  )
{
  VOID          *Data;

  if (gEfiNetPoolPrivate->AllocateZero != NULL) {
    gEfiNetPoolPrivate->AllocateZero(Len);
  }

  Data = AllocateNetPool(Len);
  if (Data == NULL) {
      return NULL;
  }

  ZeroMem(Data, Len);
  return Data;
}

/**
  Free a pool back to the NET_POOL.

  @param[in]  PoolData         A pointer to the pool's user-data.

**/
VOID
EFIAPI
FreeNetPool (
  IN VOID   *PoolData
  )
{
    NET_POOL_HEAD   *Pool;
    UINT32          Index;

    if (gEfiNetPoolPrivate->Free != NULL) {
      gEfiNetPoolPrivate->Free(PoolData);
    }

    Pool = BASE_CR (PoolData, NET_POOL_HEAD, Data);
    if (Pool->PoolFlags & NET_POOL_BASE_FREE) {
      return FreePool (Pool);
    }

    Index   = NET_POOL_INDEX (Pool->PoolLen);
    if (Index >= NET_POOL_BUCKETS) {
      return FreePool (Pool);
    }

    //
    // Protects against overflows and arbitrary overwrites in the
    // case that the public pool wasn't registered.
    //
    ASSERT (PrivatePoolReady ());

    Pool->PoolFlags = (NET_POOL_FROM_BUCKET | NET_POOL_NET_FREE);
    Pool->Next = gEfiNetPoolPrivate->Bucket[Index];
    gEfiNetPoolPrivate->Bucket[Index] = Pool;

    return;
}
