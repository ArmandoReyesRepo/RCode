setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

us_regions<- get(load("us_regions.RData"))


# The dplyr package and us_regions data frame have been loaded.
# 
# Use simple random sampling to select eight states from us_regions. 
# Save this sample in a data frame called states_srs.
# 
# Count the number of states from each region in your sample.

# Simple random sample: states_srs
states_srs <- us_regions %>%
  sample_n(size=8)

# Count states by region
states_srs %>%
  count(region)
