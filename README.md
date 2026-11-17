# Coding Practice

Kapil Tripathi's Verilog coding practice: student-written RTL, saved testbench iterations, synthesis schematics, and simulation waveforms. Work is organized by topic as the course progresses.

This is the public companion to the private [Verilog Maven Silicon workspace](https://github.com/kapiltrip/Verilog-Maven-Silicon). Kapil writes the practice code; repository organization, documentation, and routine maintenance are assisted by Codex/AI. It is intended to be maintained daily as new work is added.

## Topics and subtopics

| Topic | Subtopics and expected practice | Current public contents |
|---|---|---|
| [Topic 1 - Syntax and instantiation](Topic01/README.md) | Adders, decoders, structural muxes, bidirectional buffers, module connections, and matching TBs | 10 designs and saved TB iterations; existing waveforms/schematics |
| [Topic 2 - Operators](Topic02/README.md) | ALU operations, output enable, task arguments, and operator practice | Brief only; restricted ALU template excluded |
| [Topic 3 - Combinational logic](Topic03/README.md) | Behavioral mux concepts, 3-to-8 decoding, and 8-to-3 priority encoding | Student decoder and encoder with saved evidence |
| [Topic 4 - Sequential logic](Topic04/README.md) | SR/JK/T storage, synchronous loadable counters, reset behavior, and SISO shifting | 7 student designs with saved evidence; restricted DFF template excluded |
| [Topic 5 - Memory logic](Topic05/README.md) | Parameterized RAMs, bus ownership, dual-clock accesses, clock buffering, and FIFO flags | 6 RTL drafts and 5 TBs; no saved synthesis/waveform exports |
| [Topic 6 - FSM design](Topic06/README.md) | Overlapping sequence detection and a coin-operated vending controller | Topic brief; student implementation pending |
| [Extra practice - Combinational circuits](ExtraPractice/CombinationalCircuits/README.md) | Subtractors, gate-level muxes, and a dataflow decoder | Separate student exercise set with saved evidence |

Each populated topic has `rtl/`, `tb/`, and an examples page showing the code inline. `synthesis/` and `waveforms/` contain the eligible original exports where available; native trace data is included when present.

## Check the saved sources

Install Python 3 and Icarus Verilog, then run from the repository root:

```sh
python scripts/check_sources.py
```

This checks each RTL top and selected TB separately using SystemVerilog-compatible parsing for the saved `.v` files. It also checks the retained alternate TB drafts. Results are written to [records/validation.json](records/validation.json). A successful compile does not prove that a design is functionally correct; known draft failures remain visible. No new stimulus or verification levels have been added.

## Import and evidence

The initial import on 2026-11-17 contains **29 RTL files**, **31 testbench files**, **23 synthesis images**, **27 waveform images**, and **18 native trace files**. Copied files are unchanged and have recorded SHA-256 hashes.

Read [what was excluded](EXCLUDED.md), [source and evidence notes](IMPORT.md), and the [import manifest](records/import-manifest.json). Some exports predate the latest source edits and are explicitly marked as historical. Quartus RTL schematics describe the saved Analysis & Synthesis work; they do not claim fitting, timing closure, or board programming.

Course context was summarized from the saved Maven Silicon *Verilog lab manual - ModelSim and Quartus* topic records, printed pages 18–29. Each topic cites its relevant page pair. Official templates, supplied solutions, recordings, and paid manual pages remain in the private course workspace.
