setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

evals<- get(load("evals.RData"))


# Exercise
# Create a scatterplot
# The bty_avg variable shows the average beauty rating of the professor by the 
# six students who were asked to rate the attractiveness of these faculty. 
# The score variable shows the average professor evaluation score, with 1 being 
# very unsatisfactory and 5 being excellent.
# 
# Instructions
# 
# Use ggplot() to create a scatterplot displaying the relationship between 
# these two variables.
# 
# How would you describe the relationship apparent in this visualization?

# Scatterplot of score vs. bty_avg
ggplot(evals, aes(x=bty_avg, y=score)) +
  geom_point()