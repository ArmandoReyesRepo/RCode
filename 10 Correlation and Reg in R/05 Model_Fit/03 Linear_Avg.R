library(broom)


mod_null <- lm(wgt~ 1, data=bdims)  %>% 
  augment(bdims)

mod_hgt <- lm(wgt~hgt, data=bdims)  %>%
  augment(bdims)
  
  

# Compute SSE for null model  ( this will be the SST)
mod_null %>%
  summarize(SSE = sum(.resid^2))

# Compute SSE for regression model
mod_hgt %>%
  summarize(SSE = sum(.resid^2))