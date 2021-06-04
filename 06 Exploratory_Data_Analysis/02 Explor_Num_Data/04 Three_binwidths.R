library(readr)
library(dplyr)
library(ggplot2)


cars<- read.csv("cars04.csv")

# Create the following three plots, adding a title to each to 
# indicate the binwidth used:
#   
# A histogram of horsepower (i.e. horsepwr) with a binwidth of 3.
# A second histogram of horsepower with a binwidth of 30.
# A third histogram of horsepower with a binwidth of 60.

# Create hist of horsepwr with binwidth of 3
cars %>%
  ggplot(aes(x=horsepwr)) +
  geom_histogram(binwidth = 3) +
  ggtitle("Binwidth of 3")

# Create hist of horsepwr with binwidth of 30
cars %>%
  ggplot(aes(x=horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("Binwidth of 30")

# Create hist of horsepwr with binwidth of 60

cars %>%
  ggplot(aes(x=horsepwr)) +
  geom_histogram(binwidth = 60) +
  ggtitle("Binwidth of 60")

