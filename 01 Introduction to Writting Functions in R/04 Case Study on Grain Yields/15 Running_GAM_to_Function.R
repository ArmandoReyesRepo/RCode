wheat <- readRDS("nass.wheat.rds" )
wheat<-fortity_with_metric_units(wheat,"wheat")
wheat<-fortify_with_census_region(wheat)

# Wrap the model code into a function
run_gam_yield_vs_year_by_region<- function(data){
  gam(yield_kg_per_ha ~ s(year) + census_region, data = data)
}

# Try it on the wheat dataset
run_gam_yield_vs_year_by_region(wheat)
