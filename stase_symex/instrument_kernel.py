#!/usr/bin/env python3
import argparse, shutil, re, os
from pathlib import Path
from setup_common import read_json, get_workspace, write

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--target-src", required=True, help="C file to insert the assertion into")
    parser.add_argument("--entry-src", required=True, help="C file that defines the entrypoint function")
    parser.add_argument("--assert-line", required=True, type=int)
    parser.add_argument("--assertion", required=True)
    parser.add_argument("--stub-functions", required=False, help="Optional JSON file with stubbed functions")
    parser.add_argument("--helper-files", nargs="*", default=[], help="Optional helper C files to preserve")
    parser.add_argument("--comment-lines", nargs="*", type=int, default=[], help="Lines to comment out instead of delete")
    return parser.parse_args()

def abs_stub_header(ws: Path) -> str:
    # Always point to the real one in project root
    return str((Path(__file__).resolve().parent.parent / "include" / "kernel_stub_defs.h").resolve())


def copy_preserved_files(original_src: Path, instrumented_src: Path, preserved: set):
    for rel_path in preserved:
        src_file = original_src / rel_path
        dst_file = instrumented_src / rel_path
        dst_file.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src_file, dst_file)
    print("[✓] Preserved files copied to instrumented_source")




def stub_out_irrelevant_sources(instrumented_src: Path, preserved_paths: set):
    for path in instrumented_src.rglob("*.c"):
        rel_path = str(path.relative_to(instrumented_src))
        if rel_path not in preserved_paths:
            path.write_text("/* stubbed out by instrument_kernel.py */\n")
    print("[✓] Stubbed irrelevant .c files in instrumented_source")

def stub_out_missing_headers(instrumented_src: Path):
    for path in instrumented_src.rglob("*.c"):
        content = path.read_text()
        includes = re.findall(r'#include\s+[<\"](.*?)[>\"]', content)
        for inc in includes:
            header_path = instrumented_src / inc
            if not header_path.exists():
                header_path.parent.mkdir(parents=True, exist_ok=True)
                header_path.write_text("/* stubbed header */\n")
    print("[✓] Stubbed missing headers in instrumented_source")

def write_kernel_stub_header(ws: Path):
    """
    Create include/kernel_stub_defs.h with enough stand-ins for kernel-mode code
    to compile under Clang/KLEE.  Re-creates the file on every run so edits in
    this script always win.
    """
    include_dir = Path(__file__).resolve().parent.parent / "include"
    include_dir.mkdir(parents=True, exist_ok=True)

    stub_code = r'''
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
'''
    write(include_dir / "kernel_stub_defs.h", stub_code)
    print("[✓] Wrote instrumented_source/include/kernel_stub_defs.h")


def prepend_stub_header(file_path: Path, abs_header: str, is_target=False):
    """
    Prepend an absolute-path include for kernel_stub_defs.h.
    For the real target file, also emit #define PROVIDE_MAKE_DYNAMIC_AREA
    so the stub header suppresses its dummy implementation.
    """
    if not file_path.exists():
        return

    lines = file_path.read_text().splitlines()

    define_line = "#define PROVIDE_MAKE_DYNAMIC_AREA"
    include_line = f'#include "{abs_header}"'

    # Remove any existing occurrences to avoid duplication
    lines = [l for l in lines if l.strip() not in {define_line, include_line}]

    # For target files, insert both define and include at top
    if is_target:
        lines.insert(0, include_line)
        lines.insert(0, define_line)
    else:
        # For non-targets, only insert include at top
        lines.insert(0, include_line)

    file_path.write_text("\n".join(lines) + "\n")
    tag = f"{file_path.name} (target)" if is_target else file_path.name
    print(f"[✓] Prepended stub header to {tag}")



def comment_out_lines(target_file: Path, line_nums: list):
    lines = target_file.read_text().splitlines()
    for i in line_nums:
        if 0 < i <= len(lines):
            lines[i - 1] = "// " + lines[i - 1]
    target_file.write_text("\n".join(lines) + "\n")
    print(f"[✓] Commented out lines: {line_nums} in {target_file.name}")

def comment_out_all_includes(file: Path):
    """Prefix *all* #include lines with // to disable them."""
    lines = file.read_text().splitlines()
    new_lines = ["// " + l if l.lstrip().startswith("#include") else l
                 for l in lines]
    file.write_text("\n".join(new_lines) + "\n")
    print(f"[✓] Commented out all includes in {file.name}")

def fix_naked_labels(file_path: Path):
    """Add a solitary `;` after labels that have no statement."""
    lines = file_path.read_text().splitlines()
    patched = []
    for i, line in enumerate(lines):
        patched.append(line)

        # Match plain labels like "out:" or "err:"
        # *and* "case FOO:" lines that have nothing after the colon.
        if re.match(r'^\s*(?:\w+|case\b[^:]*)\s*:\s*$', line):
            patched.append("    ;")          # make it a legal statement

    file_path.write_text("\n".join(patched) + "\n")
    print(f"[✓] Force-fixed naked & case labels in {file_path.name}")





def insert_assertion(target_file: Path, line_no: int, assertion: str):
    lines = target_file.read_text().splitlines()
    lines.insert(line_no - 1, assertion)
    target_file.write_text("\n".join(lines) + "\n")
    print(f"[✓] Inserted assertion at line {line_no} of {target_file.name}")

def inject_function_stubs(stub_file: Path, dest: Path):
    stubs = read_json(stub_file)
    code = "\n".join([f["stubbed function"] for f in stubs]) + "\n"
    write(dest / "driver_stubs.c", code)
    print("[✓] Wrote driver_stubs.c with function stubs")

def main():
    args = parse_args()
    ws = get_workspace()
    original_src = ws / "original_source"
    instrumented_src = ws / "instrumented_source"

    target_file = original_src / args.target_src
    entry_file = original_src / args.entry_src
    assert target_file.exists(), f"[✗] Target file not found: {target_file}"
    assert entry_file.exists(), f"[✗] Entry file not found: {entry_file}"

    preserved_paths = {args.target_src, args.entry_src, *args.helper_files}
    copy_preserved_files(original_src, instrumented_src, preserved_paths)
    write_kernel_stub_header(ws)

    for rel_path in preserved_paths:
        file = instrumented_src / rel_path
        abs_hdr = abs_stub_header(ws)
        if file.exists() and file.suffix == ".c":
            comment_out_all_includes(file)
            prepend_stub_header(file, abs_hdr, is_target=(rel_path == args.target_src))

    stubbed_target = instrumented_src / args.target_src
    if args.comment_lines:
        comment_out_lines(stubbed_target, args.comment_lines)
    insert_assertion(stubbed_target, args.assert_line, args.assertion)
    fix_naked_labels(stubbed_target)

    stub_out_irrelevant_sources(instrumented_src, preserved_paths)
    stub_out_missing_headers(instrumented_src)

    if args.stub_functions:
        inject_function_stubs(Path(args.stub_functions), ws)

if __name__ == "__main__":
    main()
