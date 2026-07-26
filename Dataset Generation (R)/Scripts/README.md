# Scripts

This folder contains the R scripts used to generate, modify and export the simulated datasets used throughout the project.

## Dependencies

The scripts were developed in R and require the following packages:

- dplyr
- lubridate
- stringr
- openxlsx

Install any missing packages before running the scripts.

## Workflow

The dataset generation process follows four stages:

1. Generate clean demand data for each retail store.
2. Introduce realistic data quality issues to create dirty datasets.
3. Export both clean and dirty datasets to Excel workbooks.
4. Use the dirty datasets throughout the project for data cleaning, statistical analysis and newsvendor optimisation.

The dataset generation workflow has been separated into four scripts.

| Script | Purpose |
|--------|---------|
| helper_functions.R | Contains reusable functions used throughout the dataset generation workflow. |
| 01_generate_clean_data.R | Generates clean simulated demand data for all four retail stores. |
| 02_generate_dirty_data.R | Introduces realistic data quality issues to create dirty datasets from the clean data. |
| 03_export_datasets.R | Exports the clean and dirty datasets as multi-sheet Excel workbooks. |

## Notes

The scripts are intended to be run sequentially, beginning with `01_generate_clean_data.R` and ending with `03_export_datasets.R`.
