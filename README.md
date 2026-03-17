# Research Project Template

A folder structure for empirical economics research projects, designed for AI-assisted workflows with Claude Code, Codex, and Gemini CLI.

## Quick Start

```bash
# 1. Clone this template into a new project
gh repo clone tasdemir-lab/research-template-bare my-project
cd my-project
git remote remove origin
gh repo create my-project --private --source .

# 2. Run the setup script (creates private workspace directories)
bash setup_project.sh

# 3. Install the tlab plugin (agentic research workflows)
claude plugin marketplace add tasdemir-lab/tlab-research
claude plugin install tlab@tlab-research --scope project

# 4. Initialize R environment
Rscript -e 'renv::init()'

# 5. Fill in project details
# Edit CLAUDE.md — replace [BRACKETED PLACEHOLDERS]
# Edit README.md — replace this section with your project description
```

## What You Get

### From This Template (scaffolding)
- Folder structure: `code/`, `data/`, `paper/`, `output/`, `assets/`
- `.gitignore` configured for research projects
- `CLAUDE.md` with AI agent instructions
- Helper R functions and pipeline orchestrator
- Setup script for private workspace

### From the [tlab Plugin](https://github.com/tasdemir-lab/tlab-research) (agentic workflow)
- 7 skills: commit, compile-latex, proofread, validate-bib, data-analysis, context-status, deep-audit
- 2 specialist agents: proofreader, verifier
- 5 project rules (synced automatically)
- File protection and rule sync hooks

## Folder Structure

```
project-name/
│
├── README.md                         # This file
├── CLAUDE.md                         # AI agent instructions
├── master.bib                        # Master bibliography (shared)
├── .claude/                          # Claude Code config
├── .gitignore
│
│ ── REPRODUCIBLE PIPELINE (tracked) ──────────────────
│
├── code/
│   ├── 00_download_data.R            # Data acquisition
│   ├── 01_clean.R                    # raw -> interim
│   ├── 02_build_sample.R             # interim -> final
│   ├── 03_descriptives.qmd           # Summary statistics
│   ├── 04_main_analysis.qmd          # Core estimation
│   ├── 05_robustness.qmd             # Sensitivity checks
│   ├── helpers/                      # Utility functions
│   │   ├── _load_all.R               # Source all helpers at once
│   │   ├── data_helpers.R
│   │   ├── figure_helpers.R
│   │   └── table_helpers.R
│   ├── explorations/                 # Experimental analyses
│   └── run_all.R                     # Pipeline orchestrator
│
├── data/
│   ├── raw/                          # Original data (untracked, except docs)
│   ├── interim/                      # Intermediate steps (untracked)
│   └── final/                        # Analysis-ready (untracked)
│
├── output/
│   ├── figures/                      # Publication-ready plots (gitignored)
│   ├── tables/                       # LaTeX tables (gitignored)
│   └── logs/                         # Build logs (gitignored)
│
├── assets/                           # External binaries (tracked)
│
├── paper/
│   ├── manuscript.tex                # Main paper (or .qmd)
│   └── slides/                       # Conference/seminar presentations
│
│ ── PRIVATE (created by setup_project.sh, gitignored) ─
│
├── _lab/                             # Research workshop
│   ├── facts.md                      # AI-maintained empirical facts
│   ├── active-questions.md           # Open research questions
│   ├── decisions/                    # Research Decision Records
│   ├── insights/                     # Ideas and hypotheses
│   ├── discussions/                  # Research discussion notes
│   ├── evaluations/                  # AI quality reports
│   ├── plans/                        # Saved plans (plan-first workflow)
│   └── progress.md                   # Running log
│
├── _lit/                             # Reference materials
│   ├── papers/                       # PDFs of key papers
│   ├── books/                        # Book chapters
│   ├── misc/                         # Other docs (policy reports, handouts, etc.)
│   ├── slides/                       # Other people's presentations
│   └── notes/                        # Reading notes per paper
│
├── _trash/                           # Hook-managed recycle bin (date-bucketed)
├── tmp/                              # Scratch space
├── session_logs/                     # AI session progress logs
│
│ ── DEPENDENCY LOCKS (tracked) ───────────────────
│
├── renv.lock                         # R dependencies
├── .Rprofile                         # renv activation
├── pyproject.toml                    # Python deps (if needed)
└── uv.lock                           # Python lock (if needed)
```

## Design Principles

**Two-zone architecture.** The project separates the *reproducible pipeline* (code, data, output, paper — tracked by git) from the *research workshop* (notes, facts, decisions — private, gitignored). The `_` prefix marks private folders.

**Plugin-based workflow.** Agentic components (skills, agents, rules, hooks) live in the [tlab plugin](https://github.com/tasdemir-lab/tlab-research), not in the project repo. Update agentic tools independently with `claude plugin update`.

**Exploration is first-class.** Experimental analyses live in `code/explorations/` with semantic names. Only promoted analyses write to `output/`.

## Updating

```bash
# Update agentic workflow (skills, rules, agents, hooks)
claude plugin update tlab@tlab-research
```

Template scaffolding rarely changes. If needed, manually sync from this repo.

## Origin

This template was developed through structured discussions between Claude (Opus 4.6), OpenAI Codex, and Murat Tasdemir (Istanbul Medeniyet University). It is optimized for AI-assisted empirical economics workflows.
