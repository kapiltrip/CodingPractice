# Topic 5 - Memory logic

[All topics](../README.md) · [Import and evidence notes](../IMPORT.md)

## What this topic practises

Practise memory arrays, parameterized address/data widths, bidirectional bus ownership, clocked and asynchronous accesses, and task-driven stimulus. The manual begins with a 16-by-8 asynchronous single-port RAM and adds synchronous/asynchronous dual-port RAMs, a four-bit SISO right-shift register, a clock buffer, and a sixteen-entry eight-bit FIFO with full/empty flags and simultaneous read/write operation. The student's SISO implementation is indexed under Topic 4. Preserve the parameter settings in each saved draft; some differ from the manual's nominal sizes.

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 26–27. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [Parameterized asynchronous single-port RAM](Examples.md#asynchronoussingleport) | PASS | FAIL | None saved |
| [Synchronous dual-port RAM](Examples.md#dualportram) | PASS | PASS | None saved |
| [Dual-clock RAM](Examples.md#asynchronousdualportram) | PASS | PASS | None saved |
| [Clock buffer](Examples.md#clockbuffer) | PASS | PASS | None saved |
| [FIFO using an occupancy counter](Examples.md#fifo16x8_m1) | PASS | NO TB | None saved |
| [FIFO using extended pointers](Examples.md#fifo16x8_m2) | PASS | PASS | None saved |

[Open the code, testbenches, waveform images and synthesis schematics](Examples.md). All HDL files preserve their original bytes. The checks above compile/elaborate the saved files; they do not establish functional correctness.

## Draft status

The memory and FIFO work is in progress. The asynchronous single-port TB has interface errors, FIFO M1 has no TB, and FIFO M2's saved stimulus uses the earlier configuration/reset convention. No synthesis or waveform exports were present for these drafts. The current source is kept for continued practice.
