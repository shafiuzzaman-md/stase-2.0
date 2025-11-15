#!/usr/bin/env bash
exec "/usr/lib/llvm-14/bin/clang" -I "/home/shafi/Research/Harden/stase-1/stase_generated_0//include" -include "/home/shafi/Research/Harden/stase-1/stase_generated_0//include/register_stubs.h" "$@"
