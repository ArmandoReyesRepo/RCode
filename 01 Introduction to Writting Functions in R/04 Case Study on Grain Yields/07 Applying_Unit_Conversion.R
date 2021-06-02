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
fortified<-fortity_with_metric_units(wheat,"wheat")
