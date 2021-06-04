setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )

counties_selected<- counties %>% select(region, state, population, citizens)

# Find number of counties per state, weighted by citizens
counties_selected %>% count(state, wt=citizens, sort=TRUE)
