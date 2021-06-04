setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)


## to read https://stackoverflow.com/questions/7270544/how-to-see-data-from-rdata-file/7275974

ucb_admit<- get(load("ucb_admit.RData"))

# Count number of male and female applicants admitted
ucb_admit %>%
  count(Gender, Admit)


