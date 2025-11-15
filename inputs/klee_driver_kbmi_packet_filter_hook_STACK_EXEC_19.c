// Auto-generated driver for kbmi_packet_filter_hook
#include "../stase_symex/klee/klee.h"
#include <string.h>
#include <stdlib.h>
#include "../include/kernel_stub_defs.h"

// ----- user globals -----
char message_buffer[1024];

// Instrumented source files
#include "../stase_generated_last/instrumented_source/drivers/misc/dynamic_util.c"
#include "../stase_generated_last/instrumented_source/drivers/kbmi_net/kbmi_net.c"
int main(void) {
    // Symbolic variables
    void *priv = malloc(sizeof(void));
    klee_make_symbolic(priv, sizeof(void), "priv");
    struct sk_buff *skb = malloc(sizeof(struct sk_buff));
    klee_make_symbolic(skb, sizeof(struct sk_buff), "skb");
    const struct nf_hook_state *state = malloc(sizeof(const struct nf_hook_state));
    klee_make_symbolic(state, sizeof(const struct nf_hook_state), "state");

    // Entry-point parameters (default init)

    // Concrete initialisation / constraints
    klee_make_symbolic(message_buffer, 1024, "message_buffer");

    // Call entry-point
    kbmi_packet_filter_hook(priv, skb, state);
    return 0;
}
