library("targets")

#---- Settings ----
# Load packages
library("tidyverse")

# Source custom functions
source("R/custom-functions.R")
# Options
options(tidyverse.quiet = TRUE)

#---- Workflow ----
list(
    # Get data
    tar_target(raw_data_file, "Data/raw-data.csv", format = "file"),
    tar_target(my_data, read.csv(raw_data_file)),
    # Descriptive statistics
    tar_target(plot_obs, get_plot_obs(my_data)),
    # Inferential statistics
    tar_target(lm_fit, get_lm_fit(my_data))
)
