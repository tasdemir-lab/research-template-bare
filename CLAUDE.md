# CLAUDE.md

Guidance for Claude Code when working in this repository.

**Project:** [PROJECT NAME]
**Authors:** [AUTHORS]
**Status:** [Early stage / Data collection / Analysis / Writing / Revision]

## Plugin Setup

This template uses the `tlab` plugin for agentic research workflows.

Install after cloning:
```bash
claude plugin install tlab@tlab-research --scope project
```

## Folder Convention

- `_` prefix = private, gitignored (`_lab/`, `_lit/`, `_trash/`)
- No prefix = reproducible pipeline, tracked (`code/`, `data/`, `output/`, `paper/`)
- `assets/` = external binaries not produced by the repo (logos, reference docs, shared files)
- `code/*.qmd` = stable numbered pipeline
- `code/explorations/*.qmd` = experimental branches

## Session Start Protocol

1. Read `_lab/active-questions.md` for open items
2. Read `_lab/decisions/INDEX.md` for past decisions
3. Read `_lab/facts.md` for established empirical/institutional facts
4. When working on analysis, check which explorations exist in `code/explorations/`

## Data Discovery Protocol

1. Check `data/raw/<source>/CODEBOOK.md` before touching data files
2. Verify files exist with `ls` before claiming data is missing
3. Use codebooks to plan column selection before loading large files

## Bibliography

- `master.bib` lives at the **repo root** (shared by `paper/`, `paper/slides/`, and `code/*.qmd`)
- LaTeX compilation uses `BIBINPUTS=..:$BIBINPUTS` from `paper/`
- Quarto documents inherit bibliography via `code/_quarto.yml`

## Render Convention

Default .qmd output: HTML (for human viewing) + GFM (for AI agent reading).
Both render in-place next to the .qmd source and are gitignored.

Publication artifacts are saved explicitly but gitignored (regenerated from code):
- `ggsave(here("output", "figures", "fig_XX_name.pdf"), ...)`
- `modelsummary(models, output = here("output", "tables", "tab_XX_name.tex"))`

Use `gh release` to distribute compiled PDFs with tagged versions.

## R Dependencies

R dependencies are managed with `renv`. Always run `renv::snapshot()` after installing packages.

## Key Commands

```r
# Load all helper functions
library(here)
source(here("code", "helpers", "_load_all.R"))

# After package changes
renv::snapshot()
```

```bash
# Render a single analysis
quarto render code/04_main_analysis.qmd

# Run full pipeline
Rscript code/run_all.R
```

## Git Rules

- **Source binaries** ARE tracked: `data/raw/**/*.pdf` (codebooks), `assets/` (external files)
- **Generated outputs** are NOT tracked: `output/figures/`, `output/tables/`, `paper/*.pdf`
- Data files are NOT tracked (raw data files, interim/, final/)
- Always commit `renv.lock` and `uv.lock` after dependency changes
- Use `gh release create vX.Y paper/*.pdf output/figures/*` to distribute compiled artifacts
- Never modify `.gitignore` directly. If a change is needed, propose it and wait for approval.

## Research Decision Records

- Check existing decisions in `_lab/decisions/` before proposing new approaches
- Never re-explore abandoned approaches without user request
- When creating a new decision: update `_lab/decisions/INDEX.md`
- Update `_lab/facts.md` when new empirical facts are established

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/tlab:commit [msg]` | Stage, commit, create PR, merge to main |
| `/tlab:compile-latex [file]` | 3-pass LaTeX compilation (pdflatex/xelatex + bibtex) |
| `/tlab:proofread [file]` | Grammar/typo/consistency review (report only) |
| `/tlab:validate-bib` | Cross-reference citations vs bibliography |
| `/tlab:data-analysis [dataset]` | End-to-end R analysis workflow |
| `/tlab:context-status` | Show session health + context usage |
| `/tlab:deep-audit` | Repository-wide consistency audit |

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for review |
| 95 | Excellence | Aspirational |
