# Repository maintenance

[Topics](../README.md)

The topic folders hold the practice work. This folder holds the supporting records and tools.

- [Excluded instructor examples](EXCLUDED.md): what remains in the private course workspace and the Maven Silicon source check.
- [Import and evidence notes](IMPORT.md): source preservation and older waveform/synthesis exports.
- [Imported-file manifest](records/import-manifest.json): original paths and SHA-256 hashes.
- [Design and testbench pairings](records/designs.json) and [saved compile results](records/validation.json).

## Check the saved code

With Python 3 and Icarus Verilog installed, run from the repository root:

```sh
python maintenance/check_sources.py
```

The checker compiles each RTL/TB pairing separately and writes `maintenance/records/validation.json`. Compilation does not establish functional correctness. The saved audit includes three unfinished TB failures: the asynchronous single-port RAM TB and two alternate Topic 1 TB drafts. FIFO M1 has no saved TB; FIFO M2's earlier stimulus configuration is described in its topic page.

Kapil writes the RTL and TBs. Codex assists with daily repository upkeep as work is added. The six course-topic folders stay in place; testbench levels and a random revision tracker are reserved for a later format discussion.
