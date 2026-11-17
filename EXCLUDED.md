# Excluded from the public repository

[Repository index](README.md)

The public import includes the student's working code. Course-provided files were identified from the official archive's source manifest, the reference-code collection, and restricted-source headers in the working files.

## Working files left private

| Source file in the private workspace | Reason |
|---|---|
| `Labs Verilog/Lab2/rtl/alu.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |
| `Labs Verilog/Lab2/tb/alu_tb.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |
| `Labs Verilog/Lab3/rtl/mux4_1.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |
| `Labs Verilog/Lab3/tb/mux4_1_tb.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |
| `Labs Verilog/Lab4/rtl/dff.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |
| `Labs Verilog/Lab4/tb/dff_tb.v` | Completed course template retaining Maven Silicon's restricted-source header; associated exports are excluded too. |

The ALU, behavioral-mux, and DFF waveform/synthesis exports are also excluded because they correspond to these omitted course-template implementations. Independently written student implementations of related circuits remain included, including the self-contained DFF helper in the student's T-flip-flop file.

## Other source material left private

- `EDA_Tools/Verilog_Labs/`: the entire official six-topic template/archive tree and every supplied `solution/` directory, including the course full-adder, ALU, mux, DFF, RAM, and sequence-detector implementations.
- `Session Insights/Reference Codes/`: instructor/classroom reference RTL and TBs.
- Paid manual pages, lecture screenshots, recordings/transcripts, assignment PDFs/question sheets, review material, account/session information, app data, and the private repository's Git history.
- Local planning file `AboutThisRepo.txt`: preserved untouched in the workspace and ignored by Git.
- Tool databases, installation files, temporary outputs, duplicate legacy waveform captures, unrelated screenshots, and source-specific launcher files with private workspace paths.

Topic 2 and Topic 6 retain short descriptive briefs without importing protected implementations. The proposed TB-level structure and random revision tracker were ideas marked for later discussion; they have not been implemented.
