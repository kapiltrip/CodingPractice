# Topic 1 - Verilog syntax and instantiation

[All topics](../README.md) · [Import and evidence notes](../IMPORT.md)

## What this topic practises

Practise port directions, internal nets, named and positional connections, structural composition, dataflow expressions, and matching testbenches. The course starts with a full adder built from two half adders and an OR gate. Follow-up work covers a dataflow full adder, a 2-to-4 decoder, a 4-bit ripple-carry adder, two structural 4-to-1 mux constructions, and a bidirectional buffer. The saved student extras include a half adder, a structural adder, and a priority encoder.

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 18–19. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [Bidirectional buffer](Examples.md#bidirectionalbuffer) | PASS | PASS | Historical; see notes |
| [2-to-4 dataflow decoder](Examples.md#decoderdataflow) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Dataflow full adder](Examples.md#fulladderdataflow) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Full adder using half adders](Examples.md#fulladderusinghalfadder) | PASS | PASS | Synthesis matches; waveform source unverified |
| [Half adder](Examples.md#halfadder) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-to-1 mux using 2-to-1 muxes](Examples.md#mux4to1) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-to-1 mux using a decoder](Examples.md#muxusingdecoder) | PASS | PASS | Historical; see notes |
| [Priority encoder](Examples.md#priorityencoder) | PASS | PASS | Synthesis matches; waveform source unverified |
| [4-bit ripple-carry adder](Examples.md#ripplecarryadder) | PASS | PASS | Historical; see notes |
| [Gate-level ripple-carry adder](Examples.md#ripplecarryadderstruct) | PASS | PASS | Synthesis matches; waveform source unverified |

[Open the code, testbenches, waveform images and synthesis schematics](Examples.md). All HDL files preserve their original bytes. The checks above compile/elaborate the saved files; they do not establish functional correctness.
