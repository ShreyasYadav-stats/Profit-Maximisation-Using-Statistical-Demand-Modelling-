# Profit Maximisation Using Statistical Demand Modelling
Retail stores selling perishable products face uncertainty in daily demand. Ordering too much increases waste and disposal costs, while ordering too little leads to missed sales. This project uses statistical demand modelling and newsvendor optimisation to determine profit maximising inventory levels across multiple retail stores.

## Overview

Retail stores selling perishable products face a constant trade-off between over-ordering and under-ordering inventory. Ordering too much increases waste and disposal costs, while ordering too little results in lost sales and reduced revenue.

This project models uncertain daily demand across multiple retail stores and applies statistical demand modelling and simulation based newsvendor optimisation to determine profit maximising order quantities for each weekday.

The focus is on translating statistical modelling into operational inventory decisions under uncertainty.

## Business Context

Retail businesses dealing with perishable products or fast selling inventory must make ordering decisions before actual demand is observed. Demand can vary substantially across weekdays, store locations and seasonal periods, making fixed ordering policies inefficient and costly.

To reflect realistic operational conditions, the project simulates multiple retail stores with differing demand patterns, cost structures, disposal costs and noisy operational data. The analysis focuses on how uncertainty in demand affects inventory decisions and profitability.

## Key Questions
- How should inventory levels change across weekdays?
- Which demand distributions best capture observed retail demand?
- How sensitive are profits to over-ordering and under-ordering?
- How do disposal costs affect optimal inventory decisions?
- How much variability exists across stores and weekdays?

## Dataset

The project uses simulated daily demand data from four retail stores in Brighton, Carlton, South Wharf and Dandenong. The dataset covers more than one year of daily demand.

Each store was designed with different demand patterns and cost structures, including unit costs, selling prices and disposal costs. Demand was simulated to vary by weekday, with generally lower demand early in the week and higher demand towards Fridays and weekends.

Seasonal variation, random fluctuations and occasional demand spikes and dips were included to better reflect uncertain retail demand.

A dirty data layer was deliberately introduced to recreate common data quality issues found in operational datasets. These included missing values, duplicate records, inconsistent date formats, non-numeric demand entries and unrealistic demand values.

## Data Cleaning and Validation

Dates and demand were the two most important variables for the analysis because inventory recommendations depend directly on demand patterns across weekdays.

Date formats were standardised and missing dates were investigated before the weekday variable was reconstructed directly from the cleaned dates. Duplicate records were removed and the data was ordered chronologically.

Demand values were converted into a consistent numeric format. Recoverable text entries such as "eighty" and "one hundred" were corrected, while invalid entries were treated as missing.

Potential outliers were investigated rather than automatically removed. Genuine high demand days were retained because unusually busy periods can materially affect inventory decisions. Clear data entry errors and impossible demand values were corrected or treated as missing.

Demand varied substantially across weekdays. ANOVA and the Kruskal-Wallis test both found significant differences in demand between weekdays. Missing demand values were therefore imputed using the median demand for the corresponding weekday.

The median was used because demand was skewed and contained extreme values, making it less sensitive to unusually high demand days than the mean.

## Analysis Approach

The analysis follows a simple decision framework.

**Historical demand → Model demand uncertainty → Simulate possible demand → Estimate expected profit → Determine the optimal order quantity**

Rather than using average demand as the recommended inventory level, the analysis models the full uncertainty in demand. This is important because two days with the same average demand can still have very different levels of variability and inventory risk.



