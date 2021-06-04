setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )

counties_selected<- counties %>% select(county, population, income, unemployment)

# Summarize to find minimum population, maximum unemployment, and average income
counties_selected %>%
  summarize(min_population=min(population), max_unemployment=max(unemployment),
            average_income= mean(income))
