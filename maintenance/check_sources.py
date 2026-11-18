"""Compile saved RTL/TB pairs without changing any HDL or running new stimulus."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
RECORDS = ROOT / "maintenance/records"


def check_pair(compiler: str, item: dict, output: Path) -> dict:
    files = item["rtl"]
    rtl_top = item.get("rtl_top")
    if not rtl_top:
        rtl_text = (ROOT / files[0]).read_text(encoding="utf-8-sig")
        clean = re.sub(r"/\*.*?\*/|//[^\n]*", "", rtl_text, flags=re.S)
        match = re.search(r"\bmodule\s+(\w+)", clean)
        if not match:
            raise ValueError(f"Declare rtl_top for {item['folder']}/{item['id']}.")
        rtl_top = match[1]

    testbench = item["testbench"]
    sources = files + ([testbench] if testbench else [])
    entry = {
        "folder": item["folder"],
        "id": item["id"],
        "rtl_top": rtl_top,
        "simulation_top": item["simulation_top"],
    }
    for stage, top, selected in [
        ("rtl", rtl_top, files),
        ("testbench", item["simulation_top"], sources),
    ]:
        if stage == "testbench" and not testbench:
            entry["testbench_status"] = "NO TB"
            continue
        command = [compiler, "-g2012", "-s", top, "-o", str(output), *selected]
        result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=30)
        entry[stage + "_status"] = "PASS" if result.returncode == 0 else "FAIL"
        diagnostic = (result.stdout + result.stderr).strip()
        if diagnostic:
            entry[stage + "_diagnostics"] = (
                diagnostic.replace(str(ROOT), "<repository>")
                .replace(str(output.parent), "<temporary>")
            )
    entry["source_sha256"] = {
        path: hashlib.sha256((ROOT / path).read_bytes()).hexdigest() for path in sources
    }
    return entry


def main() -> int:
    parser = argparse.ArgumentParser(description="Compile saved Verilog RTL and testbench pairings.")
    parser.add_argument("pairing", nargs="?", help="check a single folder/id without updating the audit")
    args = parser.parse_args()

    catalog = json.loads((RECORDS / "designs.json").read_text(encoding="utf-8"))
    entries = catalog["designs"] + catalog.get("alternate_testbenches", [])
    if args.pairing:
        entries = [item for item in entries if f"{item['folder']}/{item['id']}" == args.pairing]
        if len(entries) != 1:
            parser.error(f"{args.pairing!r} does not select one pairing in {RECORDS / 'designs.json'}")

    compiler = shutil.which("iverilog")
    if not compiler:
        print("Icarus Verilog (iverilog) is required on PATH.", file=sys.stderr)
        return 2

    work = ROOT / ".work"
    work.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="compile-", dir=work) as directory:
        temp = Path(directory)
        checks = [check_pair(compiler, item, temp / "compiled.vvp") for item in entries]
        failures = [
            (entry["folder"], entry["id"], stage)
            for entry in checks
            for stage in ("rtl", "testbench")
            if entry[f"{stage}_status"] == "FAIL"
        ]
        if args.pairing:
            entry = checks[0]
            print(f"Checked {args.pairing}.")
            for stage in ("rtl", "testbench"):
                print(f"  {stage}: {entry[f'{stage}_status']}")
                if diagnostic := entry.get(f"{stage}_diagnostics"):
                    print(diagnostic)
            return int(bool(failures))

        version = subprocess.run([compiler, "-V"], text=True, capture_output=True)
        audit = {
            "tool": version.stdout.splitlines()[0],
            "scope": "RTL and saved TB compile/elaboration only; no functional simulation or synthesis rerun",
            "language_mode": "iverilog -g2012",
            "checks": checks,
        }
        pending = temp / "validation.json"
        pending.write_text(json.dumps(audit, indent=2) + "\n", encoding="utf-8", newline="\n")
        pending.replace(RECORDS / "validation.json")

    print(f"Checked {len(checks)} source/TB entries. {len(failures)} compile failures are recorded; saved drafts are preserved.")
    for folder, key, stage in failures:
        print(f"  {folder}/{key}: {stage} FAIL")
    # A complete audit can include unfinished drafts; consult recorded per-entry status.
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
