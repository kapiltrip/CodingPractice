# Topic 3 - Combinational logic

[All topics](../README.md) · [Import and evidence notes](../maintenance/IMPORT.md)

## What this topic practises

Describe combinational logic with complete sensitivity lists, blocking assignments, case statements, and priority selection. The course starts with a behavioral 4-to-1 mux and task-driven stimulus; follow-up work requests a 3-to-8 decoder and an 8-to-3 priority encoder, each with a testbench. The student decoder and encoder are included; the course-template mux pair is excluded.

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 22–23. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [3-to-8 decoder](Examples.md#decoder3_8) | PASS | PASS | Source hashes match |
| [8-to-3 priority encoder](Examples.md#priorityenc) | PASS | PASS | Source hashes match |

[Open the code, testbenches, waveform images and synthesis schematics](Examples.md). All HDL files preserve their original bytes. The checks above compile/elaborate the saved files; they do not establish functional correctness.
