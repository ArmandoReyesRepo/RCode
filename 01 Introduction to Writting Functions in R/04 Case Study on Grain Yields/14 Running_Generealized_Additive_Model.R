library(mgcv)

# Run a generalized additive model of 
# yield vs. smoothed year and census region

corn <- readRDS("nass.corn.rds" )
corn<-fortity_with_metric_units(corn,"corn")
corn<- fortify_with_census_region(corn)

gam(yield_kg_per_ha ~ s(year) + census_region, data = corn)
