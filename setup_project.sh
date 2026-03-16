#!/bin/bash
# Setup script for new project from research-template-bare
# Run once after cloning: bash setup_project.sh

set -e

echo "Setting up project directories..."

# Private workspace (gitignored)
mkdir -p _lab/decisions _lab/insights _lab/discussions _lab/evaluations _lab/plans
mkdir -p _lit/papers _lit/books _lit/misc _lit/slides _lit/notes
mkdir -p _trash
mkdir -p tmp
mkdir -p session_logs

# Data directories (gitignored)
mkdir -p data/interim
mkdir -p data/final

# Create default private files if they don't exist
if [ ! -f _lab/facts.md ]; then
cat > _lab/facts.md << 'EOF'
# Empirical & Institutional Facts

AI agents maintain this file. Each fact is citation-backed or derived from project analyses.
Use these facts as ground truth during brainstorming and research design discussions.

## Institutional Context

## Key Empirical Facts

## Retired Facts
EOF
fi

if [ ! -f _lab/active-questions.md ]; then
cat > _lab/active-questions.md << 'EOF'
# Active Research Questions

## Open

## Resolved
EOF
fi

if [ ! -f _lab/decisions/INDEX.md ]; then
cat > _lab/decisions/INDEX.md << 'EOF'
# Research Decision Records — Index

| ID | Decision | Status | Date |
|----|----------|--------|------|
EOF
fi

if [ ! -f _lab/progress.md ]; then
cat > _lab/progress.md << 'EOF'
# Progress Log

Running log of what's been done. Most recent entries first.
EOF
fi

echo "Done. Private directories created:"
echo "  _lab/     — research workshop (facts, decisions, discussions)"
echo "  _lit/     — reference materials (papers, books, misc docs)"
echo "  _trash/   — recycle bin"
echo "  tmp/      — scratch space"
echo ""
echo "Next steps:"
echo "  1. Edit CLAUDE.md — fill in project details"
echo "  2. Edit README.md — replace template text with your project description"
echo "  3. Run: Rscript -e 'renv::init()' to set up R environment"
echo "  4. Install the tlab plugin:"
echo "     claude plugin marketplace add tasdemir-lab/tlab-research"
echo "     claude plugin install tlab@tlab-research --scope project"
echo "  5. Create code/00_download_data.R for your data sources"
