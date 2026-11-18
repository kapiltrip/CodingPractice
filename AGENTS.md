# Coding Practice maintenance

Before starting work in this repository, read `AboutThisRepo.txt` at the repository root if it exists. Follow the directions that apply to Kapil's current request. Treat proposed ideas and unrelated to-dos as notes for later. Keep the file read-only and out of Git.

This is Kapil's public Verilog practice repository. The private course workspace is the source of context, not a collection to mirror wholesale.

- Keep the existing Topic01–Topic06 numbering and the separate extra-practice collection. Follow `maintenance/README.md` when adding work. Link a design from its topic README to `designs/<design-id>.md` and show any alternate testbenches on that design page.
- Preserve Kapil's RTL/TB bytes during copying and organization. Report unfinished drafts or errors without silently replacing his code.
- Exclude official Maven templates, supplied solutions, instructor reference code, paid manual/lecture images, private records, and private Git history. Consult maintenance/EXCLUDED.md before importing more files.
- Keep source, selected matching TB, waveform, and synthesis evidence together. Record source hashes and label older exports when the current source differs. Never invent simulation/synthesis results.
- Record the actual RTL and simulation tops in `maintenance/records/designs.json`. Run `python maintenance/check_sources.py <folder>/<id>` for one changed pairing, then run it without arguments to refresh the full audit. Do not introduce new TB levels or a revision tracker without a new request.
- Keep the main README focused on topics and subtopics. Keep import notes, provenance, compile records and tooling under maintenance/.
- Keep `.work` artifacts ignored.
- Follow Kapil's current autonomy, learning, document, and Git-completion preferences. Keep commits short and based on his intent; verify intended files before committing and pushing.
