library(openintro)
library(dplyr)


# Instructions
# 
# Use cor() to compute the correlation between the birthweight of babies in the ncbirths dataset and their mother's age. There is no missing data in either variable.
# Compute the correlation between the birthweight and the number of weeks of gestation for all non-missing pairs.


# Compute correlation
ncbirths %>%
  summarize(N = n(), r = cor(mage, weight))

# Compute correlation for all non-missing pairs
ncbirths %>%
  summarize(N = n(), r = cor(weight, weeks, use = "complete.obs"))
