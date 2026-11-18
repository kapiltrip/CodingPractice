# Coding Practice

I write the Verilog RTL and testbenches. Codex helps organize the repository, document the examples, and maintain the saved results.

This is the public companion to my private [Verilog Maven Silicon workspace](https://github.com/kapiltrip/Verilog-Maven-Silicon). **Topic 1–6 correspond to Lab 1–6** in the course.

## Topics and subtopics

| Topic | What the lab expects | Saved work |
|---|---|---|
| [1. Syntax and instantiation](Topic01/README.md) | Module connections; half/full adders; dataflow decoder; ripple-carry adder; structural muxes; bidirectional buffer | Student RTL, TB iterations, waveforms and schematics |
| [2. Operators](Topic02/README.md) | ALU operations; arithmetic and logical operators; output enable; task-driven stimulus | Topic brief; course-template implementation excluded |
| [3. Combinational logic](Topic03/README.md) | Behavioral mux; 3-to-8 decoder; 8-to-3 priority encoder; matching TBs | Student decoder and encoder with saved results |
| [4. Sequential logic](Topic04/README.md) | SR latch; D/JK/T flip-flops; loadable binary, MOD-12 and up-down counters; clock/reset stimulus | Student designs and SISO practice with saved results |
| [5. Memory logic](Topic05/README.md) | Single/dual-port RAMs; bus ownership; SISO shift register; clock buffer; FIFO with full/empty flags | Six RAM, clock buffer and FIFO designs with waveforms and schematics |
| [6. FSM design](Topic06/README.md) | Overlapping `101` Moore detector; coin-operated vending controller; state and output logic | Topic brief; student code pending |

Open a topic and choose a design. Each design page keeps the editable RTL and testbenches next to the available waveforms and synthesis schematics.

[Extra combinational practice](ExtraPractice/CombinationalCircuits/README.md) contains the separate subtractor, mux and decoder exercises.

## Maintenance

[How to add a design, check the code, and save new results](maintenance/README.md).
