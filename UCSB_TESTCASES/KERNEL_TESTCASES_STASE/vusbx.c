#include <linux/module.h>
#include <linux/usb.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>

#define VUSBX_BUFFER_SIZE 64
#define VUSBX_WRITE_SIZE 128

static struct usb_device *device;

struct vusbx_buf {
    char data[VUSBX_BUFFER_SIZE];
    void (*callback)(void);
};

static struct vusbx_buf *heap_chunk;

// Function to be hijacked
void attacker_controlled_function(void) {
    pr_info("# [VUSBX] Attacker function executed!\n");
}

// Vulnerable write
static ssize_t vusbx_write(struct file *file, const char __user *user_buffer, size_t count, loff_t *pos) {
    if (!heap_chunk) return -ENOMEM;

    if (count > VUSBX_BUFFER_SIZE)
        pr_info("# [VUSBX] Overflow detected! Writing %zu bytes (allowed %d)\n", count, VUSBX_BUFFER_SIZE);

    if (copy_from_user(heap_chunk->data, user_buffer, count))
        return -EFAULT;

    pr_info("# [VUSBX] Wrote %zu bytes to heap buffer at %p\n", count, heap_chunk);
    return count;
}

// Trigger function pointer
static long vusbx_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    pr_info("# [VUSBX] Executing function pointer at %p\n", heap_chunk->callback);
    heap_chunk->callback();
    return 0;
}

static const struct file_operations vusbx_fops = {
    .owner = THIS_MODULE,
    .write = vusbx_write,
    .unlocked_ioctl = vusbx_ioctl,
};

// Use miscdevice instead of usb_class_driver
static struct miscdevice vusbx_misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = "vusbx",
    .fops = &vusbx_fops,
    .mode = 0666
};

static int __init vusbx_init(void) {
    int ret;

    heap_chunk = kmalloc(sizeof(struct vusbx_buf), GFP_KERNEL);
    if (!heap_chunk)
        return -ENOMEM;

    heap_chunk->callback = NULL;

    pr_info("# [VUSBX] Allocated heap chunk at %p (callback at %p)\n", heap_chunk, &heap_chunk->callback);

    ret = misc_register(&vusbx_misc_device);
    if (ret) {
        pr_err("# [VUSBX] Failed to register misc device\n");
        kfree(heap_chunk);
        return ret;
    }

    pr_info("# [VUSBX] Registered /dev/vusbx\n");
    return 0;
}

static void __exit vusbx_exit(void) {
    misc_deregister(&vusbx_misc_device);
    kfree(heap_chunk);
    pr_info("# [VUSBX] Module unloaded.\n");
}

module_init(vusbx_init);
module_exit(vusbx_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("JJ");
MODULE_DESCRIPTION("Vulnerable USB Driver using misc device");
