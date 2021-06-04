


## getting the coefficients
coefs<- as.data.frame(t(coef(mod))) 

# Add the line to the scatterplot
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_abline(data = coefs, 
              aes(intercept = `(Intercept)`, slope = `hgt`),  
              color = "dodgerblue")
