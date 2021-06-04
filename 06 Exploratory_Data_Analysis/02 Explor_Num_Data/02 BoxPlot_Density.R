library(readr)
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/06 Exploratory_Data_Analysis")

cars<- read.csv("cars04.csv")


# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl==4|ncyl==6|ncyl==8)

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)
