
#ifndef __KERNEL_STUB_DEFS_H__
#define __KERNEL_STUB_DEFS_H__

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <stdbool.h>
#include <assert.h>
/* pull the real definition first */
#include <sys/types.h>

/* only define our stand-in if glibc didn’t already */

/* --- bool support for gnu89 -------------------------------------------- */
#include <stdbool.h>          /* may #define bool _Bool (invalid in gnu89) */
#ifdef bool                   /* if that macro exists, scrap it            */
#  undef bool
#endif
typedef unsigned char bool;   /* real typedef that works everywhere        */
#ifndef true
#  define true  1
#  define false 0
#endif
/* ----------------------------------------------------------------------- */

/* ─────────────────────────────  KNOTES DRIVER STUBS  ─────────────────────── */
#define MAX_BUF_SIZE   4096            /* size of knotes response buffer  */
#define MAX_CMD_SIZE   2048            /* max size of a user command      */

typedef int          atomic_t;         /* <linux/atomic.h> stand-in       */
#define ATOMIC_INIT(v)   (v)
static inline int atomic_inc_return(atomic_t *v) { return ++(*v); }

/* ---------- very small list.h subset ---------- */
struct list_head { struct list_head *next, *prev; };

#define LIST_HEAD(name) \
    struct list_head name = { &(name), &(name) }

#define INIT_LIST_HEAD(ptr)        do { (ptr)->next = (ptr); (ptr)->prev = (ptr);} while (0)
#define list_empty(head)           ((head)->next == (head))

#define list_add_tail(newent, head)                                             \
    do {                                                                        \
        struct list_head *__prev = (head)->prev;                                \
        (newent)->next = (head);                                                \
        (newent)->prev = __prev;                                                \
        __prev->next  = (newent);                                               \
        (head)->prev  = (newent);                                               \
    } while (0)

#define list_for_each_entry(pos, head, member)                                  \
    for (pos = (typeof(pos))((head)->next);                                     \
         &pos->member != (head);                                                \
         pos = (typeof(pos))(pos->member.next))

#define list_first_entry(ptr, type, member)                                     \
    ((type *)((char *)((ptr)->next) - offsetof(type, member)))

/* ---------- knotes-specific flags & opcodes ---------- */
#define NOTE_FLAG_HAS_META  0x1

enum { CREATE_NOTE = 1, DELETE_NOTE = 2, EDIT_NOTE = 3, READ_NOTE = 4 };

/* ---------- tiny heap helpers used by knotes ---------- */
static inline void *kheap_alloc(size_t sz) { return malloc(sz); }
static inline void  kheap_free(void *p)    { free(p);   }

/* ---------- minimal data structures ---------- */
struct note {
    uint32_t id;
    uint32_t payload_len;
    uint32_t capacity;
    uint8_t  flags;
    uint8_t  data[1];                    /* flexible array tail */
};

struct note_cmd {
    uint32_t cmd;
    struct note cnote;
};

struct note_response {
    int      resp_lock;                  /* stub mutex (int)       */
    size_t   resp_len;
    uint8_t  resp_buf[MAX_BUF_SIZE];
};

struct knote {
    struct list_head list;
    int      id;
    size_t   payload_len;
    size_t   capacity;
    uint8_t  flags;
    uint8_t  data[1];      /* flexible array member */
    int      lock;         /* stub for mutex        */
};

/* ───────────────  EXTRA KERNEL/CHAR-DEV STUBS  ─────────────── */
/* -------- list helpers still missing -------- */
#ifndef STUB_LIST_DEL_DEFINED
#define STUB_LIST_DEL_DEFINED
static inline void list_del(struct list_head *entry)
{
    entry->next->prev = entry->prev;
    entry->prev->next = entry->next;
    entry->next = entry->prev = entry;         /* poison */
}
#endif
/* -------- char-device & dev_t plumbing -------- */
#ifndef __dev_t_defined        /* glibc sets this in <sys/types.h> */
typedef unsigned long long dev_t;
#define __dev_t_defined 1
#endif


#define DEVICE_NAME  "knotes"
#define CLASS_NAME   "knotes"

static inline int  MAJOR(dev_t dev)               { return (int)(dev >> 20); }
static inline dev_t MKDEV(int major,int minor)    { return ((dev_t)major << 20) | minor; }

static inline int alloc_chrdev_region(dev_t *dev,
                                      unsigned baseminor,
                                      unsigned count,
                                      const char *name)
{
    *dev = MKDEV(1337, 0);
    (void)baseminor; (void)count; (void)name;
    return 0;
}

static inline void unregister_chrdev_region(dev_t dev, unsigned count)
{
    (void)dev; (void)count;
}

/* --- very small character-device model --------------------------------- */
struct cdev {
    const struct file_operations *ops;
    void *owner;                      /* usually module owner */
};


static inline void cdev_init(struct cdev *c, const struct file_operations *fops)
{ (void)c; (void)fops; }

static inline int cdev_add(struct cdev *c, dev_t dev, unsigned count)
{ (void)c; (void)dev; (void)count; return 0; }

static inline void cdev_del(struct cdev *c) { (void)c; }

/* -------------------------------------------------------------------------- */

/* ──────────────────────────  end KNOTES DRIVER STUBS  ────────────────────── */

typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

#define __user
#define __iomem
#define __init
#define __exit
#define __attribute__(x)
#define likely(x)   (x)
#define unlikely(x) (x)
#define BUG_ON(x) assert(!(x))
#define BUG() assert(0)
#define WARN_ON(x) assert(!(x))
#define WARN_ON_ONCE(x) assert(!(x))
#define BUILD_BUG_ON(condition) assert(!(condition))
#define BUILD_BUG_ON_ZERO(condition) (0)
#define container_of(ptr, type, member) ((type *)((char *)(ptr) - offsetof(type, member)))
#define THIS_MODULE ((void *)1)
#define MODULE_NAME "kernel_stub_defs"
#define MODULE_VERSION "1.0"
#define MODULE_INFO(name, value) do {} while (0)
#define MODULE_ALIAS(x) do {} while (0)
#define MODULE_DEVICE_TABLE(x, y) do {} while (0)
#define MODULE_SUPPORTED_DEVICE(x) do {} while (0)
#define MODULE_PARM_DESC(name, desc) do {} while (0)
#define MODULE_PARM(name, type) do {} while (0)
#ifdef MODULE_AUTHOR
# undef MODULE_AUTHOR
#endif
#define MODULE_AUTHOR(x)       
#define GFP_KERNEL 0
#define ENOMEM 12
#define EINVAL 22
#define EFAULT 14
#define EBUSY 16
#define ESPIPE 29

#define DEFINE_MUTEX(name) int name = 0
#define mutex_init(m) do {} while (0)
#define mutex_lock(m) do {} while (0)
#define mutex_unlock(m) do {} while (0)
#define mutex_trylock(m) 1

#define copy_from_user(dst, src, size) memcpy((dst), (src), (size))
#define copy_to_user(dst, src, size)   memcpy((dst), (src), (size))

#define class_create(...)      ((void *)1)
#define class_destroy(x)       do {} while (0)
#define device_create(...)     ((void *)1)
#define device_destroy(...)    do {} while (0)
#define PTR_ERR(x)             (-1)
#define IS_ERR(x)              (0)

#define register_chrdev(...)   1
#define unregister_chrdev(...) do {} while (0)


struct mutex {};
struct inode {};
struct file {
    void *private_data;
    loff_t f_pos;
};

#undef memcpy
#define memcpy(dst, src, size) __klee_fake_memcpy(dst, src, size, #dst)

__attribute__((noinline)) static inline void *__klee_fake_memcpy(void *dst, const void *src, size_t size, const char *name) {
    if (!dst || !src || size == 0) return dst;

    // Optionally constrain max size
    if (size > 4096) size = 4096;

    // Tell KLEE this region is symbolic (write symbolic content into dst)
    klee_make_symbolic(dst, size, name);

    return dst;
}




void *kzalloc(size_t size, int flags) { return malloc(size); }
void kfree(void *ptr) { free(ptr); }

// Provide dummy versions of the internal allocators
void *allocate_chunk(size_t sz) { return malloc(sz); }
void  free_chunk(void *p)       { free(p); }
size_t get_block_size(size_t len) { return len; }

/* ---------- quiet logging / module macros ---------- */
#define pr_err(...)        do { } while (0)
#define pr_debug(...)      do { } while (0)
#define MODULE_LICENSE(x)
#define MODULE_DESCRIPTION(x)
#define module_init(x)
#define module_exit(x)
#define __init
#define __exit
/* ---------- minimal Netfilter support ---------- */
#define NF_ACCEPT 1
#define NF_DROP 0
#define NF_STOLEN 2
#define NF_QUEUE 3
#define NF_REPEAT 4

#define NF_INET_PRE_ROUTING 0
#define NF_INET_LOCAL_IN     1
#define NF_INET_FORWARD      2
#define NF_INET_LOCAL_OUT    3
#define NF_INET_POST_ROUTING 4

#define PF_INET 2
#define NF_IP_PRI_FIRST 0

struct net { int dummy; };
static struct net init_net = { 0 };

#ifndef STUB_NOTIFIER_BLOCK
#define STUB_NOTIFIER_BLOCK

struct notifier_block {
    int (*notifier_call)(struct notifier_block *nb, unsigned long action, void *data);
    struct notifier_block *next;
    int priority;
};

#define NOTIFY_OK 0

#endif

struct nf_hook_ops {
    unsigned int (*hook)(void *priv, struct sk_buff *skb, const struct nf_hook_state *state);
    struct net *pf_net;
    int hooknum;
    int pf;
    int priority;
};

static inline int nf_register_net_hook(struct net *net, const struct nf_hook_ops *ops) {
    return 0;
}

static inline void nf_unregister_net_hook(struct net *net, const struct nf_hook_ops *ops) {
    return;
}


/* ---------- minimal memory / task stubs ---------- */
#define PAGE_SIZE 4096UL

struct mm_struct { };
struct task_struct { struct mm_struct *mm; };
static struct task_struct __dummy_task;
#define current (&__dummy_task)

static inline void *task_stack_page(struct task_struct *t) { return (void *)0x70000000; }
/* ---------- minimal netfilter / networking stubs ---------- */
struct sk_buff            { unsigned char _pad[256]; };
struct nf_hook_state      { unsigned long _pad; };

/* ---------- minimal PTE model ---------- */
typedef struct { unsigned long v; } pte_t;
static inline pte_t  *virt_to_kpte(unsigned long a)          { static pte_t d; return &d; }
static inline int     pte_exec(pte_t p)                      { return 1; }          /* exec bit set */
static inline pte_t   pte_mkexec(pte_t p)                    { return p; }
static inline void    set_pte_at(void *mm, unsigned long a,
                                  pte_t *p, pte_t val)       { *p = val; }

/* ---------- init / export helpers ---------- */
#define core_initcall(fn)
#define EXPORT_SYMBOL(sym)
// ----- crypto API stubs -----
struct scatterlist { unsigned char pad[64]; };

static inline void sg_init_one(struct scatterlist *sg, const void *buf, unsigned int buflen) {
    (void)sg; (void)buf; (void)buflen;
}

struct crypto_skcipher {};
struct skcipher_request {};

static inline int crypto_skcipher_encrypt(struct skcipher_request *req) { return 0; }
static inline int crypto_skcipher_decrypt(struct skcipher_request *req) { return 0; }
static inline int crypto_skcipher_setkey(struct crypto_skcipher *tfm, const u8 *key, unsigned int keylen) { return 0; }
static inline struct crypto_skcipher *crypto_alloc_skcipher(const char *alg_name, int type, int mask) { return (struct crypto_skcipher *)1; }
static inline void crypto_free_skcipher(struct crypto_skcipher *tfm) { (void)tfm; }
static inline struct skcipher_request *skcipher_request_alloc(struct crypto_skcipher *tfm, int gfp) { return (struct skcipher_request *)1; }
static inline void skcipher_request_free(struct skcipher_request *req) { (void)req; }
static inline void skcipher_request_set_crypt(struct skcipher_request *req, struct scatterlist *src,
                                              struct scatterlist *dst, size_t len, void *iv) {}

struct file_operations {
    void *owner;
    int (*open)(struct inode *, struct file *);
    int (*release)(struct inode *, struct file *);
    ssize_t (*write)(struct file *, const char __user *, size_t, loff_t *);
    ssize_t (*read)(struct file *, char __user *, size_t, loff_t *);
    loff_t (*llseek)(struct file *, loff_t, int);
};


#endif /* __KERNEL_STUB_DEFS_H__ */
