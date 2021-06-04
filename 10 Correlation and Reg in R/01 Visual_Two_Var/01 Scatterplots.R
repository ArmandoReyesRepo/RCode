
# Instructions
# 
# Using the ncbirths dataset, make a scatterplot 
# using ggplot() to illustrate how the birth weight 
# of these babies varies according to the number of
# weeks of gestation.

library(openintro)
library(ggplot2)

# Scatterplot of weight vs. weeks

ggplot(ncbirths, aes(x=weeks, y=weight)) + geom_point()
