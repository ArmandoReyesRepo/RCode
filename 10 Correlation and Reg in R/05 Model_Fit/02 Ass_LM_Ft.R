library(openintro)
library(broom)
library(dplyr)


## getting the linear model
mod <- lm(wgt ~ hgt, data = bdims)

# View model summary

summary(mod)

bdims_tidy<- augment(mod)


# Compute R-squared
bdims_tidy %>%
  summarize(var_y = var(wgt), var_e = var(.resid)) %>%
  mutate(R_squared = 1 - var_e/var_y)