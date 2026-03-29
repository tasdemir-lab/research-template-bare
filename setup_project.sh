#!/bin/bash
# Setup script for new project from research-template-bare
# Run once after cloning: bash setup_project.sh

set -e

echo "Setting up project directories..."

# Ephemeral workspace (gitignored)
mkdir -p _lab/logs _lab/plans _lab/evaluations
mkdir -p _lit/papers _lit/books _lit/misc _lit/slides _lit/notes
mkdir -p _trash
mkdir -p tmp

# Data directories (gitignored)
mkdir -p data/interim
mkdir -p data/final

# Ephemeral seed files (gitignored)
if [ ! -f _lab/progress.md ]; then
cat > _lab/progress.md << 'EOF'
# Progress Log

Running log of what's been done. Most recent entries first.
EOF
fi

echo "Done. Directories created:"
echo "  lab_notes/ — tracked research knowledge (facts, decisions, questions)"
echo "              (already in template — seed files ready to use)"
echo "  _lab/      — ephemeral workspace (logs, plans, evaluations)"
echo "  _lit/      — reference materials (papers, books, misc docs)"
echo "  _trash/    — recycle bin"
echo "  tmp/       — scratch space"
echo ""
echo "Next steps:"
echo "  1. Edit CLAUDE.md — fill in project details"
echo "  2. Edit README.md — replace template text with your project description"
echo "  3. Run: Rscript -e 'renv::init()' to set up R environment"
echo "  4. Install the tlab plugin:"
echo "     claude plugin install tlab@tlab-research --scope project"
echo "  5. Create code/00_download_data.R for your data sources"
