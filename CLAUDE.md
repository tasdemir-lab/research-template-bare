# CLAUDE.md

Guidance for AI agents working in this repository.
This file is the **shared instruction source** for all AI agents (Claude Code, Codex, Gemini).
`AGENTS.md` and `GEMINI.md` are thin wrappers that point here.

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
- `code/*.R` = stable numbered pipeline
- `code/explorations/` = experimental analyses (`.R` or `.qmd`, user's choice)

## Session Logs

- Session logs go in **`_lab/logs/`** (format: `YYYY-MM-DD_description.md`).
- **Never** create `session_logs/` or any other log directory at the repo root.

## Session Start Protocol

1. Read `_lab/active-questions.md` for open items
2. Read `_lab/decisions/INDEX.md` for past decisions
3. Read `_lab/facts.md` for established empirical/institutional facts
4. When working on analysis, check which explorations exist in `code/explorations/`

## Data Protection

**NEVER modify, overwrite, or delete any data files in `data/raw/`.** Raw data is immutable.
The only exceptions are documentation files: `CODEBOOK.md`, `README.md`, and `.pdf` codebooks.
All data transformations flow through the pipeline: `data/raw/` → `data/interim/` → `data/final/`.

## Data Discovery Protocol

1. Check `data/raw/<source>/CODEBOOK.md` before touching data files
2. Verify files exist with `ls` before claiming data is missing
3. Use codebooks to plan column selection before loading large files

## Bibliography

- `master.bib` lives at the **repo root** (shared by `paper/` and `paper/slides/`)
- LaTeX compilation uses `BIBINPUTS=..:$BIBINPUTS` from `paper/`

## Document Formats

| Document | Default | Secondary |
|----------|---------|-----------|
| Paper | Quarto PDF (`pdf-engine: xelatex`) | Pure XeLaTeX (`.tex`) |
| Slides | Pure Beamer (XeLaTeX) | Quarto Reveal.js |

> Change these defaults when setting up your project.
> Paper: create `paper/manuscript.qmd` with `format: pdf` and `pdf-engine: xelatex`, or use `paper/manuscript.tex` for pure LaTeX.
> Slides: use `paper/slides/*.tex` with Beamer class, or switch to Quarto Reveal.js (`.qmd` with `format: revealjs`).

## Output Convention

Pipeline scripts (`.R`) save outputs directly to `output/`:
- `ggsave(here("output", "figures", "fig_XX_name.pdf"), ...)`
- `modelsummary(models, output = here("output", "tables", "tab_XX_name.tex"))`
- `saveRDS(result, here("output", "result_name.rds"))`

Agents read figures, tables, and RDS files directly — no intermediate rendering needed.

Use `gh release` to distribute compiled PDFs with tagged versions.

## R Data Conventions

- Use the `rio` package for all data import/export unless a specific package is required.
- CSV files may use European/Turkish conventions: `;` as delimiter, `,` as decimal separator.
  Always inspect with `readLines(file, n = 3)` before importing.
- When European format is detected, pass explicit arguments: `rio::import(file, sep = ";", dec = ",")`.
- Watch for encoding issues (UTF-8 vs Latin-1/Windows-1254 for Turkish characters)
  and whitespace in column names — use `janitor::clean_names()` after import if needed.

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
# Run a single analysis script
Rscript code/04_main_analysis.R

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
