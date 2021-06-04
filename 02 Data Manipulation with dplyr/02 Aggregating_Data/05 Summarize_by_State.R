setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/02 Data Manipulation with dplyr")
counties <- readRDS("counties.rds" )

counties_selected<- counties %>% select(state, county, population, land_area)


# Group by state and find the total area and population
counties_selected %>% group_by(state) %>% 
summarize( total_area=sum(land_area), total_population=sum(population))

# Add a density column, then sort in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>% 
  mutate(density= total_population/total_area) %>% arrange(desc(density))


