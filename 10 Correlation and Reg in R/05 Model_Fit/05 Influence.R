library(openintro)
library(broom)
library(dplyr)


## getting the linear model
mod <- lm(formula = SLG ~ OBP, data = filter(mlbBat10, AB >= 10))

# Rank influential points

mod %>% augment() %>%
  arrange(desc(.cooksd)) %>%
  head()