setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/04 Case Study on Grain Yields")
dir()

usa_census_regions<- read.csv("usa_census_regions.csv")

View(usa_census_regions)

colnames(usa_census_regions)

names(usa_census_regions)[1]<- "census_region"

View(usa_census_regions)





# Inner join the corn dataset to usa_census_regions by state
corn_enhanced<-corn %>%
  inner_join(usa_census_regions, by = "state")

View(corn_enhanced)

