#include <linux/module.h>
#include <linux/usb.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>

#define VUSBY_BUFFER_SIZE 64
#define OVERFLOW_OFFSET 80  // Offset from struct base to callback

struct vusby_chunk {
    struct vusby_chunk *next;
    char data[VUSBY_BUFFER_SIZE];
    void (*callback)(void);
};

static struct vusby_chunk *free_list = NULL;
static struct vusby_chunk *heap_pool = NULL;

// Attacker-controlled function to demonstrate hijack
static void attacker_controlled_function(void) {
    pr_info("# [VUSBY] Attacker function executed!\n");
}

// Vulnerable allocation using corrupted free list
static struct vusby_chunk *allocate_chunk(void) {
    if (!free_list)
        return NULL;
    struct vusby_chunk *chunk = free_list;
    free_list = free_list->next;
    return chunk;
}

static void free_chunk(struct vusby_chunk *chunk) {
    chunk->next = free_list;
    free_list = chunk;
}

// Vulnerable write with OOB from struct base
static ssize_t vusby_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos) {
    if (!free_list)
        return -ENOMEM;

    struct vusby_chunk *target = free_list;

    // Use struct base, not just data[], to allow overflow into next/callback
    if (copy_from_user(target, buf, count))
        return -EFAULT;

    pr_info("# [VUSBY] After write, callback = %px\n", target->callback);
    pr_info("# [VUSBY] Wrote %zu bytes to chunk at %p\n", count, target);
    pr_info("# [VUSBY] First 8 bytes of data: %*ph\n", 8, target->data);

    for (int i = 0; i < 88; i += 16) {
        pr_info("# [VUSBY] data[%02d..%02d]: %*ph\n", i, i + 15, 16, ((u8 *)target) + i);
    }

    return count;
}

// Trigger control flow hijack
static long vusby_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    struct vusby_chunk *chunk = allocate_chunk();
    if (!chunk)
        return -ENOMEM;

    pr_info("# [VUSBY] Allocated chunk at %p\n", chunk);

    pr_info("# [VUSBY] callback address at %px\n", chunk->callback);
    if (chunk->callback) {
        pr_info("# [VUSBY] Triggering callback at %px\n", chunk->callback);
        chunk->callback();
    } else {
        pr_info("# [VUSBY] No callback set\n");
    }

    return 0;
}

static const struct file_operations vusby_fops = {
    .owner = THIS_MODULE,
    .write = vusby_write,
    .unlocked_ioctl = vusby_ioctl,
};

static struct miscdevice vusby_misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = "vusby",
    .fops = &vusby_fops,
    .mode = 0666
};

static int __init vusby_init(void) {
    heap_pool = kmalloc_array(3, sizeof(struct vusby_chunk), GFP_KERNEL);
    if (!heap_pool)
        return -ENOMEM;

    for (int i = 0; i < 3; i++) {
        heap_pool[i].next = (i < 2) ? &heap_pool[i + 1] : NULL;
        heap_pool[i].callback = NULL;
    }

    free_list = &heap_pool[0];

    pr_info("# [VUSBY] Initialized heap with 3 chunks\n");
    pr_info("# [VUSBY] Attacker function is at %px\n", attacker_controlled_function);

    return misc_register(&vusby_misc_device);
}

static void __exit vusby_exit(void) {
    misc_deregister(&vusby_misc_device);
    kfree(heap_pool);
    pr_info("# [VUSBY] Module unloaded\n");
}

module_init(vusby_init);
module_exit(vusby_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("JJ");
MODULE_DESCRIPTION("Vulnerable USB Driver with Write-What-Where and Control Flow Hijack");
