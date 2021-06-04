setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )

counties_selected<- counties %>% select(region, state, population, walk)


counties_selected %>%
  # Add population_walk containing the total number of people who walk to work 
  mutate(population_walk = walk * population/100) %>%
  # Count weighted by the new column
  count(state, wt=population_walk, sort=TRUE)
