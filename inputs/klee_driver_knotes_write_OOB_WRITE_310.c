// Auto-generated driver for knotes_write
#include "../stase_symex/klee/klee.h"
#include <string.h>
#include <stdlib.h>
#include "../include/kernel_stub_defs.h"

// ----- user globals -----
u8 global_result_buf[4096];

// Instrumented source files
#include "../stase_generated_last/instrumented_source/drivers/knotes/knotes.c"
int main(void) {
    // Symbolic variables
    struct file *file = malloc(sizeof(struct file));
    klee_make_symbolic(file, sizeof(struct file), "file");
    const char __user *ubuf = malloc(sizeof(const char __user));
    klee_make_symbolic(ubuf, sizeof(const char __user), "ubuf");
    size_t len;
    klee_make_symbolic(&len, sizeof(len), "len");
    loff_t *off = malloc(sizeof(loff_t));
    klee_make_symbolic(off, sizeof(loff_t), "off");

    // Entry-point parameters (default init)
    const char __user *buf = NULL;
    loff_t *ppos = NULL;

    // Concrete initialisation / constraints
    klee_make_symbolic(global_result_buf, sizeof(global_result_buf), "global_result_buf");

    // Call entry-point
    knotes_write(file, buf, len, ppos);
    return 0;
}
