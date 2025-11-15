// SPDX-License-Identifier: GPL-2.0
/*
 * kchunk - Chunk-based heap allocator for kernel use
 *
 * This driver provides a handle-based memory allocation system with fixed-size
 * chunk pools, internally managed via free lists. The allocator expands dynamically
 * by adding new chunk regions as needed. This module is intended to be used by
 * other kernel modules that require predictable and simple chunk-based memory handling.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/debugfs.h>
#include <linux/string.h>
#include <linux/kchunk.h>

#define HANDLE_TABLE_MAX_CAPACITY 1024

/* Supported block sizes per size class */
const size_t block_sizes[MAX_PAGES] = {
    BLOCK_080,
    BLOCK_100,
    BLOCK_200,
    BLOCK_400
};

static heap_metadata_t heap_md;
static heap_t heap;
spinlock_t kchunk_lock;

/**
 * heap_get_handle_table - Expose handle table to consumers
 *
 * @return: pointer to internal handle table.
 */
const handle_entry_t *heap_get_handle_table(void)
{
    return heap_md.handle_table;
}
EXPORT_SYMBOL_GPL(heap_get_handle_table);

/**
 * heap_get_free_handle_top - Return top of free handle stack
 *
 * @return: current top index for free handle reuse.
 */
int heap_get_free_handle_top(void)
{
    return heap_md.free_handle_top;
}
EXPORT_SYMBOL_GPL(heap_get_free_handle_top);

/**
 * heap_get_free_list - Retrieve head of the free list for a size class
 *
 * @index: size class index
 * @return: pointer to first chunk in free list, or NULL on error.
 */
chunk_t *heap_get_free_list(int index)
{
    if (index < 0 || index >= MAX_PAGES) return NULL;
    return heap.free_list[index];
}
EXPORT_SYMBOL_GPL(heap_get_free_list);

/**
 * add_new_chunk_region - Allocate a new region of chunks for a size class
 *
 * @block_index: index into block_sizes array
 * @return: 0 on success, -ENOMEM on failure
 */
static int add_new_chunk_region(int block_index)
{
    int i;
    size_t block_size = block_sizes[block_index];
    size_t region_size = INITIAL_ITEMS * block_size;

    void *new_region = kmalloc(region_size, GFP_KERNEL);
    if (!new_region)
        return -ENOMEM;

    chunk_t *first = new_region;
    chunk_t *curr = first;
    for (i = 0; i < INITIAL_ITEMS - 1; i++) {
        curr->next = (chunk_t *)((char *)curr + block_size);
        curr = curr->next;
    }
    curr->next = heap.free_list[block_index];
    heap.free_list[block_index] = first;

    if (heap.alloc_counts[block_index] >= heap.alloc_capacity[block_index]) {
        int new_cap = heap.alloc_capacity[block_index] ? heap.alloc_capacity[block_index] * 2 : 4;
        void **new_array = krealloc(heap.allocations[block_index], new_cap * sizeof(void *), GFP_KERNEL);
        if (!new_array)
            return -ENOMEM;
        heap.allocations[block_index] = new_array;
        heap.alloc_capacity[block_index] = new_cap;
    }

    heap.allocations[block_index][heap.alloc_counts[block_index]++] = new_region;
    return 0;
}

/**
 * ensure_handle_capacity - Ensure there is space in the handle table
 *
 * Expands the handle table if needed and reinitializes unused entries.
 *
 * @return: 0 on success, -ENOMEM on failure
 */
static int ensure_handle_capacity(void)
{
    int new_cap, i;
    handle_entry_t *new_table;

    if (heap_md.free_handle_top >= 0)
        return 0;

    new_cap = heap_md.handle_capacity ? heap_md.handle_capacity * 2 : INITIAL_ITEMS * MAX_PAGES;
    if (new_cap > HANDLE_TABLE_MAX_CAPACITY)
        return -ENOMEM;

    new_table = krealloc(heap_md.handle_table, new_cap * sizeof(handle_entry_t), GFP_KERNEL);
    if (!new_table)
        return -ENOMEM;

    for (i = heap_md.handle_capacity; i < new_cap; i++) {
        new_table[i].chunk_ptr = NULL;
        new_table[i].chunk_size = 0;
        new_table[i].in_use = 0;
    }

    heap_md.free_handle_top = new_cap - 1;
    heap_md.handle_capacity = new_cap;
    heap_md.handle_table = new_table;
    return 0;
}

/**
 * allocate_chunk - Allocate a chunk and assign it a handle
 *
 * @chunk_size: index into chunk size classes
 * @return: pointer to allocated chunk, or NULL on failure
 */
void *allocate_chunk(unsigned int chunk_size)
{
    int handle;
    chunk_t *allocated;
    unsigned long flags;

    if (chunk_size >= MAX_PAGES || chunk_size < 0)
        return NULL;

    spin_lock_irqsave(&kchunk_lock, flags);

    if (!heap.free_list[chunk_size]) {
        if (add_new_chunk_region(chunk_size)) {
            spin_unlock_irqrestore(&kchunk_lock, flags);
            return NULL;
        }
    }

    if (ensure_handle_capacity()) {
        spin_unlock_irqrestore(&kchunk_lock, flags);
        return NULL;
    }

    allocated = heap.free_list[chunk_size];
    heap.free_list[chunk_size] = allocated->next;

    handle = heap_md.free_handle_top--;
    heap_md.handle_table[handle].chunk_ptr = allocated;
    heap_md.handle_table[handle].chunk_size = chunk_size;
    heap_md.handle_table[handle].in_use = 1;

    spin_unlock_irqrestore(&kchunk_lock, flags);

    return allocated;
}
 
EXPORT_SYMBOL_GPL(allocate_chunk);

/**
 * free_chunk - Free a chunk given a pointer
 *
 * @ptr: pointer to chunk to be freed
 */
void free_chunk(void *ptr)
{
    unsigned long flags;

    if (!ptr)
        return;

    spin_lock_irqsave(&kchunk_lock, flags);

    for (int i = 0; i < heap_md.handle_capacity; i++) {
        if (heap_md.handle_table[i].in_use &&
            heap_md.handle_table[i].chunk_ptr == ptr) {

            chunk_t *chunk = heap_md.handle_table[i].chunk_ptr;
            unsigned int chunk_size = heap_md.handle_table[i].chunk_size;

            chunk->next = heap.free_list[chunk_size];
            heap.free_list[chunk_size] = chunk;

            heap_md.handle_table[i].in_use = 0;
            heap_md.free_handle_top++;

            break;
        }
    }

    spin_unlock_irqrestore(&kchunk_lock, flags);
}
EXPORT_SYMBOL_GPL(free_chunk);

/**
 * get_block_size - Map a byte size to a chunk class
 *
 * @size: requested byte size
 * @return: index into chunk classes, or -1 on invalid input
 */
int get_block_size(size_t size)
{
    if (size <= BLOCK_080) return B_080;
    if (size <= BLOCK_100) return B_100;
    if (size <= BLOCK_200) return B_200;
    if (size <= BLOCK_400) return B_400;
    return -1;
}
EXPORT_SYMBOL_GPL(get_block_size);

/**
 * initialize_heap - Populate all chunk pools
 *
 * Allocates and initializes free lists and tracking arrays.
 */
static void __init initialize_heap(void)
{
    int i;
    for (i = 0; i < MAX_PAGES; i++) {
        heap.free_list[i] = NULL;
        heap.allocations[i] = NULL;
        heap.alloc_counts[i] = 0;
        heap.alloc_capacity[i] = 0;
        add_new_chunk_region(i);
    }
}

/**
 * initialize_heap_metadata - Initialize the handle table and metadata
 */
static void __init initialize_heap_metadata(void)
{
    heap_md.handle_capacity = 0;
    heap_md.handle_table = NULL;
    heap_md.free_handle_top = -1;
    ensure_handle_capacity();
}

/**
 * kchunk_builtin_init - Kernel initcall for allocator
 *
 * Called at core_initcall level during boot to initialize the allocator.
 *
 * @return: always 0
 */
static int __init kchunk_builtin_init(void)
{
    spin_lock_init(&kchunk_lock);
    initialize_heap_metadata();
    initialize_heap();
    return 0;
}
core_initcall(kchunk_builtin_init);
