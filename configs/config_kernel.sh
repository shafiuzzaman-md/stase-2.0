#!/usr/bin/env bash
# STASE – Linux-kernel batch runner (one clean workspace per vuln)
# -----------------------------------------------------------------
set -euo pipefail
cd "$(dirname "$0")/../stase_symex"          # stay near the helpers

# ─── user-specific paths ────────────────────────────────────────────
KERNEL_SRC="../eval3_linux-main"
CLANG_SYS="/usr/lib/llvm-14/bin/clang"
KLEE_BIN="/harden/klee_build/bin/klee"
INPUTS_DIR="../inputs"
# ────────────────────────────────────────────────────────────────────

new_ws () {
    # 1. create fresh workspace
    workspace=$(python3 setup_kernel_environment.py "$KERNEL_SRC" \
                | tee /dev/stderr \
                | grep -oE 'Setup completed in .*$' | awk '{print $4}')

    # fallback: take newest stase_generated_* one dir above stase_symex
    if [[ -z "$workspace" ]]; then
        workspace=$(ls -1dt ../stase_generated_* | head -1)
    fi
    workspace=$(realpath "$workspace")


    stub="$workspace/include"                # contains kernel_stub_defs.h
    wrap="$workspace/clang_with_stubs.sh"
    cat > "$wrap" <<EOF
#!/usr/bin/env bash
exec "$CLANG_SYS" \
     -I "$stub" -include "$stub/kernel_stub_defs.h" \
     "\$@"
EOF
    chmod +x "$wrap"
    export CLANG_WRAP="$wrap"
    echo "[✓] Workspace $workspace  (wrapper → \$CLANG_WRAP)"
}

###############################################################################
# Block 1 – kbmi_net :: STACK_EXEC (line 19)
###############################################################################
new_ws

python3 instrument_kernel.py \
  --entry-src  drivers/kbmi_net/kbmi_net.c \
  --target-src drivers/misc/dynamic_util.c \
  --assert-line 19 \
  --assertion 'klee_assert(!pte_exec(*pte) && "stack-exec vulnerability: page is executable");'

python3 setup_driver.py \
  --entry-src  drivers/kbmi_net/kbmi_net.c \
  --entry-func kbmi_packet_filter_hook \
  --vuln       STACK_EXEC \
  --assert-line 19 \
  --target-src drivers/misc/dynamic_util.c \
  --symbolic  "void *priv" \
  --symbolic  "struct sk_buff *skb" \
  --symbolic  "const struct nf_hook_state *state" \
  --global    "char message_buffer[1024]" \
  --concrete  'klee_make_symbolic(message_buffer, 1024, "message_buffer");'

python3 run_analysis.py \
  "$INPUTS_DIR/klee_driver_kbmi_packet_filter_hook_STACK_EXEC_19.c" \
  --clang-path "$CLANG_WRAP" \
  --klee-path  "$KLEE_BIN"

###############################################################################
# Block 2 – kbmi_usb :: STACK_EXEC (line 19)
###############################################################################
new_ws

python3 instrument_kernel.py \
  --entry-src  drivers/kbmi_usb/kbmi_usb.c \
  --target-src drivers/misc/dynamic_util.c \
  --assert-line 19 \
  --assertion 'klee_assert(!pte_exec(*pte) && "stack-exec vulnerability: page is executable");'

python3 setup_driver.py \
  --entry-src  drivers/kbmi_usb/kbmi_usb.c \
  --entry-func load_message_to_memory \
  --vuln       STACK_EXEC \
  --assert-line 19 \
  --target-src drivers/misc/dynamic_util.c \
  --symbolic  "void *priv" \
  --symbolic  "struct sk_buff *skb" \
  --symbolic  "const struct nf_hook_state *state" \
  --global    "char message_buffer[1024]" \
  --concrete  'klee_make_symbolic(message_buffer, 1024, "message_buffer");'

python3 run_analysis.py \
  "$INPUTS_DIR/klee_driver_load_message_to_memory_STACK_EXEC_19.c" \
  --clang-path "$CLANG_WRAP" \
  --klee-path  "$KLEE_BIN"

###############################################################################
# Block 3 – kcrypt :: OOB_WRITE (line 255)
###############################################################################
new_ws

python3 instrument_kernel.py \
  --entry-src  drivers/kcrypt/kcrypt.c \
  --target-src drivers/kcrypt/kcrypt.c \
  --assert-line 255 \
  --assertion 'klee_assert(len < get_block_size(len) && "OOB Write: result_buf[len] exceeds allocated buffer");'

python3 setup_driver.py \
  --entry-src  drivers/kcrypt/kcrypt.c \
  --entry-func kcrypt_write \
  --vuln       OOB_WRITE \
  --assert-line 255 \
  --target-src drivers/kcrypt/kcrypt.c \
  --symbolic  "struct file *file" \
  --symbolic  "const char __user *ubuf" \
  --symbolic  "size_t len" \
  --symbolic  "loff_t *off" \
  --global    "u8 global_result_buf[4096]" \
  --concrete  'klee_make_symbolic(global_result_buf, sizeof(global_result_buf), "global_result_buf");'

python3 run_analysis.py \
  "$INPUTS_DIR/klee_driver_kcrypt_write_OOB_WRITE_255.c" \
  --clang-path "$CLANG_WRAP" \
  --klee-path  "$KLEE_BIN"

###############################################################################
# Block 4 – knotes :: OOB_WRITE (line 315)
###############################################################################
new_ws

python3 instrument_kernel.py \
  --entry-src  drivers/knotes/knotes.c \
  --target-src drivers/knotes/knotes.c \
  --assert-line 315 \
  --assertion 'klee_assert(dst->payload_len < alloc_capacity && "OOB Write: meta index >= capacity");'

python3 setup_driver.py \
  --entry-src  drivers/knotes/knotes.c \
  --entry-func knotes_write \
  --vuln       OOB_WRITE \
  --assert-line 315 \
  --target-src drivers/knotes/knotes.c \
  --symbolic  "struct file *file" \
  --symbolic  "const char __user *ubuf" \
  --symbolic  "size_t len" \
  --symbolic  "loff_t *off" \
  --global    "u8 global_result_buf[4096]" \
  --concrete  'klee_make_symbolic(global_result_buf, sizeof(global_result_buf), "global_result_buf");'

python3 run_analysis.py \
  "$INPUTS_DIR/klee_driver_knotes_write_OOB_WRITE_315.c" \
  --clang-path "$CLANG_WRAP" \
  --klee-path  "$KLEE_BIN"

###############################################################################
# Add more vulnerabilities:  copy a block, call new_ws, tweak args.
###############################################################################
echo -e "\n[✓] Kernel analyses completed — one workspace per vulnerability."
