#!/usr/bin/env python3
"""
instrument.py:
This script is used to prepare a C source file for symbolic execution with KLEE
by injecting assertions, stubbing functions, and commenting out lines that
are not relevant for the symbolic execution process.
It is designed to work with a specific directory structure where the source files
are located in a subdirectory called `instrumented_source` within a workspace
directory named `stase_generated_last`.
"""

import argparse
from pathlib import Path
import re
import shutil

################################################################################
# helpers
################################################################################

def ensure_backup(p: Path):
    """Create or restore a .orig.c companion next to *p* inside instrumented tree."""
    backup = p.with_suffix(p.suffix + ".orig.c")
    if not backup.exists():
        shutil.copy2(p, backup)
        print(f"[✓] Saved original backup → {backup.relative_to(p.parent)}")
    else:
        shutil.copy2(backup, p)
        print(f"[→] Restored from backup before instrumentation → {p.name}")


def clean_old_asserts(path: Path):
    """Remove any previous klee_assert lines so we don't duplicate injections."""
    lines = path.read_text(errors="ignore").splitlines()
    cleaned = [ln for ln in lines if "klee_assert(" not in ln]
    if len(cleaned) != len(lines):
        path.write_text("\n".join(cleaned))


def inject_assert(path: Path, line: int, expr: str):
    clean_old_asserts(path)
    lines = path.read_text(errors="ignore").splitlines()
    if any(expr in ln for ln in lines):
        print(f"[!] Expression already present in {path.name}; skipping.")
        return
    idx = max(0, line - 1)
    lines.insert(idx, f"    klee_assert({expr});")
    path.write_text("\n".join(lines))
    print(f"[✓] Inserted klee_assert at line {line} → {path}")


def comment_out_lines(path: Path, nums):
    lines = path.read_text(errors="ignore").splitlines()
    touched = False
    for n in nums:
        if 0 <= n - 1 < len(lines) and not lines[n - 1].lstrip().startswith("//"):
            lines[n - 1] = "// " + lines[n - 1]
            touched = True
    if touched:
        path.write_text("\n".join(lines))
        print(f"[✓] Commented out lines → {nums}")


def stub_functions(path: Path, names):
    code = path.read_text(errors="ignore")
    changed = False
    for fn in names:
        patt = re.compile(rf"\b[\w\*\s]+?\s+{fn}\s*\([^)]*\)\s*{{", re.MULTILINE)
        for m in patt.finditer(code):
            start = m.start()
            # naive brace balance to locate function body end
            body_start = code.find('{', start)
            depth, i = 1, body_start + 1
            while i < len(code) and depth:
                if code[i] == '{':
                    depth += 1
                elif code[i] == '}':
                    depth -= 1
                i += 1
            stub = f"{{ /* stubbed {fn} */ return 0; }}"
            code = code[:body_start] + stub + code[i:]
            changed = True
    if changed:
        path.write_text(code)
        print(f"[✓] Stubbed functions → {names}")

################################################################################
# main
################################################################################

def main():
    ap = argparse.ArgumentParser("Patch source file for KLEE")
    ap.add_argument("--target-src", required=True,
                    help="Path to target C file relative to instrumented_source")
    ap.add_argument("--entry-src", help="Optional entry source (backup only)")
    ap.add_argument("--assert-line", type=int,
                    help="Line number to insert klee_assert before")
    ap.add_argument("--assertion", help="Expression inside klee_assert(..)")
    ap.add_argument("--comment-lines", type=int, nargs='*', default=[],
                    help="Line numbers to comment out (//)")
    ap.add_argument("--stub-functions", nargs='*', default=[],
                    help="Function names to stub with 'return 0'")

    args = ap.parse_args()

    sg_root = Path("../stase_generated_last")
    if not sg_root.exists():
        raise SystemExit("[✗] stase_generated_last not found – run setup_<env> first?")

    tgt_path = sg_root / "instrumented_source" / args.target_src
    if not tgt_path.exists():
        raise SystemExit(f"[✗] Target not found: {tgt_path}")

    # Always ensure the target backup
    ensure_backup(tgt_path)

    # If an entry source is given, just back it up for consistency
    if args.entry_src:
        entry_path = sg_root / "instrumented_source" / args.entry_src
        if entry_path.exists():
            ensure_backup(entry_path)
        else:
            print(f"[!] Warning: entry-src not found: {entry_path}")

    # === transformations on the *target* file ===
    if args.assert_line and args.assertion:
        inject_assert(tgt_path, args.assert_line, args.assertion)

    if args.comment_lines:
        comment_out_lines(tgt_path, args.comment_lines)

    if args.stub_functions:
        stub_functions(tgt_path, args.stub_functions)


if __name__ == "__main__":
    main()
