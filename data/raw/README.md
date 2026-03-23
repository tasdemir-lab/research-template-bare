# Raw Data

Original, immutable data sources. This directory is **not tracked** by git (except codebooks and this README).

## Data Sources

| Source | Directory | Description | Codebook |
|--------|-----------|-------------|----------|
| [Source 1] | `source_1/` | [Description] | `source_1/CODEBOOK.md` |

## Data Acquisition

Place raw data files in their respective subdirectories. Common methods:

- **Manual download** — download from a provider's website and copy files here
- **Script** — use a download script (e.g., `code/00_download_data.R`) to fetch from APIs or remote storage
- **Direct copy** — copy files from local drives, shared folders, or external media

Document the acquisition method for each source in its `CODEBOOK.md`.

## Rules

- **Never modify** files in this directory after initial placement
- Each source gets its own subdirectory
- Each subdirectory must have a `CODEBOOK.md` describing columns, units, coverage, and known issues
