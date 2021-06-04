library(openintro)
library(ggplot2)
library(dplyr)

# Instructions

# Use filter() to keep only players who had at least 200 at-bats, assigning to ab_gt_200.
# Using ab_gt_200, create a scatterplot for SLG as a function of OBP.
# Find the row of ab_gt_200 corresponding to the one player (with at least 200 at-bats) whose OBP was below 0.200.

# Filter for AB greater than or equal to 200
ab_gt_200 <- mlbBat10 %>%
  filter(AB>=200) 

# Scatterplot of SLG vs. OBP
ggplot(ab_gt_200, aes(x = OBP, y = SLG)) +
  geom_point()

# Identify the outlying player
ab_gt_200 %>%
  filter(OBP<0.2)
