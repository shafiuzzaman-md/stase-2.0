/*
 * knotes.h - Internal definitions for knotes character device driver
 *
 * Defines the user-facing note structure, internal kernel representation (knote),
 * command formats, response buffer, and related constants. This header is intended
 * for use only within the knotes driver implementation.
 *
 * Author: Challenge Author
 */
#ifndef _KNOTES_H
#define _KNOTES_H

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/mutex.h>
#include <linux/kheap.h>
#include <linux/ctype.h>

#define DEVICE_NAME "knotes"
#define CLASS_NAME  "knotes_class"

#define MAX_BUF_SIZE         2048 
#define NOTE_FLAG_HAS_META   0x1
#define MAX_CMD_SIZE         1024 

struct note {
    uint32_t id;
    uint64_t capacity;
    uint32_t flags;
    uint64_t payload_len;
    uint8_t data[];
};

struct knote {
    uint32_t id;
    struct mutex lock; 
    struct list_head list;
    uint64_t capacity;
    uint32_t flags;
    uint64_t payload_len;
    uint8_t data[];

};

struct note_cmd {
    uint64_t cmd;
    struct note cnote;
};

struct note_response {
    char resp_buf[MAX_BUF_SIZE];
    size_t resp_len;
    struct mutex resp_lock;
};

enum {
    CREATE_NOTE = 0x01,
    DELETE_NOTE,
    EDIT_NOTE,
    READ_NOTE
};


/* Function prototypes */
int create_response(struct knote *unote, struct note_response *response);
int create_del_response(uint32_t id, struct note_response *response);
void copy_note_to_knote(const struct note *src, struct knote *dst, bool start_at_capacity, size_t alloc_capacity);
int evaluate_cmd(struct note_cmd *ncmd, struct note_response *response);

#endif /* _KNOTES_H */