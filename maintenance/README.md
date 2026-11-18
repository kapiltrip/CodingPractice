# Repository maintenance

[Topics](../README.md)

Kapil writes the RTL and testbenches. Codex organizes the code and saved results, checks the pairings, and updates the public repository as new work is ready.

[Where files go](#where-files-go) · [Adding or updating a design](#adding-or-updating-a-design) · [Checking the code](#checking-the-code) · [Records](#records)

## Where files go

Keep the six course topics in `Topic01` through `Topic06`. Use `ExtraPractice/<area>/` for work outside those labs, with the same layout inside each collection.

| Material | Location within a topic or practice collection |
|---|---|
| What to practise and links to individual designs | `README.md` |
| One page with the code, results, and testbench iterations for a design | `examples/<design-id>.md` |
| Editable design and testbench source | `rtl/` and `tb/` |
| Waveform images and selected editable traces | `waveforms/` and `waveforms/data/` |
| Synthesized RTL schematics | `synthesis/` |

The topic README is the index to update when adding a design. Existing `Examples.md` links still lead readers to the individual pages.

## Adding or updating a design

1. **Find its topic and design ID.** Use the existing ID for a revision of the same design. Give a distinct RTL implementation its own ID and page, as with the two [FIFO implementations](../Topic05/README.md#saved-work). Use [the exclusions](EXCLUDED.md) to check eligibility before copying student-written files from the private workspace. Preserve the original HDL bytes.
2. **Pick the testbench to show.** Register the RTL paths, RTL top, selected testbench path, and simulation top in the [pairing catalog](records/designs.json). For an RTL-only entry, set `testbench` and `simulation_top` to `null`. Save a separate testbench file and catalog entry under `alternate_testbenches` when the version has its own purpose or a result worth revisiting. Show it on the same design page. Use Git history for routine edits to an existing testbench.
3. **Check the pairing and save the evidence.** Use the focused compile command below. On the design page, describe what the trace shows and whether the run used a saved testbench or drove the RTL ports directly. Record RTL and TB input hashes for a testbench run and RTL input hashes for direct stimulus or synthesis. Record artifact hashes in the [file manifest](records/import-manifest.json). Label mismatched evidence as historical and evidence with missing input hashes as source unverified. Save extra captures for distinct behavior and native traces when timing needs closer inspection.
4. **Update the page and its topic index.** Update the inline code from the editable RTL and TB, link the matching saved evidence, and show any compile errors or limits alongside the affected work. Use the topic README to link the page and summarize the published work.
5. **Review and publish.** Run the full audit, check the code and evidence links, then commit the intended source, pages, and records. Keep generated tool work under the ignored `.work/` folder.

## Checking the code

With Python 3.10 or later and Icarus Verilog on PATH, run one pairing by its catalog folder and ID from the repository root. This prints the result for that RTL and TB without overwriting the full audit.

```sh
python maintenance/check_sources.py Topic05/fifo16x8_m1
```

A focused check exits with status 1 if either compile fails. To refresh the full audit, run:

```sh
python maintenance/check_sources.py
```

The full audit compiles and elaborates one pairing at a time and records each result. The [saved compile results](records/validation.json) include existing draft failures. Find functional simulation and synthesis results on the design pages, where the stimulus and source provenance are documented.

## Records

| Record | What it tracks |
|---|---|
| [Design and testbench pairings](records/designs.json) | Compile inputs and saved waveform and synthesis results by design |
| [Compile results](records/validation.json) | Per-pair compile status, source hashes, and diagnostics |
| [File manifest](records/import-manifest.json) | Source and public paths, export hashes, and screenshot or schematic provenance |
| [Import and evidence notes](IMPORT.md) | Source preservation and historical exports |
| [Excluded course material](EXCLUDED.md) | Course files kept private and the Maven Silicon source check |
