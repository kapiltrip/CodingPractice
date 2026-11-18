# Topic 1 - Verilog syntax and instantiation

[All topics](../README.md) · [Import and evidence notes](../maintenance/IMPORT.md)

## What this topic practises

Practise port directions, internal nets, named and positional connections, structural composition, dataflow expressions, and matching testbenches. The course starts with a full adder built from two half adders and an OR gate. Follow-up work covers a dataflow full adder, a 2-to-4 decoder, a 4-bit ripple-carry adder, two structural 4-to-1 mux constructions, and a bidirectional buffer. The saved student extras include a half adder, a structural adder, and a priority encoder.

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 18–19. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [Bidirectional buffer](examples/bidirectionalBuffer.md) | PASS | PASS | Historical; see notes |
| [2-to-4 dataflow decoder](examples/decoderDataflow.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Dataflow full adder](examples/fullAdderDataflow.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Full adder using half adders](examples/fullAdderUsingHalfAdder.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Half adder](examples/halfAdder.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-to-1 mux using 2-to-1 muxes](examples/mux4to1.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-to-1 mux using a decoder](examples/muxUsingdecoder.md) | PASS | PASS | Historical; see notes |
| [Priority encoder](examples/priorityEncoder.md) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-bit ripple-carry adder](examples/rippleCarryAdder.md) | PASS | PASS | Historical; see notes |
| [Gate-level ripple-carry adder](examples/rippleCarryAdderStruct.md) | PASS | PASS | Synthesis matches; waveform source unverified |

All HDL files preserve their original bytes. The checks above compile/elaborate the saved files; they do not establish functional correctness.

The half adder, full adder using half adders, and gate-level ripple-carry adder pages also include their saved alternate testbenches.
