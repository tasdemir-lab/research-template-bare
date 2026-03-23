# Pipeline orchestrator
# Runs all numbered scripts in order
# Usage: Rscript code/run_all.R

library(here)

scripts <- list.files(here("code"), pattern = "^\\d{2}_.*\\.(R|r)$", full.names = TRUE)

for (s in scripts) {
  message("Running: ", basename(s))
  source(s)
}

message("Pipeline complete.")
