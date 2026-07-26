source("helper_functions.R")
source("01_generate_clean_data.R")

brighton_dirty <- introduce_data_quality_issues(brighton_clean, seed = 567)
carlton_dirty <- introduce_data_quality_issues(carlton_clean, seed = 678)
south_wharf_dirty <- introduce_data_quality_issues(south_wharf_clean, seed = 789)
dandenong_dirty <- introduce_data_quality_issues(dandenong_clean, seed = 890)
