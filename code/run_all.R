# Pipeline orchestrator
# Runs all numbered scripts in order
# Usage: Rscript code/run_all.R

library(here)

scripts <- list.files(here("code"), pattern = "^\\d{2}_.*\\.(R|r)$", full.names = TRUE)

for (s in scripts) {
  message("Running: ", basename(s))
  source(s)
}

# Render .qmd files
qmd_files <- list.files(here("code"), pattern = "^\\d{2}_.*\\.qmd$", full.names = TRUE)

for (q in qmd_files) {
  message("Rendering: ", basename(q))
  quarto::quarto_render(q)
}

message("Pipeline complete.")
