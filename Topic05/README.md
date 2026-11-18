# Topic 5 - Memory logic

[All topics](../README.md) · [Import and evidence notes](../maintenance/IMPORT.md)

## What this topic practises

Practise memory arrays, parameterized address/data widths, bidirectional bus ownership, clocked and asynchronous accesses, and task-driven stimulus. The manual begins with a 16-by-8 asynchronous single-port RAM and adds synchronous/asynchronous dual-port RAMs, a four-bit SISO right-shift register, a clock buffer, and a sixteen-entry eight-bit FIFO with full/empty flags and simultaneous read/write operation. Some saved testbench parameters differ from the manual's nominal sizes. The SISO implementation is in [Topic 4](../Topic04/designs/siso4bits.md).

Course context: Maven Silicon, [Verilog lab manual - ModelSim and Quartus](https://elearn.maven-silicon.com/v3/myaccount/course/2383/lesson/2757?lesson=2757&section=275&class_id=17574&actualClassId=17574), printed pages 26–27. This is a short topic summary; the paid manual pages and supplied source files are not republished.

## Saved work

| Subtopic | RTL check | Selected TB check | Saved evidence |
|---|---|---|---|
| [Parameterized asynchronous single-port RAM](designs/asynchronousSinglePort.md) | PASS | FAIL | Direct port stimulus and synthesis |
| [Synchronous dual-port RAM](designs/dualPortRAM.md) | PASS | PASS | Saved testbench waveform and synthesis |
| [Dual-clock RAM](designs/asynchronousDualPortRAM.md) | PASS | PASS | Saved testbench waveform and synthesis |
| [Clock buffer](designs/clockBuffer.md) | PASS | PASS | Saved testbench waveform and synthesis |
| [FIFO M1 using an occupancy counter](designs/fifo16x8_m1.md) | PASS | PASS | Direct transfer tests, saved testbench waveform and synthesis |
| [FIFO M2 using extended pointers](designs/fifo16x8_m2.md) | PASS | PASS | Direct transfer tests, saved testbench waveform and synthesis |

The table shows Icarus Verilog compile and elaboration results. Quartus Analysis & Synthesis passed for all six designs on Cyclone IV E `EP4CE22F17C6`.

## Reading the waveforms

ModelSim drove the single-port RAM directly because its saved testbench fails to elaborate. The saved FIFO testbenches compile and stay in reset during the transfer attempts. To see both FIFOs operate at 16 entries of 8 bits, open the direct port stimulus waveforms. They show successful transfers, blocked requests at full and empty, and asynchronous reset during a run.
