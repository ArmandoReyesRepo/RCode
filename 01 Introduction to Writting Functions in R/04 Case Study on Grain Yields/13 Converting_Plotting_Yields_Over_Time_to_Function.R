

wheat <- readRDS("nass.wheat.rds" )
wheat<-fortity_with_metric_units(wheat,"wheat")
wheat<-fortify_with_census_region(wheat)

# Wrap this code into a function
plot_yield_vs_year_by_region<- function(data)
{
  plot_yield_vs_year(data) +
    facet_wrap(vars(census_region))
}

# Try it on the wheat dataset
plot_yield_vs_year_by_region(wheat)
