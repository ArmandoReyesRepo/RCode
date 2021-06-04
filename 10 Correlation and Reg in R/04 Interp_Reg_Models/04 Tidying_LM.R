library(openintro)
library(broom)
library(dplyr)

mod <- lm(wgt ~ hgt, data = bdims)




# Create bdims_tidy

bdims_tidy<- augment(mod)


# Glimpse the resulting data frame

glimpse(bdims_tidy)
