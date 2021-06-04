library(readr)
library(dplyr)
library(ggplot2)


cars<- read.csv("cars04.csv")


# Use density plots or box plots to construct the 
# following visualizations. For each variable, try both
# plots and submit the one that is better at capturing 
# the important structure.
# 
# Display the distribution of city_mpg.
# Display the distribution of width.



# Create plot of city_mpg
cars %>%
  ggplot(aes(x = 1, y = city_mpg)) +
  geom_boxplot()

cars %>%
  ggplot(aes(x = city_mpg)) +
  geom_density()

# Create plot of width
cars %>%
  ggplot(aes(x = 1, y = width)) +
  geom_boxplot()

cars %>%
  ggplot(aes(x = width)) +
  geom_density()


