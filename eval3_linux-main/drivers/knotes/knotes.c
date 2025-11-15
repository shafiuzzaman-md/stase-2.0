// SPDX-License-Identifier: GPL-2.0
/*
 * knotes - A character device interface for managing in-kernel "note" objects
 *
 * Each open() session allocates a private response buffer. Users issue binary
 * commands to create, modify, delete, and read in-kernel notes, which are 
 * tracked in a global list protected by a mutex. Each note can hold arbitrary 
 * payload data with optional metadata.
 *
 * Author: Dirk Gently
 */

#include "knotes.h"

static int major_number;
static struct class *knotes_class;
static struct device *knotes_device;
static struct cdev knotes_cdev;

static LIST_HEAD(note_list);
static DEFINE_MUTEX(note_list_lock);
static atomic_t next_note_id = ATOMIC_INIT(0);

/**
 * knotes_open - Allocate private response buffer for the session
 * @inode: inode structure
 * @file:  file pointer
 *
 * Allocates and initializes a struct note_response associated with the file.
 *
 * @return: 0 on success, -ENOMEM on failure
 */
static int knotes_open(struct inode *inode, struct file *file)
{
    struct note_response *response;

    response = kheap_alloc(sizeof(*response));
    if (!response)
        return -ENOMEM;

    mutex_init(&response->resp_lock);
    response->resp_len = 0;
	memset(response->resp_buf, 0, MAX_BUF_SIZE);

    file->private_data = response;
    return 0;
}

/**
 * knotes_release - Free per-session response buffer
 * @inode: inode structure
 * @file: file pointer
 *
 * Frees the struct note_response associated with the session.
 *
 * @return: 0
 */
static int knotes_release(struct inode *inode, struct file *file)
{
    kheap_free(file->private_data);
    return 0;
}

/**
 * knotes_llseek - Restrict llseek usage to SEEK_SET 0
 * @file: file pointer
 * @offset: requested offset
 * @whence: seek directive
 *
 * Only SEEK_SET to offset 0 is allowed.
 *
 * @return: 0 if reset, -ESPIPE otherwise
 */
static loff_t knotes_llseek(struct file *file, loff_t offset, int whence)
{
    return (whence == SEEK_SET && offset == 0) ? (file->f_pos = 0) : -ESPIPE;
}

/**
 * knotes_write - Handle user command input to manipulate notes
 * @file: file pointer
 * @buf: user-supplied input buffer
 * @len: length of input buffer
 * @ppos: file position (unused)
 *
 * Parses a user-supplied note_cmd structure and dispatches to
 * create/edit/delete/read logic. The result is stored in the session's
 * response buffer.
 *
 * @return: number of bytes consumed on success, negative error code on failure
 */
static ssize_t knotes_write(struct file *file, const char __user *buf, size_t len, loff_t *ppos)
{
    struct note_cmd head;
    struct note_cmd *ncmd = NULL;
    struct note_response *response;
    size_t needed_len;
    int ret;

    if (!file || !file->private_data)
        return -EINVAL;

    response = file->private_data;

    if (!response || len < sizeof(struct note_cmd))
        return -EINVAL;

    if (len > MAX_CMD_SIZE)
        return -EINVAL;

    if (copy_from_user(&head, buf, sizeof(head)) != 0)
        return -EFAULT;

    if (head.cnote.payload_len > MAX_CMD_SIZE ||
        head.cnote.capacity > MAX_CMD_SIZE)
        return -EINVAL;

    needed_len = offsetof(struct note_cmd, cnote.data) + head.cnote.payload_len;
    if (head.cnote.flags & NOTE_FLAG_HAS_META)
        needed_len += 1;

    if (needed_len > MAX_CMD_SIZE || len < needed_len)
        return -EINVAL;

    ncmd = kheap_alloc(needed_len);
    if (!ncmd)
        return -ENOMEM;

    if (copy_from_user(ncmd, buf, needed_len) != 0) {
        kheap_free(ncmd);
        return -EFAULT;
    }

    ret = evaluate_cmd(ncmd, response);
    kheap_free(ncmd);

    return (ret >= 0) ? len : ret;
}
 
 
 /**
  * knotes_read - Return response from last command
  * @file: file pointer
  * @buf: user buffer to copy response into
  * @len: size of user buffer
  * @ppos: file position
  *
  * Copies the response buffer to userspace, if available. Only valid on
  * initial read (ppos == 0), and response buffer is cleared after use.
  *
  * @return: number of bytes copied, 0 if no data, or negative error code
  */
static ssize_t knotes_read(struct file *file, char __user *buf, size_t len, loff_t *ppos)
{
    struct note_response *response;
    ssize_t copied;

    if (!file || !file->private_data || *ppos != 0) {
        return -EINVAL;
    }

    response = file->private_data;

    mutex_lock(&response->resp_lock);

    if (len < response->resp_len) {
        mutex_unlock(&response->resp_lock);
        return -EINVAL;
    }

    if (response->resp_len == 0 || response->resp_len > MAX_BUF_SIZE) {
        mutex_unlock(&response->resp_lock);
        return 0;
    }

    if (copy_to_user(buf, response->resp_buf, response->resp_len)) {
        mutex_unlock(&response->resp_lock);
        return -EFAULT;
    }

    copied = response->resp_len;

    response->resp_len = 0;
    memset(response->resp_buf, 0, MAX_BUF_SIZE);

    mutex_unlock(&response->resp_lock);
    return copied;
}

/**
 * create_response - Format a string-based representation of a note
 * @unote: note to represent
 * @response: session response buffer
 *
 * Populates response with a printable summary of the note.
 *
 * @return: 0 on success, -ENOMEM if output buffer too small
 */
int create_response(struct knote *unote, struct note_response *response) 
{
    size_t payload_size = unote->capacity;
    size_t needed_size = 0;
    size_t space_left = MAX_BUF_SIZE-1;

    mutex_lock(&response->resp_lock);
    int written = snprintf(response->resp_buf, space_left, "Note %d: {", unote->id);
    if (written >= space_left){ 
        goto too_small;
    }

    needed_size += written;
    space_left -= written;

    if (space_left < payload_size + 2) {
        goto too_small;
    }

    memcpy(response->resp_buf + needed_size, unote->data, payload_size);
    needed_size += payload_size;
    space_left -= payload_size;

    if (unote->flags & NOTE_FLAG_HAS_META  && (unote->capacity > payload_size)) {
        uint8_t meta = unote->data[payload_size];

        if (space_left < 6) {
            goto too_small;
        }

        written = snprintf(response->resp_buf + needed_size, space_left, "[%02x]", meta);
        if (written >= space_left) {
            goto too_small;
        }

        needed_size += written;
        space_left -= written;
    }

    if (space_left < 2) {
        goto too_small;
    }

    response->resp_buf[needed_size++] = '}';
    response->resp_buf[needed_size++] = '\n';

    response->resp_len = needed_size;
    mutex_unlock(&response->resp_lock);

    return 0;

too_small:
    memset(response->resp_buf, '\0', MAX_BUF_SIZE);
    written = snprintf(response->resp_buf, MAX_BUF_SIZE, "Note %d: {Truncated}\n", unote->id);
    response->resp_len = written;
    mutex_unlock(&response->resp_lock);
    return -ENOMEM;
}

/**
 * create_del_response - Generate a deletion confirmation message
 * @id: ID of deleted note
 * @response: response buffer to populate
 *
 * Writes a fixed-format deletion confirmation message into the response.
 *
 * @return: 0 on success, -ENOMEM if buffer too small
 */
int create_del_response(uint32_t id, struct note_response *response) 
{
    size_t space_left = MAX_BUF_SIZE;
    int written;

    written = snprintf(response->resp_buf, space_left, "Note %d: {Deleted}\n", id);
    if (written >= space_left) {
        response->resp_len = 0;
        return -ENOMEM;
    }

    response->resp_len = written;
    return 0;
}

/**
 * copy_note_to_knote - Copy user-provided note fields into a kernel note
 * @src: source note structure from user
 * @dst: destination kernel note
 * @start_at_capacity: whether to start copying at 'capacity' or 'flags'
 *
 * Copies payload and metadata from a user-supplied note into a kernel note
 * structure, skipping fields based on the creation/edit mode.
 */
void copy_note_to_knote(const struct note *src, struct knote *dst, bool start_at_capacity, size_t alloc_capacity)
{
    size_t offset = start_at_capacity
        ? offsetof(struct note, capacity)
        : offsetof(struct note, flags);
    size_t koffset = start_at_capacity
        ? offsetof(struct knote, capacity)
        : offsetof(struct knote, flags);

    size_t data_limit = src->payload_len;
    if (src->flags & NOTE_FLAG_HAS_META){
        data_limit += 1;
    }

    if (data_limit > alloc_capacity)
        data_limit = alloc_capacity;

    size_t copy_len = offsetof(struct note, data) - offset + data_limit;

    memcpy((uint8_t *)dst + koffset,
           (const uint8_t *)src + offset,
           copy_len);

    if (dst->flags & NOTE_FLAG_HAS_META) {
        dst->data[dst->payload_len] = src->data[src->payload_len];
    }
}


/**
 * evaluate_cmd - Handle one user-issued command
 * @ncmd: input command containing note and opcode
 * @response: session response buffer
 *
 * Dispatches command to internal handlers (create/edit/delete/read).
 *
 * Return: 0 or positive on success, negative error code on failure
 */
int evaluate_cmd(struct note_cmd *ncmd, struct note_response *response)
{
    struct knote *unote;
    int ret = 0;

    switch (ncmd->cmd)
    {    
        case CREATE_NOTE:
            if (ncmd->cnote.capacity < ncmd->cnote.payload_len) {
                return -EINVAL;
            }

            if ((ncmd->cnote.flags == NOTE_FLAG_HAS_META) &&
                (ncmd->cnote.capacity < (ncmd->cnote.payload_len + 0x1))) {
                return -EINVAL;
            }

            size_t size = offsetof(struct knote, data) + ncmd->cnote.capacity;

            unote = kheap_alloc(size);
            if (!unote) {
                return -ENOMEM;
            }

            mutex_init(&unote->lock);
            mutex_lock(&unote->lock);
            copy_note_to_knote(&ncmd->cnote, unote, true, ncmd->cnote.capacity);
            mutex_unlock(&unote->lock);

            mutex_lock(&note_list_lock);
            unote->id = atomic_inc_return(&next_note_id);
            INIT_LIST_HEAD(&unote->list);
            list_add_tail(&unote->list, &note_list);
            mutex_unlock(&note_list_lock);

            return create_response(unote, response);

        case DELETE_NOTE:
            bool found = false;

            mutex_lock(&note_list_lock);
            list_for_each_entry(unote, &note_list, list) {
                if (unote->id == ncmd->cnote.id) {
                    list_del(&unote->list);
                    kheap_free(unote);
                    found = true;
                    break;
                }
            }
            mutex_unlock(&note_list_lock);
            
            if (!found)
                return -EINVAL;
            return create_del_response(ncmd->cnote.id, response);

        case EDIT_NOTE:
            unote = NULL;
            struct knote *tmp_edit;

            mutex_lock(&note_list_lock);
            list_for_each_entry(tmp_edit, &note_list, list) {
                if (tmp_edit->id == ncmd->cnote.id) {
                    unote = tmp_edit;
                    mutex_lock(&unote->lock);
                    break;
                }
            }
            mutex_unlock(&note_list_lock);

            if (!unote)
                return -EINVAL;

            if (unote->capacity < ncmd->cnote.payload_len) {
                mutex_unlock(&unote->lock);
                return -EINVAL;
            }

            copy_note_to_knote(&ncmd->cnote, unote, false, unote->capacity);
            ret = create_response(unote, response);
            mutex_unlock(&unote->lock);
            return ret;

        case READ_NOTE:
            unote = NULL;
            struct knote *tmp_read;

            mutex_lock(&note_list_lock);
            list_for_each_entry(tmp_read, &note_list, list) {
                if (tmp_read->id == ncmd->cnote.id) {
                    unote = tmp_read;
                    mutex_lock(&unote->lock);
                    break;
                }
            }
            mutex_unlock(&note_list_lock);

            if (!unote)
                return -EINVAL;

            ret = create_response(unote, response);
            mutex_unlock(&unote->lock);
            return ret;

        default:
            return -EINVAL;
    }

    return 0;
}

/* File operations */
static const struct file_operations knotes_fops = {
    .owner = THIS_MODULE,
    .open = knotes_open,
    .release = knotes_release,
    .read = knotes_read,
    .write = knotes_write,
    .llseek = knotes_llseek,
};

/**
 * knotes_init - Module initialization entry point
 *
 * Allocates a device number, sets up character device, and registers
 * the /dev/knotes node.
 *
 * @return: 0 on success, negative error code on failure
 */
static void __exit knotes_exit(void);
static int __init knotes_init(void)
{
    dev_t dev;
    int ret;

    ret = alloc_chrdev_region(&dev, 0, 1, DEVICE_NAME);
    if (ret)
        return ret;

    major_number = MAJOR(dev);

    cdev_init(&knotes_cdev, &knotes_fops);
    knotes_cdev.owner = NULL;
    ret = cdev_add(&knotes_cdev, dev, 1);
    if (ret)
        goto unregister_chrdev;

    knotes_class = class_create(CLASS_NAME);
    if (IS_ERR(knotes_class)) {
        ret = PTR_ERR(knotes_class);
        goto del_cdev;
    }

    knotes_device = device_create(knotes_class, NULL, dev, NULL, DEVICE_NAME);
    if (IS_ERR(knotes_device)) {
        ret = PTR_ERR(knotes_device);
        goto destroy_class;
    }

    return 0;

destroy_class:
    class_destroy(knotes_class);
del_cdev:
    cdev_del(&knotes_cdev);
unregister_chrdev:
    unregister_chrdev_region(dev, 1);
    return ret;
}

/**
 * knotes_exit - Module cleanup
 *
 * Destroys the device node, class, and character device, and unregisters
 * the device number.
 */
static void __exit knotes_exit(void)
{
    dev_t dev = MKDEV(major_number, 0);

    mutex_lock(&note_list_lock);
    while (!list_empty(&note_list)) {
        struct knote *n = list_first_entry(&note_list, struct knote, list);
        list_del(&n->list);
        kheap_free(n);
    }
    mutex_unlock(&note_list_lock);

    device_destroy(knotes_class, dev);
    class_destroy(knotes_class);
    cdev_del(&knotes_cdev);
    unregister_chrdev_region(dev, 1);
}

module_init(knotes_init);
module_exit(knotes_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Dirk Gently");
MODULE_DESCRIPTION("knotes driver");
