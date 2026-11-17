"""Compile saved RTL/TB pairs without changing any HDL or running new stimulus."""
from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    compiler = shutil.which("iverilog")
    if not compiler:
        print("Icarus Verilog (iverilog) is required on PATH.", file=sys.stderr)
        return 2
    catalog = json.loads((ROOT / "maintenance/records/designs.json").read_text(encoding="utf-8"))
    version = subprocess.run([compiler, "-V"], text=True, capture_output=True).stdout.splitlines()[0]
    checks = []
    with tempfile.TemporaryDirectory(prefix="compile-", dir=ROOT / ".work") as temp:
        for item in catalog["designs"] + catalog.get("alternate_testbenches", []):
            files = item["rtl"]
            entry = {"folder": item["folder"], "id": item["id"], "simulation_top": item["simulation_top"]}
            rtl_text = (ROOT / files[0]).read_text(encoding="utf-8-sig")
            import re
            clean = re.sub(r"/\*.*?\*/|//[^\n]*", "", rtl_text, flags=re.S)
            rtl_top = re.search(r"\bmodule\s+(\w+)", clean).group(1)
            for stage, top, selected in [
                ("rtl", rtl_top, files),
                ("testbench", item["simulation_top"], files + ([item["testbench"]] if item["testbench"] else [])),
            ]:
                if stage == "testbench" and not item["testbench"]:
                    entry["testbench_status"] = "NO TB"
                    continue
                cmd = [compiler, "-g2012", "-s", top, "-o", str(Path(temp) / "compiled.vvp"), *selected]
                result = subprocess.run(cmd, cwd=ROOT, text=True, capture_output=True, timeout=30)
                entry[stage + "_status"] = "PASS" if result.returncode == 0 else "FAIL"
                diagnostic = (result.stdout + result.stderr).strip().replace(str(ROOT), "<repository>").replace(str(Path(temp)), "<temporary>")
                if diagnostic:
                    entry[stage + "_diagnostics"] = diagnostic
            entry["source_sha256"] = {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in files + ([item["testbench"]] if item["testbench"] else [])}
            checks.append(entry)
    out = {"tool": version, "scope": "RTL and saved TB compile/elaboration only; no functional simulation or synthesis rerun", "language_mode": "iverilog -g2012", "checks": checks}
    target = ROOT / "maintenance/records/validation.json"
    target.write_text(json.dumps(out, indent=2) + "\n", encoding="utf-8", newline="\n")
    failures = [(x["folder"], x["id"], stage) for x in checks for stage in ("rtl", "testbench") if x[stage + "_status"] == "FAIL"]
    print(f"Checked {len(checks)} source/TB entries. {len(failures)} compile failures are recorded; saved drafts are preserved.")
    for folder, key, stage in failures:
        print(f"  {folder}/{key}: {stage} FAIL")
    # A complete audit can include unfinished drafts; consult recorded per-entry status.
    return 0


if __name__ == "__main__":
    (ROOT / ".work").mkdir(exist_ok=True)
    raise SystemExit(main())
