# Import and evidence notes

[Repository index](../README.md) · [Maintenance](README.md) · [Exclusions](EXCLUDED.md) · [File manifest](records/import-manifest.json) · [Design records](records/designs.json) · [Current compile checks](records/validation.json)

Imported on 2026-11-17 from the local working tree of the private Verilog Maven Silicon workspace. The import uses fresh Git history and includes eligible current working files, including saved student edits that had not yet been committed in the source repository. The source workspace was read-only throughout.

## Preserved code and exports

All copied HDL, waveform images, RTL schematic images, and selected native waveform traces are byte-for-byte copies. [The manifest](records/import-manifest.json) records the original relative path, public path, kind, and SHA-256 hash. Source names, comments, module names, parameter defaults, and unfinished TB iterations remain as saved.

The examples pages show a selected RTL/TB pairing with its original exports. Original capitalization and spelling differences between filenames and module tops are retained. For example, `encoderPriority.v` declares `priorityEnc`, and `jkFlipFlopParameter.v` declares `jkFilpFlopParameter`. Compile each selected design separately because names such as `mux4to1` and `decoderDataflow_tb` recur in different collections.

## Historical evidence

Saved source-hash records were compared with the imported RTL and selected TB. These entries have older evidence:

| Collection | Design | Limitation |
|---|---|---|
| Topic01 | Bidirectional buffer | Synthesis source hashes differ |
| Topic01 | 4-to-1 mux using a decoder | Synthesis source hashes differ |
| Topic01 | 4-bit ripple-carry adder | Synthesis source hashes differ |
| Topic04 | Loadable binary up counter | Synthesis and waveform source hashes differ |
| Topic04 | Loadable binary up-down counter | Synthesis and waveform source hashes differ |
| ExtraPractice/CombinationalCircuits | Full subtractor using half subtractors | Waveform source hashes differ |

Their affected exports remain useful as historical records, but are not represented as validation of the latest code. Synthesis and waveform provenance are tracked separately in each design record. Topic 1's saved waveform-export record does not contain RTL/TB hashes, so equality with today's source is unverified even where synthesis hashes match. The extra-practice full-subtractor's fixed-timing capture also lacks its own source-hash record. Other matching source hashes establish provenance only, not a fresh functional re-verification. The current Icarus checks only compile and elaborate the saved files.

No saved synthesis or waveform exports were found for Topic 5, and no student RTL/TB was found for Topic 6. Those statuses are stated directly instead of creating replacement results. The old generate-loop adder synthesis failure also remains historical; its current source has changed and there is no corresponding saved schematic.

## Maintenance

Kapil writes the practice RTL and testbenches. Codex assists with topic indexing, code/evidence organization, provenance, and normal Git maintenance. Add new evidence only after running the matching current source, retain earlier iterations when useful, and keep restricted course examples and private study material out of this public repository.

The instruction file's suggested multi-level TB organization and random revision tracker remain unimplemented pending a separate discussion. No daily automation has been configured.
