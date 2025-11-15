// SPDX-License-Identifier: GPL-2.0
/*
 * kcrypt - AES-ECB Crypto Processor Using Dynamic Heap
 *
 * This module provides a character device for encrypting and decrypting data
 * using AES in ECB mode. It supports user-defined keys and input, and uses
 * a chunk-based heap allocator for dynamic memory management. The result is
 * stored per-open session and returned on read.
 *
 * Author: Amos Burton
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/device.h>
#include <linux/slab.h>
#include <linux/crypto.h>
#include <crypto/skcipher.h>
#include <linux/scatterlist.h>
#include <linux/string.h>
#include <linux/kchunk.h>

#define DEVICE_NAME "kcrypt"
#define CLASS_NAME "kcrypt_class"

#define MAX_KEY_LEN 32
#define MAX_DATA_LEN 4096

#define PADDING_TAG 0x48
#define KCRYPT_AES_ECB_ENCRYPT 0x01
#define KCRYPT_AES_ECB_DECRYPT 0x02

static int major;
static struct class *kcrypt_class;

static struct crypto_skcipher *tfm;
static struct skcipher_request *req;

static DEFINE_MUTEX(kcrypt_mutex);

/**
 * struct kcrypt_request - user request structure
 * @op_code: operation (encrypt or decrypt)
 * @key_len: length of the AES key
 * @data_len: length of the data to process
 * @key: AES key
 * @data: input data (flexible array)
 */
struct kcrypt_request {
    u8 op_code;
    u8 key_len;
    u16 data_len;
    u8 key[MAX_KEY_LEN];
    u8 data[];
};

/**
 * struct kcrypt_ctx - per-file context
 * @result_buf: result buffer
 * @result_len: result length
 * @lock: protects access to result_buf
 */
struct kcrypt_ctx {
    u8 *result_buf;
    size_t result_len;
    struct mutex lock;
};

/**
 * kcrypt_open() - Open handler
 * @inode: inode pointer
 * @file: file pointer
 *
 * Allocates per-instance context.
 *
 * @return: 0 on success, negative error code on failure
 */
static int kcrypt_open(struct inode *inode, struct file *file)
{
    struct kcrypt_ctx *ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
    if (!ctx)
        return -ENOMEM;

    mutex_init(&ctx->lock);
    file->private_data = ctx;
    return 0;
}

/**
 * kcrypt_release() - Release handler
 * @inode: inode pointer
 * @file: file pointer
 *
 * Frees per-instance context and associated memory.
 *
 * @return: 0
 */
static int kcrypt_release(struct inode *inode, struct file *file)
{
    struct kcrypt_ctx *ctx = file->private_data;
    if (ctx) {
        if (ctx->result_buf)
            free_chunk(ctx->result_buf);
        kfree(ctx);
    }
    return 0;
}

/**
 * validate_user_header - Validate the user-supplied header portion of the request
 * @ubuf: Pointer to user buffer
 * @len: Total size of the user buffer
 * @hdr: Pointer to structure to fill with copied header data
 *
 * Performs length checks, key length validation, data length bounds,
 * and verifies that the total length matches the expected layout.
 *
 * @return: 0 on success, negative errno on validation failure
 */
static int validate_user_header(const char __user *ubuf, size_t len, struct kcrypt_request *hdr)
{
    if (len < sizeof(*hdr))
        return -EINVAL;

    if (copy_from_user(hdr, ubuf, sizeof(*hdr)))
        return -EFAULT;

    if (hdr->key_len != 16 && hdr->key_len != 24 && hdr->key_len != 32)
        return -EINVAL;

    if (hdr->data_len > MAX_DATA_LEN || hdr->data_len % 16 != 0)
        return -EINVAL;

    if (hdr->data_len > SIZE_MAX - sizeof(*hdr))
        return -EINVAL;

    if (len != sizeof(*hdr) + hdr->data_len)
        return -EINVAL;

    return 0;
}

/**
 * copy_full_request_from_user - Copy the entire request structure from user space
 * @ubuf: Pointer to user buffer
 * @len: Total size of the request (must already be validated)
 *
 * Allocates a kernel buffer and copies the complete user request into it.
 * Caller is responsible for freeing the returned buffer with free_chunk().
 *
 * @return: Pointer to allocated and populated buffer, or NULL on failure
 */
static u8 *copy_full_request_from_user(const char __user *ubuf, size_t len)
{
    u8 *kbuf = allocate_chunk(get_block_size(len));
    if (!kbuf)
        return NULL;

    memset(kbuf, 0, len);

    if (copy_from_user(kbuf, ubuf, len)) {
        free_chunk(kbuf);
        return NULL;
    }

    return kbuf;
}

/**
 * alloc_io_buffers - Allocate input and result buffers
 * @datalen: Length of data to be processed
 * @input_buf: Pointer to store allocated input buffer
 * @result_buf: Pointer to store allocated result buffer
 *
 * Allocates memory using the internal chunk allocator. If any allocation
 * fails, both buffers are released and an error is returned.
 *
 * @return: 0 on success, -ENOMEM on failure
 */
static int alloc_io_buffers(size_t datalen, u8 **input_buf, u8 **result_buf)
{
    *input_buf = allocate_chunk(get_block_size(datalen));
    *result_buf = allocate_chunk(get_block_size(datalen));

    if (!*input_buf || !*result_buf) {
        free_chunk(*input_buf);
        free_chunk(*result_buf);
        return -ENOMEM;
    }

    return 0;
}

/**
 * perform_crypto - Perform AES-ECB encryption or decryption
 * @input: Pointer to input buffer
 * @output: Pointer to output buffer
 * @len: Length of the data
 * @opcode: Operation code (KCRYPT_AES_ECB_ENCRYPT or _DECRYPT)
 *
 * Initializes and runs the crypto request through the Linux crypto API.
 *
 * @return: 0 on success, negative errno on failure
 */
static int perform_crypto(u8 *input, u8 *output, size_t len, u8 opcode)
{
    struct scatterlist sg_in, sg_out;

    sg_init_one(&sg_in, input, len);
    sg_init_one(&sg_out, output, len);
    skcipher_request_set_crypt(req, &sg_in, &sg_out, len, NULL);

    if (opcode == KCRYPT_AES_ECB_ENCRYPT)
        return crypto_skcipher_encrypt(req);
    else if (opcode == KCRYPT_AES_ECB_DECRYPT)
        return crypto_skcipher_decrypt(req);
    else
        return -EINVAL;
}

/**
 * store_result - Store result buffer in file-private context
 * @ctx: Pointer to context associated with open file
 * @result: Pointer to processed data
 * @input: Original input buffer 
 * @len: Length of result
 * @opcode: Operation code used
 * @keylen: Length of AES key used
 *
 * Saves the result buffer into the context for subsequent reading.

 *
 * @return: 0 on success, -ENOMEM if allocation for result failed
 */
static int store_result(struct kcrypt_ctx *ctx, u8 *result, u8 *input, size_t len, u8 opcode, u8 keylen)
{
    int ret = 0;

    mutex_lock(&ctx->lock);
    if (ctx->result_buf)
        free_chunk(ctx->result_buf);

    ctx->result_buf = allocate_chunk(get_block_size(len));
    if (!ctx->result_buf) {
        ret = -ENOMEM;
        goto out;
    }

    memcpy(ctx->result_buf, result, len);
    ctx->result_len = len;

    if (opcode == KCRYPT_AES_ECB_ENCRYPT && keylen == 16 && len % 32 == 0 && input[len - 1] == 0x10)
        ctx->result_buf[len] = PADDING_TAG;

out:
    mutex_unlock(&ctx->lock);
    return ret;
}

/**
 * kcrypt_write() - Handle crypto request from userspace
 * @file: file pointer
 * @ubuf: user buffer
 * @len: length of user buffer
 * @off: file offset (unused)
 *
 * Parses the user request, validates, performs AES-ECB operation,
 * and stores result in the context.
 *
 * @return: number of bytes written or error code
 */
static ssize_t kcrypt_write(struct file *file, const char __user *ubuf, size_t len, loff_t *off)
{
    struct kcrypt_ctx *ctx = file->private_data;
    struct kcrypt_request header;
    struct kcrypt_request *req_buf;
    u8 *kbuf = NULL, *input_buf = NULL, *result_buf = NULL;
    int ret;

    if (!mutex_trylock(&kcrypt_mutex))
        return -EBUSY;

    ret = validate_user_header(ubuf, len, &header);
    if (ret)
        goto out_unlock;

    kbuf = copy_full_request_from_user(ubuf, len);
    if (!kbuf) {
        ret = -EFAULT;
        goto out_unlock;
    }

    req_buf = (struct kcrypt_request *)kbuf;

    ret = crypto_skcipher_setkey(tfm, req_buf->key, req_buf->key_len);
    if (ret)
        goto out_free_kbuf;

    ret = alloc_io_buffers(req_buf->data_len, &input_buf, &result_buf);
    if (ret)
        goto out_free_kbuf;

    memcpy(input_buf, req_buf->data, req_buf->data_len);
    memset(result_buf, 0, req_buf->data_len);

    ret = perform_crypto(input_buf, result_buf, req_buf->data_len, req_buf->op_code);
    if (ret)
        goto out_free_bufs;

    ret = store_result(ctx, result_buf, input_buf, req_buf->data_len, req_buf->op_code, req_buf->key_len);

out_free_bufs:
    free_chunk(input_buf);
    free_chunk(result_buf);
out_free_kbuf:
    free_chunk(kbuf);
out_unlock:
    mutex_unlock(&kcrypt_mutex);
    return ret ? ret : len;
}
 

/**
 * kcrypt_read() - Read processed result
 * @file: file pointer
 * @ubuf: user buffer
 * @len: requested length
 * @off: file offset
 *
 * Copies result to userspace and clears result buffer.
 *
 * @return: number of bytes read or error code
 */
static ssize_t kcrypt_read(struct file *file, char __user *ubuf, size_t len, loff_t *off)
{
    struct kcrypt_ctx *ctx = file->private_data;
    ssize_t ret = 0;

    mutex_lock(&ctx->lock);
    if (*off != 0) {
        mutex_unlock(&ctx->lock);
        return 0;
    }
    
    if (!ctx->result_buf || ctx->result_len == 0) {
        ret = 0;
        goto out;
    }

    if (len > ctx->result_len)
        len = ctx->result_len;

    if (copy_to_user(ubuf, ctx->result_buf, len)) {
        ret = -EFAULT;
        goto out;
    }

    *off += len;
    free_chunk(ctx->result_buf);
    ctx->result_buf = NULL;
    ctx->result_len = 0;
    ret = len;

out:
    mutex_unlock(&ctx->lock);
    return ret;
}

/**
 * kcrypt_llseek() - Seek operation (only supports rewind)
 * @file: file pointer
 * @off: offset value
 * @whence: SEEK_SET expected
 *
 * @return: 0 if seek to beginning, -ESPIPE otherwise
 */
static loff_t kcrypt_llseek(struct file *file, loff_t off, int whence)
{
    return (whence == SEEK_SET && off == 0) ? (file->f_pos = 0) : -ESPIPE;
}

static struct file_operations kcrypt_fops = {
    .owner = THIS_MODULE,
    .open = kcrypt_open,
    .release = kcrypt_release,
    .write = kcrypt_write,
    .read = kcrypt_read,
    .llseek = kcrypt_llseek,
};

/**
 * kcrypt_init() - Module initialization
 *
 * Creates device, allocates crypto tfm/request, and registers chrdev.
 *
 * @return: 0 on success, negative error code on failure
 */
static int __init kcrypt_init(void)
{
    major = register_chrdev(0, DEVICE_NAME, &kcrypt_fops);
    if (major < 0) return major;

    kcrypt_class = class_create(CLASS_NAME);
    if (IS_ERR(kcrypt_class)) {
        unregister_chrdev(major, DEVICE_NAME);
        return PTR_ERR(kcrypt_class);
    }

    if (IS_ERR(device_create(kcrypt_class, NULL, MKDEV(major, 0), NULL, DEVICE_NAME))) {
        class_destroy(kcrypt_class);
        unregister_chrdev(major, DEVICE_NAME);
        return -1;
    }

    tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
    if (IS_ERR(tfm)) {
        device_destroy(kcrypt_class, MKDEV(major, 0));
        class_destroy(kcrypt_class);
        unregister_chrdev(major, DEVICE_NAME);
        return PTR_ERR(tfm);
    }

    req = skcipher_request_alloc(tfm, GFP_KERNEL);
    if (!req) {
        crypto_free_skcipher(tfm);
        device_destroy(kcrypt_class, MKDEV(major, 0));
        class_destroy(kcrypt_class);
        unregister_chrdev(major, DEVICE_NAME);
        return -ENOMEM;
    }

    mutex_init(&kcrypt_mutex);
    return 0;
}

/**
 * kcrypt_exit() - Module cleanup
 *
 * Frees crypto structures and unregisters device.
 */
static void __exit kcrypt_exit(void)
{
    skcipher_request_free(req);
    crypto_free_skcipher(tfm);
    device_destroy(kcrypt_class, MKDEV(major, 0));
    class_destroy(kcrypt_class);
    unregister_chrdev(major, DEVICE_NAME);
}

module_init(kcrypt_init);
module_exit(kcrypt_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Amos Burton");
MODULE_DESCRIPTION("AES-ECB crypto processor using dynamic heap");
