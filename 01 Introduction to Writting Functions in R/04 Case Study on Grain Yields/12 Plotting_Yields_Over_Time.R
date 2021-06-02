corn <- readRDS("nass.corn.rds" )
corn<-fortity_with_metric_units(corn,"corn")



corn<-fortify_with_census_region(corn)

# Plot yield vs. year for the corn dataset
plot_yield_vs_year(corn) +
  # Facet, wrapped by census region
  facet_wrap(vars(census_region))