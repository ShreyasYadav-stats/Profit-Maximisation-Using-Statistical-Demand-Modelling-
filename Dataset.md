## Dataset

The project uses simulated daily demand data from four retail stores in Brighton, Carlton, 
South Wharf and Dandenong. The dataset covers more than one year of daily demand.

Each store was designed with different demand patterns and cost structures, including unit costs, 
selling prices and disposal costs. Demand was simulated to vary by weekday, with generally lower demand early in the week and higher demand towards 
Fridays and weekends.

Seasonal variation, random fluctuations and occasional demand spikes and dips were incorporated to better reflect uncertain retail demand.

To replicate realistic operational data, a dirty data layer was deliberately introduced. This included missing values, 
duplicate records, inconsistent date formats, non-numeric demand entries and unrealistic demand values, requiring a complete data cleaning process before analysis.

<img width="922" height="621" alt="image" src="https://github.com/user-attachments/assets/3768f9cd-ee7e-47c5-8852-fba5535a99c9" />

The **`Dataset`** folder contains additional documentation describing the simulated datasets and the data quality issues that were intentionally introduced.

The **`Dataset Generation (R)`** folder contains the complete R scripts used to generate both the clean and dirty datasets, making the simulation fully reproducible and allowing alternative scenarios to be created for future analyses.
