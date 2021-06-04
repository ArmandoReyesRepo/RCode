library(openintro)
library(broom)
library(dplyr)


## getting the linear model
mod <- lm(formula = SLG ~ OBP, data = filter(mlbBat10, AB >= 10))
# Rank points of high leverage
mod %>%
  augment() %>%
  arrange(desc(.hat)) %>%
  head()
