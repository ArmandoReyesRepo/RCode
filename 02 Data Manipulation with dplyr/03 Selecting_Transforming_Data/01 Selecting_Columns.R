setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )


# Glimpse the counties table

glimpse(counties)


counties %>%
  # Select state, county, population, and industry-related columns
  select(state, county, population, professional:production) %>%
  # Arrange service in descending order 
  arrange(desc(service))