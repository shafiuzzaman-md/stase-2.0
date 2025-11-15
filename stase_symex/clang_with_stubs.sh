#!/usr/bin/env bash
exec "/usr/lib/llvm-14/bin/clang" -I "/home/shafi/harden/Harden_Eval3/stase_symex/stase_generated/include"      -include "/home/shafi/harden/Harden_Eval3/stase_symex/stase_generated/include/register_stubs.h" "$@"
