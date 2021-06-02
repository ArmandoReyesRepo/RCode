library(dplyr)
library(tidyverse)
detach("package:tidyr", unload=TRUE)


setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/04 Case Study on Grain Yields")

corn <- readRDS("nass.corn.rds" )
wheat <- readRDS("nass.wheat.rds" )


# Wrap this code into a function
fortity_with_metric_units<- function(data, crop) {
  data %>%
    mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(
        yield_bushels_per_acre, 
        crop = crop
      )
    )
}
# Try it on the wheat dataset
corn<-fortity_with_metric_units(corn,"corn")
wheat<- fortity_with_metric_units(wheat,"wheat")


# Using corn, plot yield (kg/ha) vs. year
ggplot(corn, aes(year, yield_kg_per_ha)) +
  # Add a line layer, grouped by state
  geom_line(aes(group = state)) +
  # Add a smooth trend layer
  geom_smooth()
