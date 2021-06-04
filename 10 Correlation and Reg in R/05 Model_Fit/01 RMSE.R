library(openintro)
library(broom)


## getting the linear model
mod <- lm(wgt ~ hgt, data = bdims)

# View summary of model
summary(mod)


# Compute the mean of the residuals

mean(residuals(mod))


# Compute RMSE
sqrt(sum(residuals(mod)^2) / df.residual(mod))
