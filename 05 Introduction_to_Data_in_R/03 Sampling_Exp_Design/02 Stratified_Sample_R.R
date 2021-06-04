setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

us_regions<- get(load("us_regions.RData"))

# Stratified sample
states_str <- us_regions %>%
  group_by(region) %>%
  sample_n(size=2)

# Count states by region
states_str %>%
  count(region)