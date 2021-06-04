library(openintro)  ## data bdims
library(broom)  ## in order to get data from fitted model




# Mean of weights equal to mean of fitted values?
mean(bdims$wgt) == mean(fitted.values(mod))

# Mean of the residuals


mean(residuals(mod))
