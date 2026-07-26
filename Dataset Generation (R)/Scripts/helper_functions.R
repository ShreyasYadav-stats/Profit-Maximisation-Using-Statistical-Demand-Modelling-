# Helper Functions

# This script contains reusable functions used throughout the dataset generation workflow. 
# Separating commonly used functionality into helper functions improves code readability, reduces duplication and makes the simulation framework easier to maintain and extend.

library(dplyr)
library(openxlsx)

# Functions
#
# simulate_store()
#   Simulates clean daily demand data.
#
# introduce_data_quality_issues()
#   Creates realistic dirty datasets.
#
# export_workbook()
#   Exports multiple datasets to Excel.

## `simulate_store()`

simulate_store <- function(start_date, end_date, weekday_means, weekday_sd, unit_cost, selling_price, disposal_cost,
    seed, seasonal_amplitude = 10, spike_probability = 0.06, dip_probability = 0.04, spike_range = 20:45, dip_range = 10:25) {

 set.seed(seed)

    # 1. Create date range
  dates <- seq(as.Date(start_date), as.Date(end_date), by = "day")

  df_clean <- tibble::tibble(
    date = dates,
    day_of_week = weekdays(date),
    day_index = seq_along(date)
  )

  # 2. Add weekday demand and seasonal effects
  df_clean <- df_clean %>%
    dplyr::mutate(
      base_demand = weekday_means[day_of_week],
      seasonal_factor = seasonal_amplitude * sin(2 * pi * day_index / 365)
    )

  # 3. Simulate noise, spikes, dips and demand
  df_clean <- df_clean %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      noise = rnorm(1, mean = 0, sd = weekday_sd[day_of_week]),
      spike_flag = rbinom(1, 1, spike_probability),
      dip_flag = rbinom(1, 1, dip_probability),
      spike_size = ifelse(spike_flag == 1, sample(spike_range, 1), 0),
      dip_size = ifelse(dip_flag == 1, sample(dip_range, 1), 0),
      demand = round(base_demand + seasonal_factor + noise + spike_size - dip_size)
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(
      demand = pmax(demand, 0),
      unit_cost = unit_cost,
      selling_price = selling_price,
      disposal_cost = disposal_cost
    ) %>%
    dplyr::select(
      date, day_of_week, base_demand, seasonal_factor, noise,
      spike_flag, dip_flag, demand, unit_cost,
      selling_price, disposal_cost
    )

  return(df_clean)
}


## `introduce_data_quality_issues()`


introduce_data_quality_issues <- function(df_clean, seed, duplicate_rows = 8, missing_dates = 5,
    negative_demands = 4, high_outliers = 4, missing_demands = 5,
    non_numeric_demands = 5, inconsistent_weekdays = 10, mixed_dates = 8) {

  df_dirty <- df_clean
  set.seed(seed)

  n <- nrow(df_dirty)

  # a. Duplicate a few rows
  dup_rows <- sample(1:n, duplicate_rows)
  df_dirty <- bind_rows(df_dirty, df_dirty[dup_rows, ])

  # b. Remove a few dates by setting them missing
  missing_date_rows <- sample(1:nrow(df_dirty), missing_dates)
  df_dirty$date[missing_date_rows] <- as.Date(NA)

  # c. Negative demand values
  neg_rows <- sample(setdiff(1:nrow(df_dirty), missing_date_rows), negative_demands)
  df_dirty$demand[neg_rows] <- sample(c(-5, -12, -20), negative_demands, replace = TRUE)

  # d. Impossible high outliers
  high_rows <- sample(setdiff(1:nrow(df_dirty), c(missing_date_rows, neg_rows)), high_outliers)
  df_dirty$demand[high_rows] <- sample(c(400, 550, 700), high_outliers, replace = TRUE)

  # e. Missing demand values
  na_demand_rows <- sample(setdiff(1:nrow(df_dirty), c(missing_date_rows, neg_rows, high_rows)), missing_demands)
  df_dirty$demand[na_demand_rows] <- NA

  # f. Convert demand to character and insert non-numeric strings
  df_dirty$demand <- as.character(df_dirty$demand)

  string_rows <- sample(setdiff(1:nrow(df_dirty), c(missing_date_rows, neg_rows, high_rows, na_demand_rows)), non_numeric_demands)

  df_dirty$demand[string_rows] <- c("one hundred", "missing", "N/A", "eighty", "unknown")[1:non_numeric_demands]

  # g. Mixed weekday labels
  weekday_rows <- sample(1:nrow(df_dirty), inconsistent_weekdays)

  weekday_labels <- c("monday", "tuesday", "friday ", "SATURDAY", " sunday", "WEDNESDAY", "ThuRsday", "MONDAY ", "friDay", "sunday ")

  df_dirty$day_of_week[weekday_rows] <- weekday_labels[1:inconsistent_weekdays]

  # h. Mixed date formats
  df_dirty$date <- as.character(df_dirty$date)

  date_rows <- sample(which(!is.na(df_dirty$date)), mixed_dates)

  df_dirty$date[date_rows[1:3]] <- format(as.Date(df_dirty$date[date_rows[1:3]]), "%d/%m/%Y")
  df_dirty$date[date_rows[4:6]] <- format(as.Date(df_dirty$date[date_rows[4:6]]), "%m-%d-%Y")
  df_dirty$date[date_rows[7:8]] <- format(as.Date(df_dirty$date[date_rows[7:8]]), "%d %b %Y")

  return(df_dirty)
}


## `export_workbook()`


export_workbook <- function(dataset_list, file_name) {

  wb <- createWorkbook()

  for (sheet in names(dataset_list)) {
    addWorksheet(wb, sheet)
    writeData(wb, sheet, dataset_list[[sheet]])
  }

  saveWorkbook(wb, file_name, overwrite = TRUE)

}
