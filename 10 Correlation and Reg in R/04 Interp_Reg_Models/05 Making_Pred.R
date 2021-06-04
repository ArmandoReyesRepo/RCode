library(broom)

mod <- lm(wgt ~ hgt, data = bdims)

ben <- data.frame("wgt" = 74.8, "hgt" = 182.8)

# Predict the weight of ben

predict(mod,ben)
