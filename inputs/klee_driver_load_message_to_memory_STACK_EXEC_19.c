// Auto-generated driver for load_message_to_memory
#include "../stase_symex/klee/klee.h"
#include <string.h>
#include <stdlib.h>
#include "../include/kernel_stub_defs.h"

// ----- user globals -----
char message_buffer[1024];

// Instrumented source files
#include "../stase_generated_last/instrumented_source/drivers/misc/dynamic_util.c"
#include "../stase_generated_last/instrumented_source/drivers/kbmi_usb/kbmi_usb.c"
int main(void) {
    // Symbolic variables
    void *priv = malloc(sizeof(void));
    klee_make_symbolic(priv, sizeof(void), "priv");
    struct sk_buff *skb = malloc(sizeof(struct sk_buff));
    klee_make_symbolic(skb, sizeof(struct sk_buff), "skb");
    const struct nf_hook_state *state = malloc(sizeof(const struct nf_hook_state));
    klee_make_symbolic(state, sizeof(const struct nf_hook_state), "state");

    // Concrete initialisation / constraints
    klee_make_symbolic(message_buffer, 1024, "message_buffer");

    // Call entry-point
    load_message_to_memory();
    return 0;
}
