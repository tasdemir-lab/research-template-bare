# Raw Data

Original, immutable data sources. This directory is **not tracked** by git (except codebooks and this README).

## Data Sources

| Source | Directory | Description | Codebook |
|--------|-----------|-------------|----------|
| [Source 1] | `source_1/` | [Description] | `source_1/CODEBOOK.md` |

## Data Acquisition

Run `code/00_download_data.R` to download all raw data from remote storage.

## Rules

- **Never modify** files in this directory after download
- Each source gets its own subdirectory
- Each subdirectory must have a `CODEBOOK.md` describing columns, units, coverage, and known issues
