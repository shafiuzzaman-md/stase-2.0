#!/usr/bin/env python3
import argparse, os, re
from pathlib import Path

SIG_RE = r'{}\s*\((.*?)\)'  # filled with entry-func

def sig_info(src: Path, fn: str):
    """
    Extracts parameter declarations and names from the full function *definition* of `fn`.
    """
    txt = src.read_text(errors='ignore')

    # Match full function definition, not prototype
    # This regex captures return type, function name, parameters, and ensures it's a definition (has opening brace)
    pattern = r'(?:\w[\w\s\*]*?)\b{}\b\s*\(([^)]*)\)\s*\{{'.format(re.escape(fn))
    m = re.search(pattern, txt, re.MULTILINE | re.DOTALL)

    if not m:
        print(f"[WARN] Could not extract full definition for {fn}")
        return [], []

    print(f"[DEBUG] Matched signature for {fn}: {m.group(0).splitlines()[0]}...")

    raw_args = m.group(1).replace('\n', ' ').replace('\r', ' ')
    args = [a.strip() for a in raw_args.split(',') if a.strip() and a.strip() != 'void']

    decls, names = [], []
    for a in args:
        tokens = a.strip().split()
        if not tokens:
            continue
        # Special handling for pointer types or unnamed parameters
        # e.g., "const char __user *", or just "struct foo *"
        name = tokens[-1]
        if name in {'*', '**'} or name.endswith('*'):
            # fallback if name is just '*' or missing
            base = ''.join(tokens)
            decls.append(base + ' arg')
            names.append('arg')
        else:
            decls.append(' '.join(tokens))
            names.append(name.lstrip('*').split('[')[0])  # clean name for use

    return decls, names




def local_hdrs(src: Path):
    return [l.strip() for l in src.read_text(errors='ignore').splitlines()
            if l.strip().startswith('#include') and '"' in l]

def main():
    ap = argparse.ArgumentParser("Generate driver only (no assertion insertion)")
    req = ap.add_argument_group("required")
    req.add_argument("--entry-src", required=True)
    req.add_argument("--entry-func", required=True)
    req.add_argument("--vuln", required=True)
    req.add_argument("--assert-line", required=True, type=int)
    req.add_argument("--target-src", required=True)

    rep = ap.add_argument_group("repeatable / optional")
    rep.add_argument("--symbolic", action='append', default=[])
    rep.add_argument("--concrete", action='append', default=[])
    rep.add_argument("-g", "--global", dest="globals_", action='append', default=[])
    rep.add_argument("--malloc", nargs=2, action='append', default=[])
    rep.add_argument("--default-malloc", type=int, default=0)

    args = ap.parse_args()

    malloc_map = {ptr: int(sz) for ptr, sz in args.malloc}

    sg_root = Path("../stase_generated_last")
    src_root = sg_root / "instrumented_source"
    entry_abs = src_root / args.entry_src
    target_abs = src_root / args.target_src

    inputs_dir = Path("../inputs"); inputs_dir.mkdir(exist_ok=True)
    drv_path = inputs_dir / f"klee_driver_{args.entry_func}_{args.vuln}_{args.assert_line}.c"

    hdrs, pnam = sig_info(entry_abs, args.entry_func)
    pdecl, _ = sig_info(entry_abs, args.entry_func)

    glob_set = {d.split()[-1].lstrip('*').split('[')[0] for d in args.globals_}
    sym_set = {d.split()[-1].lstrip('*').split('[')[0] for d in args.symbolic}

    inc_dir = target_abs.parent

    with drv_path.open('w') as f:
        W = f.write
        W(f"// Auto-generated driver for {args.entry_func}\n")

        # ----- EDK headers -----
        edk_headers = [
            ("../stase_generated_last/global_stubs.h", sg_root / "global_stubs.h"),
            ("../stase_generated_last/global_stub_defs.c", sg_root / "global_stub_defs.c"),
            ("../stase_generated_last/uefi_helper_stubs.c", sg_root / "uefi_helper_stubs.c")
        ]
        for inc_str, inc_path in edk_headers:
            if inc_path.exists():
                W(f'#include "{inc_str}"\n')

        # ----- KLEE + standard headers -----
        W('#include "../stase_symex/klee/klee.h"\n')
        W('#include <string.h>\n#include <stdlib.h>\n')

        # ----- Local includes from entry file -----
        for inc in local_hdrs(entry_abs):
            hdr = inc.split('"')[1]
            W(f'#include "{os.path.relpath((inc_dir / hdr).resolve(), drv_path.parent)}"\n')

        if args.globals_:
            W('\n// ----- user globals -----\n')
            for g in args.globals_:
                W(f'{g};\n')

        W('\n// Instrumented source files\n')
        # Always include target first
        W(f'#include "{os.path.relpath(target_abs, drv_path.parent)}"\n')
        # Then entry second
        if args.entry_src != args.target_src:
            W(f'#include "{os.path.relpath(entry_abs, drv_path.parent)}"\n')


        W('int main(void) {\n')

        if args.symbolic:
            W('    // Symbolic variables\n')
            for decl in args.symbolic:
                raw = decl.split()[-1]
                base = raw.lstrip('*').replace('[', '_').replace(']', '')
                if '[' in raw:
                    W(f'    {decl};\n')
                    W(f'    klee_make_symbolic({raw.split("[")[0]}, sizeof({base}), "{base}");\n')
                elif '**' in decl:
                    base_t = ' '.join(decl.split()[:-1]).replace('*', '').strip()
                    ptr_nm = raw.lstrip('*')
                    inner_sz = malloc_map.get(ptr_nm, args.default_malloc)
                    W(f'    {decl} = malloc(sizeof({base_t} *));\n')
                    if inner_sz:
                        W(f'    *{ptr_nm} = malloc({inner_sz});\n')
                        W(f'    klee_make_symbolic(*{ptr_nm}, {inner_sz}, "{ptr_nm}_data");\n')
                    W(f'    klee_make_symbolic({ptr_nm}, sizeof({base_t} *), "{ptr_nm}");\n')
                elif '*' in decl:
                    base_t = ' '.join(decl.split()[:-1]).replace('*', '').strip()
                    ptr_nm = raw.lstrip('*')
                    malloc_sz = malloc_map.get(ptr_nm, None)
                    if malloc_sz:
                        W(f'    {decl} = malloc({malloc_sz});\n')
                        W(f'    klee_make_symbolic({ptr_nm}, {malloc_sz}, "{ptr_nm}");\n')
                    else:
                        W(f'    {decl} = malloc(sizeof({base_t}));\n')
                        W(f'    klee_make_symbolic({ptr_nm}, sizeof({base_t}), "{ptr_nm}");\n')
                else:
                    if raw not in glob_set:
                        W(f'    {decl};\n')
                    W(f'    klee_make_symbolic(&{raw}, sizeof({raw}), "{raw}");\n')

        if pdecl:
            W('\n    // Entry-point parameters (default init)\n')
            for d, n in zip(pdecl, pnam):
                if n not in sym_set and n not in glob_set:
                    default_val = "NULL" if "*" in d else "0"
                    W(f'    {d} = {default_val};\n')

        if args.concrete:
            W('\n    // Concrete initialisation / constraints\n')
            for stmt in args.concrete:
                W(f'    {stmt}\n')

        W('\n    // Call entry-point\n')
        W(f'    {args.entry_func}({", ".join(pnam)});\n')
        W('    return 0;\n}\n')

    print(f"[✓] Driver  : {drv_path.resolve()}")

if __name__ == "__main__":
    main()
