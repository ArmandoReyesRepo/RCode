library(openintro)

mod <- lm(wgt ~ hgt, data = bdims)

# Show the coefficients
coef(mod)


# Show the full output
summary(mod)
