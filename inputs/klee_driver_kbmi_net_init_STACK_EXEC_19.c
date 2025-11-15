// Auto-generated driver for kbmi_net_init
#include "../stase_symex/klee/klee.h"
#include <string.h>
#include <stdlib.h>
#include "../include/kernel_stub_defs.h"

// Instrumented entry-point source
#include "../stase_generated_last/instrumented_source/drivers/kbmi_net/kbmi_net.c"
#include "../stase_generated_last/instrumented_source/drivers/misc/dynamic_util.c"

int main(void) {

    // Entry-point parameters (default init)
     //void = 0;

    // Call entry-point
    kbmi_net_init(void);
    return 0;
}
