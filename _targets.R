library("targets")

#---- Settings ----
# Options
options(tidyverse.quiet = TRUE)
# Packages
tar_option_set(packages = "tidyverse")
# Custom functions
source("R/custom-functions.R")

#---- Workflow ----
list(
    # Get data
    tar_target(raw_data_file, "Data/raw-data.csv", format = "file"),
    tar_target(my_data, read.csv(raw_data_file)),
    # Descriptive statistics
    tar_target(plot_obs,
        ggplot(my_data, aes(x=Group, y=Value, fill=Group)) + geom_boxplot()
    ),
    # Inferential statistics
    tar_target(lm_fit, get_lm_fit(my_data, .contr_fun=contr.treatment))
)
