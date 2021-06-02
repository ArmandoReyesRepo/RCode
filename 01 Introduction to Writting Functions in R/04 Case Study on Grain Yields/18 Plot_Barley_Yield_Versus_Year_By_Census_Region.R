
fortified_barley <- barley %>% 
  # Fortify with metric units
  fortify_with_metric_units2() %>%
  # Fortify with census regions
  fortify_with_census_region2()


plot_yield_vs_year_by_region(fortified_barley)
