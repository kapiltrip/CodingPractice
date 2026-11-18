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

The checker compiles and elaborates each RTL and testbench pairing separately. It writes `maintenance/records/validation.json`. The asynchronous single-port RAM testbench and two alternate Topic 1 testbenches still fail the compile checks. Both FIFO testbenches compile. Their reset and parameter limitations are shown beside the saved waveforms in [Topic 5](../Topic05/README.md#reading-the-waveforms).

Kapil writes the RTL and TBs. Codex assists with daily repository upkeep as work is added. The six course-topic folders stay in place; testbench levels and a random revision tracker are reserved for a later format discussion.
