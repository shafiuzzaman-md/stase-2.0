// SPDX-License-Identifier: GPL-2.0
/*
* kheap - Internal heap allocator
*
 * This module implements a simple, implicit free-list allocator using
 * a statically allocated memory region. Blocks are tracked via headers,
 * and allocation is done via linear first-fit search. This allocator is 
 * non-coalescing and does not support defragmentation.
 * 
*/

#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/kheap.h>

#define HEAP_PAGES     8
#define HEAP_SIZE      (PAGE_SIZE * HEAP_PAGES)
#define ALIGNMENT      8
#define ALIGN_BLOCK(size)    (((size) + (ALIGNMENT - 1)) & ~(ALIGNMENT - 1))
#define HDR_SIZE       sizeof(uint64_t)
#define MIN_BLOCK_SIZE (ALIGN_BLOCK(HDR_SIZE + 1))

static void *heap = NULL;
static void *heap_start = NULL;
static void *heap_end = NULL;

typedef uint64_t word_t;

/*
* struct block - Heap block with a header and payload
* @header: Lower bit = in-use flag, rest = size
* @payload: Flexible array member
*/
typedef struct block {
    word_t header;
    unsigned char payload[0];
} block_t;

/**
* kheap_get_payload - Return the user-facing pointer from block
* @block: Block pointer
*/
static void *kheap_get_payload(block_t *block)
{
    return (void *)(block->payload);
}

/**
* kheap_get_header - Return the block from a payload pointer
* @ptr: Pointer to payload
*/
static void *kheap_get_header(void *ptr)
{
    return (block_t *)((unsigned char *)ptr - offsetof(block_t, payload));
}

/**
* kheap_block_used - Returns true if block is marked allocated
* @block: Block pointer
*/
static int kheap_block_used(block_t *block)
{
    return block->header & 0x1;
}

/**
* kheap_block_size - Returns size field of block, masked off from flag bits
* @block: Block pointer
*/
static size_t kheap_block_size(block_t *block)
{
    return block->header & ~(size_t)0x7;
}

/**
* kheap_write_header - Writes size and allocation status to header
* @block: Block pointer
* @size: Size in bytes
* @alloc: Whether block is allocated
*/
static void kheap_write_header(block_t *block, size_t size, bool alloc)
{
    if (block)
        block->header = size | alloc;
}

/**
* kheap_next_block - Returns next block by size offset
* @block: Current block
*/
static block_t *kheap_next_block(block_t *block)
{
    if (!kheap_block_size(block))
        return NULL;
    return (block_t *)((unsigned char *)block + kheap_block_size(block));
}

/**
* kheap_find_fit - Linear first-fit allocator
* @request_size: Size in bytes to allocate
*
* Return: First free block large enough, or NULL
*/
static block_t *kheap_find_fit(size_t request_size)
{
    block_t *block;

    for (block = heap_start; (void *)block != heap_end; block = kheap_next_block(block)) {
        if (!block)
            return NULL;

        if (!kheap_block_used(block) && request_size <= kheap_block_size(block))
            return block;

    }
    return NULL;
}

/**
* kheap_split_block - Splits block if excess size remains
* @block: Block to split
* @request_size: Size to carve out
*/
static void kheap_split_block(block_t *block, size_t request_size)
{
    size_t block_size = kheap_block_size(block);

    if ((block_size - request_size) >= MIN_BLOCK_SIZE) {
        kheap_write_header(block, request_size, true);
        block_t *block_next = kheap_next_block(block);
        kheap_write_header(block_next, block_size - request_size, false);
    } else {
        kheap_write_header(block, block_size, true);
    }
}

/**
* kheap_alloc - Allocate a memory region from the heap
* @size: Requested size in bytes
*
* Return: Pointer to payload or NULL
*/
void *kheap_alloc(size_t size)
{
    size_t request_size = ALIGN_BLOCK(size + HDR_SIZE);

    if (request_size < MIN_BLOCK_SIZE)
        return NULL;

    block_t *block = kheap_find_fit(request_size);

    if (!block)
        return NULL;

    kheap_split_block(block, request_size);
    void *ret = kheap_get_payload(block);

    return ret;
}
EXPORT_SYMBOL(kheap_alloc);

/**
* kheap_free - Frees a previously allocated region
* @ptr: Payload pointer
*/
void kheap_free(void *ptr)
{
    if (!ptr)
        return;
    
    block_t *block = kheap_get_header(ptr);
    if (!kheap_block_used(block))
        return;

    kheap_write_header(block, kheap_block_size(block), false);
}
EXPORT_SYMBOL(kheap_free);

/**
* kheap_init - Internal heap allocator init
*
* Return: 0 on success or -ENOMEM on failure
*/
static int __init kheap_init(void)
{
    heap = kzalloc(HEAP_SIZE, GFP_KERNEL);
    if (!heap)
        return -ENOMEM;

    heap_start = (void *)ALIGN_BLOCK((uintptr_t)heap);
    heap_end = (char *)heap + HEAP_SIZE;

    ((block_t *)heap)->header = HEAP_SIZE & ~(size_t)0x7;
    return 0;
}

/**
* kheap_exit - Frees backing heap (for testing or cleanup use)
*/
static void __exit kheap_exit(void)
{
    kfree(heap);
}

core_initcall(kheap_init);
