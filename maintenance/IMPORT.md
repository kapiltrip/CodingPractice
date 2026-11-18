# Import and evidence notes

[Repository index](../README.md) · [Maintenance](README.md) · [Exclusions](EXCLUDED.md) · [File manifest](records/import-manifest.json) · [Design records](records/designs.json) · [Current compile checks](records/validation.json)

The initial import on 2026-11-17 came from the local working tree of the private Verilog Maven Silicon workspace. The public repository starts with fresh Git history and includes eligible working files, including saved student edits from the source repository.

## Preserved code and exports

The HDL, waveform images and selected native traces are byte-for-byte copies. [The manifest](records/import-manifest.json) records the original relative path, public path, kind and SHA-256 hash. For schematic PNGs rendered from a Quartus PDF, it also records the source PDF hash and render bounds.

Each design page shows a selected RTL/TB pairing with its original exports. Original capitalization and spelling differences between filenames and module tops are retained. For example, `encoderPriority.v` declares `priorityEnc`, and `jkFlipFlopParameter.v` declares `jkFilpFlopParameter`. Compile each selected design separately because names such as `mux4to1` and `decoderDataflow_tb` recur in different collections.

The 17 November 2026 saved run supplied updated waveforms and schematics for the loadable counters in [Topic 4](../Topic04/README.md) and all six designs in [Topic 5](../Topic05/README.md). The waveform and trace hashes match the saved run. The schematic renders omit blank PDF margins and preserve the circuit pixels. The [design records](records/designs.json) include the native trace paths and captured comparison counts. For a direct port stimulus run, waveform source matching refers to the RTL whose ports ModelSim drove. For a testbench run, it covers both the RTL and testbench.

On 18 November 2026, Topic 1 and Topic 5 were refreshed from the existing source mappings. The saved screenshots show the full green-on-black ModelSim Wave windows. The [design records](records/designs.json) link the VCD traces and record the input hashes and checks for the adder and single-port RAM testbenches.

## Historical evidence

Saved source-hash records were compared with the imported RTL and selected TB. These entries have older evidence:

| Collection | Design | Limitation |
|---|---|---|
| Topic01 | Bidirectional buffer | Synthesis source hashes differ |
| Topic01 | 4-to-1 mux using a decoder | Synthesis source hashes differ |
| Topic01 | 4-bit ripple-carry adder | Synthesis source hashes differ |
| ExtraPractice/CombinationalCircuits | Full subtractor using half subtractors | Waveform source hashes differ |

Their affected exports remain useful as historical records, but are not represented as validation of the latest code. Synthesis and waveform provenance are tracked separately in each design record. Topic 1's earlier waveform-export record does not contain RTL/TB hashes, so equality with today's source is unverified even where synthesis hashes match. The extra-practice full-subtractor's fixed-timing capture also lacks its own source-hash record. Other matching source hashes establish provenance only, not a fresh functional re-verification. The current Icarus checks only compile and elaborate the saved files.

Topic 6 contains the course brief. The generate-loop adder in Topic 1 has a saved waveform with unconfirmed source hashes. Its older synthesis run failed, and the current source has no matching schematic.

Follow the [maintenance workflow](README.md#adding-or-updating-a-design) when adding practice code or saving evidence.
