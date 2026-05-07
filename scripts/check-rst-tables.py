#!/usr/bin/env python3
"""Check RST grid tables for alignment errors.

Validates that all rows in RST grid tables have consistent widths
matching the separator lines. Catches the exact class of bug where
Sphinx silently drops malformed tables from rendered output.

Usage:
    python scripts/check-rst-tables.py [FILE ...]

If no files given, checks all .rst files under source/.
Exit code 0 if all tables are valid, 1 if any errors found.
"""

import sys
from pathlib import Path


def check_rst_tables(filepath: str) -> list[str]:
    """Return list of error messages for malformed grid tables in the file."""
    with open(filepath, "r") as f:
        lines = f.readlines()

    errors = []
    in_table = False
    expected_width = None
    table_start = None

    for i, line in enumerate(lines):
        stripped = line.rstrip("\n")
        lineno = i + 1

        is_separator = (
            stripped.startswith("+")
            and stripped.endswith("+")
            and ("---" in stripped or "===" in stripped)
        )

        if is_separator:
            if not in_table:
                in_table = True
                table_start = lineno
                expected_width = len(stripped)
            if len(stripped) != expected_width:
                errors.append(
                    f"{filepath}:{lineno}: separator width {len(stripped)} != "
                    f"expected {expected_width} (table started at line {table_start})"
                )
        elif in_table and stripped.startswith("|"):
            if len(stripped) != expected_width:
                diff = len(stripped) - expected_width
                sign = "+" if diff > 0 else ""
                errors.append(
                    f"{filepath}:{lineno}: row width {len(stripped)} != "
                    f"expected {expected_width} ({sign}{diff} chars)"
                )
            if not stripped.endswith("|"):
                errors.append(
                    f"{filepath}:{lineno}: row does not end with '|'"
                )
        elif in_table:
            in_table = False
            expected_width = None
            table_start = None

    return errors


def main():
    if len(sys.argv) > 1:
        files = sys.argv[1:]
    else:
        files = sorted(str(p) for p in Path("source").rglob("*.rst"))

    all_errors = []
    for filepath in files:
        all_errors.extend(check_rst_tables(filepath))

    if all_errors:
        for err in all_errors:
            print(err, file=sys.stderr)
        print(f"\n{len(all_errors)} RST table alignment error(s) found.", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
