library(mgcv)

wheat <- readRDS("nass.wheat.rds" )
wheat<-fortity_with_metric_units(wheat,"wheat")
wheat<-fortify_with_census_region(wheat)

corn <- readRDS("nass.corn.rds" )
corn<-fortity_with_metric_units(corn,"corn")
corn<- fortify_with_census_region(corn)

# Try it on the corn dataset
corn_model<- run_gam_yield_vs_year_by_region(corn)

# Try it on the wheat dataset
wheat_model<- run_gam_yield_vs_year_by_region(wheat)


## Creating census_regions vector
usa_census_regions<- read.csv("usa_census_regions.csv")
names(usa_census_regions)[1]<- "census_region"
census_regions<- as.character(unique(usa_census_regions$census_region))  



# Make predictions in 2050  
predict_this <- data.frame(
  year = 2050,
  census_region = census_regions
) 


# Predict the yield
pred_yield_kg_per_ha <- predict(corn_model, predict_this, type = "response")

predict_this %>%
  # Add the prediction as a column of predict_this 
  mutate(pred_yield_kg_per_ha = pred_yield_kg_per_ha )

