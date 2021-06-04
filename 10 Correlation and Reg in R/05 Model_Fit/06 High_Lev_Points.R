library(openintro)
library(dplyr)

mod <- lm(formula = SLG ~ OBP, data = filter(mlbBat10, AB >= 10))


# Rank high leverage points

mod %>% augment() %>%
  arrange(desc(.hat),.cooksd) %>%
  head()
