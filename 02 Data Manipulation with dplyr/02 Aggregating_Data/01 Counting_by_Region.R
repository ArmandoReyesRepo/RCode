setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )

counties_selected<- counties %>% select(region, state, population, citizens)

# Use count to find the number of counties in each region
counties_selected %>%  count(region, sort=TRUE)

