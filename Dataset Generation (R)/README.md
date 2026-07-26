# Dataset Generation (R)

This folder contains the R scripts used to generate the simulated datasets used throughout the project.

## Purpose

Rather than relying on publicly available datasets, a custom simulation framework was developed to create realistic retail demand scenarios while allowing complete control over demand behaviour, store characteristics and data quality issues.

This approach helps the analysis to be fully reproducible and provides flexibility to generate alternative scenarios for future modelling and optimisation studies.

## Generated Data

The simulation was designed to produce realistic retail demand data for four stores with differing demand patterns, demand variability and inventory cost structures.

The scripts generate both:

- Clean datasets used as the underlying reference data.
- Dirty datasets containing realistic data quality issues requiring cleaning before analysis.

The generated datasets include:

- Weekday-specific demand patterns
- Seasonal demand variation
- Random daily fluctuations
- Demand spikes and demand dips
- Store-specific inventory costs
- Duplicate observations
- Missing values
- Mixed date formats
- Non-numeric demand values
- Inconsistent weekday labels
- Unrealistic demand values

## Reproducibility

The scripts are fully reproducible through the use of fixed random seeds and can be modified to generate alternative retail demand scenarios or additional retail stores.
