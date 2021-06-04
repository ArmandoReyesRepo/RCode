library(openintro)

# Linear model for weight as a function of height
lm(wgt ~ hgt, data = bdims)

# Linear model for SLG as a function of OBP
lm(SLG~OBP , data = mlbBat10)


# Log-linear model for body weight as a function of brain weight
lm( log(BodyWt)~ log(BrainWt) , data = mammals)

