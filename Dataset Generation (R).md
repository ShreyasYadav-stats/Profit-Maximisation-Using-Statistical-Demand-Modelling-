# Dataset Generation (R)

This folder contains the R scripts used to generate the simulated datasets used throughout the project.

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

The scripts are fully reproducible through the use of fixed random seeds and can be modified to generate alternative retail demand scenarios.

