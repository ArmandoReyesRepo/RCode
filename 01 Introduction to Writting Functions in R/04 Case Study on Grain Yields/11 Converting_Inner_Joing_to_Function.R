# Wrap this code into a function
fortify_with_census_region<- function(data)
{
  data %>%
    inner_join(usa_census_regions, by = "state")
}

# Try it on the wheat dataset
head(fortify_with_census_region(wheat))
