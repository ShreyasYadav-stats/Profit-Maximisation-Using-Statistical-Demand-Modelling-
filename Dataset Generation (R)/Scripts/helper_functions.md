# Helper Functions

This script contains reusable functions used throughout the dataset generation workflow. Separating commonly used functionality into helper functions improves code readability, reduces duplication and makes the simulation framework easier to maintain and extend.

## Functions

| Function | Purpose |
|----------|---------|
| `simulate_store()` | Simulates clean daily demand data for a retail store based on user-defined demand characteristics. |
| `introduce_data_quality_issues()` | Introduces realistic data quality issues into a clean dataset to create a dirty dataset. |
| `export_workbook()` | Exports one or more datasets to a multi-sheet Excel workbook. |

## Design Principles

The helper functions were designed to:

- Reduce duplicated code across the simulation scripts.
- Improve readability through modular function design.
- Make it easier to modify simulation parameters in a single location.
- Support reproducible generation of alternative retail demand scenarios.

## Used By

The helper functions are called by:

- `01_generate_clean_data.R`
- `02_generate_dirty_data.R`
- `03_export_datasets.R`
