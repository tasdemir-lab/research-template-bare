# Load all helper functions
# Usage: source(here("code", "helpers", "_load_all.R"))

library(here)

helper_dir <- here("code", "helpers")
helper_files <- list.files(helper_dir, pattern = "^[^_].*\\.R$", full.names = TRUE)

for (f in helper_files) {
  source(f)
}

rm(helper_dir, helper_files, f)
