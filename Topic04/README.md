# Topic 4 - Sequential logic

[All topics](../README.md) · [Import and evidence notes](../IMPORT.md)

## What this topic practises

Practise edge-triggered logic, nonblocking assignments, resets, clock generation, and event-driven stimulus. The course begins with a D flip-flop; follow-up work covers a gate-level SR latch, parameter-named JK operations, a T flip-flop built from a D flip-flop, and loadable binary-up, MOD-12, and up-down counters. The saved student work also includes a four-bit SISO register. The restricted course DFF files are excluded; the student's self-contained T-FF includes its own DFF dependency.

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 24–25. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [Gate-level SR latch](Examples.md#srlatch) | PASS | PASS | Source hashes match |
| [JK flip-flop with named operations](Examples.md#jkfilpflopparameter) | PASS | PASS | Source hashes match |
| [T flip-flop using a D flip-flop](Examples.md#tffusingdff) | PASS | PASS | Source hashes match |
| [Loadable binary up counter](Examples.md#loadableupcounter) | PASS | PASS | Historical; see notes |
| [Loadable MOD-12 up counter](Examples.md#mod12upcounter) | PASS | PASS | Source hashes match |
| [Loadable binary up-down counter](Examples.md#binaryupdowncounter) | PASS | PASS | Historical; see notes |
| [Four-bit SISO right-shift register](Examples.md#siso4bits) | PASS | PASS | Source hashes match |

[Open the code, testbenches, waveform images and synthesis schematics](Examples.md). All HDL files preserve their original bytes. The checks above compile/elaborate the saved files; they do not establish functional correctness.
