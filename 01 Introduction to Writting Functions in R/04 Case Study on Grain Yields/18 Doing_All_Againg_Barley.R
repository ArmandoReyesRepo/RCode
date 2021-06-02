library(dplyr)
library(ggplot2)
library(mgcv)

## New fortify for metric units

fortify_with_metric_units2<- function(data) {
  data %>%
    mutate(
      farmed_area_ha = acres_to_hectares(farmed_area_acres),
      yield_kg_per_ha = bushels_per_acre_to_kgs_per_hectare(yield_bushels_per_acre)
    )
}

## New fortify for census regions

fortify_with_census_region2<- function(data) {
  data %>%
    left_join(usa_census_regions, by = "state")
}



barley <- readRDS("nass.barley.rds" )

fortified_barley <- barley %>% 
  # Fortify with metric units
  fortify_with_metric_units2() %>%
  # Fortify with census regions
  fortify_with_census_region2()


glimpse(fortified_barley)



