library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/06 Exploratory_Data_Analysis")

cars<- read.csv("cars04.csv")


# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl==4|ncyl==6|ncyl==8)

# common_cyl, which you created to contain only cars with 4, 6, or 8 
# cylinders, is available in your workspace.
# 
# Using common_cyl, create a histogram of hwy_mpg.
# Grid-facet the plot rowwise by ncyl and columnwise by suv.
# Add a title to your plot to indicate what variables are being faceted on.

# Facet hists using hwy mileage and ncyl
common_cyl %>%
  ggplot(aes(x = hwy_mpg)) +
  geom_histogram() +
  facet_grid(ncyl ~ suv) +
  ggtitle("ncyl vs suv")


