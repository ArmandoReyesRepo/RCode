setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

evals<- get(load("evals.RData"))

# Inspect evals

glimpse(evals)
