/*
 * moodpot.c - Character device interface for MoodPot simulation
 *
 * Provides a binary command/response interface over /dev/moodpot for
 * interacting with simulated smart planter devices. This driver forwards
 * structured commands to the core logic and returns per-session results.
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/miscdevice.h>
#include <linux/mutex.h>
#include <linux/list.h>
#include <linux/fs.h>
#include <linux/kheap.h>
#include <linux/moodpot_core.h>

#define DEVICE_NAME "moodpot"
#define CLASS_NAME  "class_moodpot"

static int    major_number;
static struct class*  mp_class  = NULL;
static struct device* mp_device = NULL;

/*
 * moodpot_open - allocate per-session response buffer
 *
 * Initializes the file's private_data with a response structure to hold
 * output from command evaluation. Each open gets a private context.
 */
static int moodpot_open(struct inode *inode, struct file *file)
{
    struct response *session;
    
    session = kheap_alloc(sizeof(*session));
    if (!session)
        return -ENOMEM;

    mutex_init(&session->resp_lock);
    session->resp_len = 0;
	memset(session->resp_buf, 0, MAX_BUF_SIZE);

    file->private_data = session;
    return 0;
}

/*
 * moodpot_release - free per-session response buffer
 *
 * Cleans up memory associated with the file's private_data on close.
 */
static int moodpot_release(struct inode *inode, struct file *file)
{
    if (file->private_data) {
        kheap_free(file->private_data);
        file->private_data = NULL;
    }
    return 0;
}

/*
 * moodpot_write - handle user commands
 *
 * Accepts a fixed-size command structure from userspace and forwards it
 * to the core simulation logic for interpretation and execution. 
 */
static ssize_t moodpot_write(struct file *file, const char __user *ubuf, size_t len, loff_t *off)
{
    struct moodpot_usercmd *ucmd;
    int ret = 0;

    if (len != sizeof(*ucmd)) {
        return -EINVAL;
    }

    ucmd = kheap_alloc(sizeof(*ucmd));
    if (!ucmd)
        return -ENOMEM;

    if (copy_from_user(ucmd, ubuf, sizeof(*ucmd))) {
        kheap_free(ucmd);
        return -EFAULT;
    }

    ret = evaluate_usercmd(ucmd, (struct response *)file->private_data);
    kheap_free(ucmd);

    if (ret >= 0)
        ret = sizeof(struct moodpot_usercmd);

    return ret;
}

/*
 * moodpot_read - return response data to userspace
 *
 * Allows a single read of the current response buffer. Offset must be zero.
 * The buffer is cleared and marked empty after a successful read.
 */
static ssize_t moodpot_read(struct file *file, char __user *ubuf, size_t len, loff_t *off)
{
    struct response *resp = file->private_data;
    ssize_t copied;

    if (!resp || *off != 0)
        return -EINVAL;

    mutex_lock(&resp->resp_lock);

    if (len < resp->resp_len) {
        mutex_unlock(&resp->resp_lock);
        return -EINVAL;
    }

    if (resp->resp_len == 0 || resp->resp_len > MAX_BUF_SIZE) {
        mutex_unlock(&resp->resp_lock);
        return 0;
    }

    if (copy_to_user(ubuf, resp->resp_buf, resp->resp_len)) {
        mutex_unlock(&resp->resp_lock);
        return -EFAULT;
    }

    copied = resp->resp_len;

    resp->resp_len = 0;
    memset(resp->resp_buf, 0, MAX_BUF_SIZE);

    mutex_unlock(&resp->resp_lock);
    return copied;
}

/*
 * moodpot_llseek - restricts seeking to offset 0
 *
 * Only SEEK_SET to position 0 is allowed. All other operations
 * return -ESPIPE to indicate unsupported seek on a character device.
 */
static loff_t moodpot_llseek(struct file *file, loff_t off, int whence)
{
    return (whence == SEEK_SET && off == 0) ? (file->f_pos = 0) : -ESPIPE;
}

/* File operations */
static const struct file_operations moodpot_fops = {
    .owner = THIS_MODULE,
    .open = moodpot_open,
    .release = moodpot_release,
    .write = moodpot_write,
    .read = moodpot_read,
    .llseek = moodpot_llseek,
};

/*
 * moodpot_init - module initialization
 *
 * Registers the moodpot character device and creates the /dev/moodpot node.
 * Returns 0 on success or a negative errno on failure.
 */
int __init moodpot_init(void)
{
    major_number = register_chrdev(0, DEVICE_NAME, &moodpot_fops);
    if (major_number < 0) {
        return major_number;
    }

    mp_class = class_create(CLASS_NAME);
    if (IS_ERR(mp_class)) {
        unregister_chrdev(major_number, DEVICE_NAME);
        return PTR_ERR(mp_class);
    }

    mp_device = device_create(mp_class, NULL, MKDEV(major_number, 0), NULL, DEVICE_NAME);
    if (IS_ERR(mp_device)) {
        class_destroy(mp_class);
        unregister_chrdev(major_number, DEVICE_NAME);
        return PTR_ERR(mp_device);
    }

    return 0;
}

/*
 * moodpot_exit - module cleanup
 *
 * Removes the character device and class associated with /dev/moodpot.
 */
void __exit moodpot_exit(void)
{
    device_destroy(mp_class, MKDEV(major_number, 0));
    class_unregister(mp_class);
    class_destroy(mp_class);
    unregister_chrdev(major_number, DEVICE_NAME);
}

module_init(moodpot_init);
module_exit(moodpot_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Tom Bombadil");
MODULE_DESCRIPTION("Smart Planter Simulator Interaction Module");
