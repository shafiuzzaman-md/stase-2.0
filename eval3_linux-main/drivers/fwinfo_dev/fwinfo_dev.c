/*
 * fwinfo_dev - Firmware TLV validation driver
 *
 * This kernel module implements a character device that accepts a TLV-encoded
 * firmware blob, validates the format and order of entries, and computes a CRC32
 * checksum. It reports the parsed values or errors through per-session buffers.
 *
 * Device name: /dev/fwinfo_dev
 * Author: Stanley Goodspeed
 * License: GPL
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/device.h>
#include <linux/cdev.h>
#include <linux/crc32.h>
#include <linux/kchunk.h>

#define DEVICE_NAME "fwinfo_dev"
#define CLASS_NAME  "fwinfo_cls"
#define MAX_FW_SIZE 4096
#define MAX_BUF_SIZE 240

#define TLV_VERSION     0x01
#define TLV_TIMESTAMP   0x02
#define TLV_FEATURES    0x03
#define TLV_COMPAT_ID   0x04
#define TLV_CHECKSUM    0xFE

static dev_t dev_number;
static struct class *fwinfo_class;
static struct cdev fwinfo_cdev;

struct fw_session {
    char report_buf[MAX_BUF_SIZE];
    size_t report_len;
    size_t read_pos;
};

/**
 * report_error - Append a message to the session's report buffer
 * @session: Pointer to the current firmware session
 * @msg: Error string to append
 */
 static void report_error(struct fw_session *session, const char *msg)
 {
     size_t remaining = MAX_BUF_SIZE - session->report_len;
 
     if (remaining > 0) {
         int written = scnprintf(session->report_buf + session->report_len,
                                 remaining, "%s", msg);
         session->report_len += written;
     }
 }

/**
 * validate_tlv - Check TLV type and length for correctness
 * @type: TLV type identifier
 * @len: Length field from TLV
 * @session: Pointer to the current session (for future use)
 *
 * @return: 0 on success, -EINVAL on validation failure
 */
static int validate_tlv(uint8_t type, uint16_t len, struct fw_session *session)
{
    switch (type) {
    case TLV_VERSION:
        if (len < 1 || len > 128)
            return -EINVAL;
        break;
    case TLV_TIMESTAMP:
        if (len != sizeof(uint64_t))
            return -EINVAL;
        break;
    case TLV_FEATURES:
    case TLV_COMPAT_ID:
        if (len != sizeof(uint32_t))
            return -EINVAL;
        break;
    case TLV_CHECKSUM:
        if (len != sizeof(uint32_t))
            return -EINVAL;
        break;
    default:
        return -EINVAL;
    }
    return 0;
}

/**
 * fwinfo_open - Allocate a per-session state buffer on open
 * @inode: Inode pointer
 * @file: File pointer for the opened device
 *
 * @return: 0 on success, -ENOMEM on allocation failure
 */
static int fwinfo_open(struct inode *inode, struct file *file)
{
    struct fw_session *session = allocate_chunk(get_block_size(sizeof(*session)));

    if (!session)
        return -ENOMEM;
    file->private_data = session;
    return 0;
}

/**
 * fwinfo_release - Free session state on file close
 * @inode: Inode pointer
 * @file: File pointer
 *
 * @return: 0
 */
static int fwinfo_release(struct inode *inode, struct file *file)
{
    free_chunk(file->private_data);
    return 0;
}

/**
 * fwinfo_write - Parse and validate TLV-encoded firmware blob
 * @file: File pointer
 * @buf: Userspace buffer with TLV input
 * @len: Size of userspace buffer
 * @ppos: Unused
 *
 * @return: Number of bytes written on success, negative error code on failure
 */
static ssize_t fwinfo_write(struct file *file, const char __user *buf, size_t len, loff_t *ppos)
{
    struct fw_session *session = file->private_data;
    u8 *kbuf;
    size_t pos = 0;
    u32 computed_crc = 0, provided_crc = 0;
    bool checksum_seen = false, checksum_validated = false;
    static u8 expected_order[] = { TLV_VERSION, TLV_TIMESTAMP, TLV_FEATURES, TLV_COMPAT_ID, TLV_CHECKSUM };
    int order_index = 0;

    char fw_version[128] = {};
    u64 timestamp = 0;
    u32 features = 0, compat_id = 0;

    if (len == 0 || len > MAX_FW_SIZE)
        return -EINVAL;

    kbuf = allocate_chunk(get_block_size(len));
    if (!kbuf)
        return -ENOMEM;

    if (copy_from_user(kbuf, buf, len)) {
        free_chunk(kbuf);
        return -EFAULT;
    }

    memset(session->report_buf, 0, MAX_BUF_SIZE);
    session->report_len = 0;
    session->read_pos = 0;

    while (pos + 3 <= len) {
        u8 type = kbuf[pos];
        u16 tlv_len = (kbuf[pos + 1] << 8) | kbuf[pos + 2];
        if (tlv_len > len - pos - 3 || tlv_len > SIZE_MAX - 3) {
            report_error(session, "TLV length causes overflow or exceeds buffer.\n");
            break;
        }
        size_t block_len = 3 + tlv_len;

        if (order_index >= ARRAY_SIZE(expected_order) || type != expected_order[order_index]) {
            report_error(session, "Unexpected TLV order or type.\n");
            break;
        }
        order_index++;

        if (validate_tlv(type, tlv_len, session) < 0) {
            report_error(session, "TLV validation failed.\n");
            break;
        }

        if (type != TLV_CHECKSUM)
        computed_crc = crc32_le(computed_crc, &kbuf[pos], block_len);

        switch (type) {
        case TLV_VERSION:
            if (tlv_len <= sizeof(fw_version) - 1 && pos + 3 + tlv_len <= len) {
                memcpy(fw_version, kbuf + pos + 3, tlv_len);
                fw_version[tlv_len] = '\0';
            } else {
                report_error(session, "Invalid TLV length or OOB access in VERSION.\n");
                break;
            }
            break;
        case TLV_TIMESTAMP:
            if (tlv_len != sizeof(timestamp) || pos + 3 + sizeof(timestamp) > len) {
                report_error(session, "Invalid TLV length or OOB access in TIMESTAMP.\n");
                break;
            }
            memcpy(&timestamp, kbuf + pos + 3, sizeof(timestamp));
            break;
        case TLV_FEATURES:
            if (tlv_len != sizeof(features) || pos + 3 + sizeof(features) > len) {
                report_error(session, "Invalid TLV length or OOB access in FEATURES.\n");
                break;
            }
            memcpy(&features, kbuf + pos + 3, sizeof(features));
            break;
        case TLV_COMPAT_ID:
            if (tlv_len != sizeof(compat_id) || pos + 3 + sizeof(compat_id) > len) {
                report_error(session, "Invalid TLV length or OOB access in COMPAT_ID.\n");
                break;
            }
            memcpy(&compat_id, kbuf + pos + 3, sizeof(compat_id));
            break;
        case TLV_CHECKSUM:
            checksum_seen = true;
            if (tlv_len != sizeof(provided_crc) || pos + 3 + sizeof(provided_crc) > len) {
                report_error(session, "Invalid TLV length or OOB access in CHECKSUM.\n");
                break;
            }
            memcpy(&provided_crc, kbuf + pos + 3, sizeof(provided_crc));
            if (provided_crc != computed_crc)
                report_error(session, "Checksum mismatch.\n");
            else
                checksum_validated = true;
            break;
        }

        pos += block_len;
    }

    if (!checksum_seen)
        report_error(session, "Missing checksum TLV.\n");
    else if (!checksum_validated)
        report_error(session, "Invalid checksum.\n");

    if (session->report_len == 0) {
        session->report_len = snprintf(session->report_buf, MAX_BUF_SIZE,
            "Firmware Version: %s\nBuild Timestamp: %llu\nFeatures: 0x%08x\nCompat ID: 0x%08x\n",
            fw_version[0] ? fw_version : "N/A", timestamp, features, compat_id);
    }

    free_chunk(kbuf);
    return len;
}

/**
 * fwinfo_read - Return parsed firmware metadata or error messages
 * @file: File pointer
 * @buf: Destination user buffer
 * @len: Requested read length
 * @ppos: Unused
 *
 * @return: Number of bytes read, 0 on EOF, or negative error code
 */
static ssize_t fwinfo_read(struct file *file, char __user *buf, size_t len, loff_t *ppos)
{
    struct fw_session *session = file->private_data;
    if (session->read_pos >= session->report_len)
        return 0;

    if (len > session->report_len - session->read_pos)
        len = session->report_len - session->read_pos;

    if (copy_to_user(buf, session->report_buf + session->read_pos, len))
        return -EFAULT;

    session->read_pos += len;
    return len;
}

static const struct file_operations fwinfo_fops = {
    .owner = THIS_MODULE,
    .open = fwinfo_open,
    .release = fwinfo_release,
    .write = fwinfo_write,
    .read = fwinfo_read,
};

/**
 * fwinfo_init - Module initialization
 *
 * Allocates character device region, sets up cdev and class, and creates device node.
 *
 * @return: 0 on success, negative error code on failure
 */
static int __init fwinfo_init(void)
{
    int err;
    err = alloc_chrdev_region(&dev_number, 0, 1, DEVICE_NAME);
    if (err < 0)
        return err;

    cdev_init(&fwinfo_cdev, &fwinfo_fops);
    fwinfo_cdev.owner = THIS_MODULE;

    err = cdev_add(&fwinfo_cdev, dev_number, 1);
    if (err)
        goto unregister;

    fwinfo_class = class_create(CLASS_NAME);
    if (IS_ERR(fwinfo_class)) {
        err = PTR_ERR(fwinfo_class);
        goto del_cdev;
    }

    device_create(fwinfo_class, NULL, dev_number, NULL, DEVICE_NAME);
    return 0;

del_cdev:
    cdev_del(&fwinfo_cdev);
unregister:
    unregister_chrdev_region(dev_number, 1);
    return err;
}

/**
 * fwinfo_exit - Module cleanup
 *
 * Destroys device, class, and character device.
 */
static void __exit fwinfo_exit(void)
{
    device_destroy(fwinfo_class, dev_number);
    class_destroy(fwinfo_class);
    cdev_del(&fwinfo_cdev);
    unregister_chrdev_region(dev_number, 1);
}

module_init(fwinfo_init);
module_exit(fwinfo_exit);


MODULE_LICENSE("GPL");
MODULE_AUTHOR("Stanley Goodspeed");
MODULE_DESCRIPTION("Per-session firmware TLV validator with CRC32");
MODULE_VERSION("1.4");