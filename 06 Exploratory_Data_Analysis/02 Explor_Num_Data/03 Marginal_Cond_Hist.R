library(readr)
library(dplyr)
library(ggplot2)


cars<- read.csv("cars04.csv")

# Create a histogram of the distribution of horsepwr across all cars and add an 
# appropriate title. Start by piping in the raw dataset.
# 
# Create a second histogram of the distribution of horsepower, but only for those
# cars that have an msrp less than $25,000. Keep the limits of the x-axis so that 
# they're similar to that of the first plot, and add a descriptive title.


# Create hist of horsepwr
cars %>%
  ggplot(aes(x=horsepwr)) +
  geom_histogram() +
  ggtitle("Distribution of horsepower for all cars")

# Create hist of horsepwr for affordable cars
cars %>% 
  filter(msrp < 25000) %>%
  ggplot(aes(x=horsepwr)) +
  geom_histogram() +
  xlim(c(90, 550)) +
  ggtitle("Distribution of horsepower for affordable cars")
