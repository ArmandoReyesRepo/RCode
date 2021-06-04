setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

evals<- get(load("evals.RData"))

# Inspect variable types

glimpse(evals)


# Remove non-factor variables from the vector below
cat_vars <- c( "rank", "ethnicity", "gender", "language", 
               "cls_level", "cls_profs", "cls_credits",
               "pic_outfit", "pic_color")
