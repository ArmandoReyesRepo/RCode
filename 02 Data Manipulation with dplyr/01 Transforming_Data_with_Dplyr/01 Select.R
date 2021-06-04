
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
dir()
counties <- readRDS("counties.rds" )

counties %>% select(state,county,population, poverty)


