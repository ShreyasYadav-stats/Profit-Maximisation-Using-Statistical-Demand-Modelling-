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
This analysis is designed to answer:

- How should inventory levels change across weekdays?
- How can uncertainty in daily demand be modelled?
- Which probability distributions best represent observed demand?
- What order quantity maximises expected profit?
- How do over-ordering and under-ordering affect profitability?
- How can the same optimisation approach be extended across stores with different cost structures?

## Approach
The analysis follows a simple decision framework.

**Historical demand → Model demand uncertainty → Simulate possible demand → Estimate expected profit → Determine the optimal order quantity**

The project combines four components:

### Data Cleaning and Validation

- Standardised inconsistent date formats and reconstructed weekdays from cleaned dates
- Converted mixed demand values into a consistent numeric format
- Investigated potential outliers rather than removing extreme values automatically
- Corrected known data entry errors and treated invalid demand values as missing
- Used weekday-specific median imputation for missing demand

### Statistical Demand Analysis

- Compared demand patterns across weekdays
- Used ANOVA to test differences in mean demand
- Examined model residuals and distributional assumptions
- Used the Kruskal-Wallis test as a non-parametric confirmation of weekday differences

### Demand Distribution Modelling

- Modelled demand separately for each weekday
- Compared Poisson, geometric and negative binomial distributions
- Evaluated candidate distributions using AIC, graphical diagnostics and chi-squared goodness-of-fit tests
- Used the selected distribution to represent uncertainty in future demand

### Profit Optimisation

- Simulated 100,000 possible demand scenarios for each weekday
- Evaluated candidate order quantities under uncertain demand
- Calculated profit after accounting for sales revenue, inventory purchase costs and disposal costs
- Selected the order quantity with the highest estimated mean profit

## Results

### Weekday Demand Patterns

Demand differed significantly across weekdays, with lower demand generally observed early in the week and higher demand towards Fridays and weekends.

Both ANOVA and the Kruskal-Wallis test identified significant differences in demand across weekdays.

✅ **A single overall demand estimate would not adequately represent daily inventory requirements.**

### Demand Distribution Modelling

Poisson, geometric and negative binomial distributions were compared for weekday demand.

For Monday:

| Distribution | AIC | Chi-Squared GOF p-value |
|---|---:|---:|
| Poisson | 473.75 | < 0.001 |
| Geometric | 563.21 | < 0.001 |
| Negative Binomial | **434.97** | **0.339** |

The negative binomial distribution had the lowest AIC and was not rejected by the chi-squared goodness-of-fit test.

The negative binomial distribution also provided the strongest fit among the candidate distributions across the remaining weekdays.

✅ **Observed demand contained greater variability than simpler count models such as the Poisson distribution could adequately capture.**

### Optimal Inventory Levels

| Day | Optimal Order Quantity | Expected Profit (AUD) |
|---|---:|---:|
| Monday | 64 | $124.65 |
| Tuesday | 62 | $123.19 |
| Wednesday | 76 | $151.08 |
| Thursday | 82 | $166.43 |
| Friday | 98 | $200.43 |
| Saturday | 122 | $248.52 |
| Sunday | 114 | $229.72 |

Optimal inventory levels increased towards the end of the week as demand increased.

Saturday required the highest order quantity at 122 units and generated the highest estimated expected profit of $248.52.

✅ **Inventory requirements vary substantially by weekday, making a fixed daily ordering policy inefficient.**

## Key Insights

**Average demand is not enough for inventory decisions:** Two periods with similar average demand may have different levels of uncertainty.

✅ **Inventory decisions should account for the full demand distribution rather than relying only on average demand**

**Demand patterns differ across weekdays:** Statistical testing confirmed substantial differences in demand between weekdays.

✅ **Ordering policies should vary by weekday**

**Genuine high-demand days should not automatically be treated as outliers:** Removing valid extreme demand values could underestimate inventory risk.

✅ **Data cleaning decisions can directly affect operational recommendations**

**The cost of excess inventory changes the optimal decision:** Unsold products reduce profit through both purchase and disposal costs.

✅ **The profit-maximising quantity is not necessarily equal to expected demand**

**Statistical modelling and optimisation solve different parts of the problem:** Probability modelling describes demand uncertainty, while simulation translates that uncertainty into an inventory decision.

✅ **The value of the model comes from connecting uncertainty to a financial outcome**

## Recommendations

- Adjust inventory orders by weekday rather than using a fixed daily quantity
- Maintain higher inventory levels towards Fridays and weekends when greater demand justifies the additional stock
- Retain genuine high-demand observations when modelling inventory risk
- Re-estimate demand distributions as new demand data becomes available
- Apply the optimisation workflow separately to stores with different demand and cost structures

## Limitations

The dataset is simulated and relationships between weekday, seasonality and demand were introduced through modelling assumptions.

Only three standard count distributions were considered. Although the negative binomial distribution provided the best fit among the candidate models, other parametric or non-parametric approaches may better capture complex demand patterns.

The current analysis models demand uncertainty using probability distributions but does not explicitly forecast future demand trends.

The completed optimisation results currently focus on the Brighton store. The same workflow has been designed to be extended to the remaining stores using their individual demand patterns and cost structures.

Results should therefore be interpreted as an illustration of statistical demand modelling and inventory optimisation rather than a complete production inventory system.

✅ **The project provides a starting point for combining statistical modelling, simulation and optimisation in operational inventory decisions.**

## Next Steps

- Apply the optimisation workflow across all four simulated stores
- Compare how store-specific cost and disposal structures affect optimal inventory levels
- Incorporate time series forecasting to model changing demand patterns
- Explore additional probability distributions and non-parametric demand models
- Compare the current parametric approach with Sample Average Approximation using observed demand scenarios
- Explore Predict-then-Optimize methods that combine demand forecasting with inventory optimisation
- Develop a Power BI dashboard for store-level demand and inventory recommendations
