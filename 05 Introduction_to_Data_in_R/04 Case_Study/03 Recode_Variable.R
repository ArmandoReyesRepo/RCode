setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

evals<- get(load("evals.RData"))

# Recode cls_students as cls_type
evals_fortified <- evals %>%
  mutate(
    cls_type = case_when(
      cls_students <=18                        ~ "small",
      cls_students>=19 & cls_students<=59      ~ "midsize",
      cls_students>=60                         ~ "large"
    )
  )