# Instructions
# 
# Using the ncbirths dataset again, make a boxplot illustrating how the 
# birth weight of these babies varies according to the number of weeks 
# of gestation. This time, use the cut() function to discretize the x-variable 
# into six intervals (i.e. five breaks).

library(openintro)
library(ggplot2)

# Boxplot of weight vs. weeks
ggplot(data = ncbirths, 
       aes(x = cut(weeks, breaks = 5), y = weight)) + 
  geom_boxplot()
