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

## Modelling Demand Uncertainty

Demand varies from week to week even when comparing the same weekday. Using average demand alone would ignore this uncertainty and could lead to unnecessary waste or missed sales.

Demand was therefore modelled separately for each weekday. Poisson, geometric and negative binomial distributions were compared using graphical checks, Akaike Information Criterion (AIC) and chi squared goodness of fit tests.

For Monday demand, the negative binomial distribution provided the strongest fit among the candidate models.

| Distribution      |        AIC | Chi Squared GOF p-value |
| ----------------- | ---------: | ----------------------: |
| Poisson           |     473.75 |                 < 0.001 |
| Geometric         |     563.21 |                 < 0.001 |
| Negative Binomial | **434.97** |               **0.339** |

The negative binomial distribution had the lowest AIC, while the goodness of fit test did not provide sufficient evidence to reject the fitted model.

This process was repeated across weekdays, with the fitted demand distribution forming the basis of the inventory simulation.

## Profit Optimisation

Once demand uncertainty had been modelled, the next question was how much inventory the store should order.

For each weekday, 100,000 possible demand scenarios were simulated from the fitted probability distribution. A range of candidate order quantities was then evaluated under each simulated demand scenario.

Daily profit accounted for three components:

**Sales revenue − Inventory purchase cost − Disposal cost of unsold inventory**

If the store ordered too little, sales were limited by the available inventory. If the store ordered too much, the remaining inventory incurred a disposal cost.

The expected profit for each order quantity was estimated across the simulated scenarios. The quantity producing the highest mean profit was selected as the recommended order quantity for that weekday.

This approach incorporates demand uncertainty directly into the inventory decision rather than relying on a single average demand estimate.

## Results and Recommendations

The optimal order quantity varied substantially across weekdays, reflecting changes in both expected demand and demand uncertainty.

| Day       | Optimal Order Quantity | Expected Profit (AUD) |
| --------- | ---------------------: | --------------------: |
| Monday    |                     64 |               $124.65 |
| Tuesday   |                     62 |               $123.19 |
| Wednesday |                     76 |               $151.08 |
| Thursday  |                     82 |               $166.43 |
| Friday    |                     98 |               $200.43 |
| Saturday  |                    122 |               $248.52 |
| Sunday    |                    114 |               $229.72 |

The results show that a fixed daily ordering policy would not be appropriate for the Brighton store. Recommended inventory levels increase towards the end of the week as demand rises, with the largest order quantity of 122 units recommended for Saturday.

Saturday also produced the highest expected daily profit at $248.52, followed by Sunday at $229.72. In contrast, lower demand early in the week resulted in more conservative inventory recommendations.

The store should therefore adjust inventory orders by weekday rather than relying on a single average demand estimate. This reduces unnecessary excess inventory on quieter days while allowing higher stock levels when greater demand justifies the additional inventory cost.

The same optimisation workflow can be applied to the Carlton, South Wharf and Dandenong stores using their individual demand patterns, selling prices, purchase costs and disposal costs.

## Limitations and Future Work

This analysis provides a starting point for modelling inventory decisions under uncertain demand, but several areas could be extended.

Only three standard count distributions were considered when modelling demand. Although the negative binomial distribution provided the best fit among the candidate models, other probability distributions or non-parametric approaches may better capture complex demand patterns. This is especially relevant for negatively skewed demand observed on some weekdays.

The analysis also relies mainly on probability modelling and does not explicitly forecast future demand trends. Time series methods could be incorporated to capture changing demand patterns, long-term trends and seasonal behaviour before applying the profit optimisation framework.

Future extensions could include applying the analysis across all four stores, comparing how different cost structures affect inventory recommendations, and developing a Power BI dashboard to monitor demand patterns and recommended inventory levels across locations.
