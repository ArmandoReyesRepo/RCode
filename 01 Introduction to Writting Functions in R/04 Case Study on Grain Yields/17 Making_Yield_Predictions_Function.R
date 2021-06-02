library(mgcv)

wheat <- readRDS("nass.wheat.rds" )
wheat<-fortity_with_metric_units(wheat,"wheat")
wheat<-fortify_with_census_region(wheat)

# Wheat Model
wheat_model<- run_gam_yield_vs_year_by_region(wheat)

## Creating census_regions vector
usa_census_regions<- read.csv("usa_census_regions.csv")
names(usa_census_regions)[1]<- "census_region"
census_regions<- as.character(unique(usa_census_regions$census_region)) 


# Wrap this prediction code into a function
predict_yields<- function(model, year)
{
  predict_this <- data.frame(
    year = year,
    census_region = census_regions
  ) 
  pred_yield_kg_per_ha <- predict(model, predict_this, type = "response")
  predict_this %>%
    mutate(pred_yield_kg_per_ha = pred_yield_kg_per_ha)
}

# Try it on the wheat dataset
predict_yields(wheat_model,2050)
