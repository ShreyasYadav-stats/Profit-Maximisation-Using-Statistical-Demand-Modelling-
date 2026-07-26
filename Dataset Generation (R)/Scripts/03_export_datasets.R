library(openxlsx)
source("02_generate_dirty_data.R")

# ---------------- Create dataset lists ------------

clean_datasets <- list(Brighton = brighton_clean, Carlton = carlton_clean, `South Wharf` = south_wharf_clean, Dandenong = dandenong_clean)
dirty_datasets <- list(Brighton = brighton_dirty, Carlton = carlton_dirty, `South Wharf` = south_wharf_dirty, Dandenong = dandenong_dirty)

# ---------------- Export datasets ----------------

dir.create("../Generated Datasets", showWarnings = FALSE)

export_workbook(clean_datasets, "../Datasets/newsvendor_clean_4stores.xlsx")
export_workbook(dirty_datasets, "../Datasets/newsvendor_dirty_4stores.xlsx")
