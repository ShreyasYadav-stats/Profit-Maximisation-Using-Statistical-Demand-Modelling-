library(dplyr)

source("helper_functions.R")

# ---------------- Brighton ----------------

brighton_weekday_means <- c(Monday = 70, Tuesday = 72, Wednesday = 84, Thursday = 90, Friday = 108, Saturday = 128, Sunday = 122)
brighton_weekday_sd <- c(Monday = 10, Tuesday = 10, Wednesday = 10, Thursday = 10, Friday = 14, Saturday = 16, Sunday = 16)

brighton_clean <- simulate_store(start_date = "2025-02-04", end_date = "2026-02-14", weekday_means = brighton_weekday_means, weekday_sd = brighton_weekday_sd,
  unit_cost = 5, selling_price = 7.2, disposal_cost = 1, seed = 123)

# ---------------- Carlton ----------------

carlton_weekday_means <- c(Monday = 52, Tuesday = 56, Wednesday = 60, Thursday = 66, Friday = 82, Saturday = 98, Sunday = 94)
carlton_weekday_sd <- c(Monday = 8, Tuesday = 8, Wednesday = 8, Thursday = 9, Friday = 11, Saturday = 13, Sunday = 13)

carlton_clean <- simulate_store(start_date = "2025-02-04", end_date = "2026-02-14", weekday_means = carlton_weekday_means,
  weekday_sd = carlton_weekday_sd, unit_cost = 6, selling_price = 8.5, disposal_cost = 1.2, seed = 234)

# ---------------- South Wharf ----------------

south_wharf_weekday_means <- c(Monday = 95, Tuesday = 100, Wednesday = 108, Thursday = 118, Friday = 145, Saturday = 170, Sunday = 160)
south_wharf_weekday_sd <- c(Monday = 12, Tuesday = 12, Wednesday = 13, Thursday = 14, Friday = 18, Saturday = 22, Sunday = 20)

south_wharf_clean <- simulate_store(start_date = "2025-02-04", end_date = "2026-02-14", weekday_means = south_wharf_weekday_means,
  weekday_sd = south_wharf_weekday_sd, unit_cost = 4.5, selling_price = 6.8, disposal_cost = 0.8, seed = 345)

# ---------------- Dandenong ----------------

dandenong_weekday_means <- c(Monday = 80, Tuesday = 82, Wednesday = 88, Thursday = 96, Friday = 116, Saturday = 138, Sunday = 130)
dandenong_weekday_sd <- c(Monday = 11, Tuesday = 11, Wednesday = 12, Thursday = 12, Friday = 15, Saturday = 18, Sunday = 17)

dandenong_clean <- simulate_store(start_date = "2025-02-04", end_date = "2026-02-14", weekday_means = dandenong_weekday_means,
  weekday_sd = dandenong_weekday_sd, unit_cost = 5.5, selling_price = 7.8, disposal_cost = 1.1, seed = 456)

