
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
dir()
counties <- readRDS("counties.rds" )


##  Select some interesting variables

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>% arrange(desc(public_work))



