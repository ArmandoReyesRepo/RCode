library(ggplot2)
library(dplyr)

dat <- datasets::anscombe
Anscombe <- data.frame(
  set  = rep(1:4, each = 11),
  x = unlist(dat[,c(1:4)]),
  y = unlist(dat[,c(5:8)])
)
rownames(Anscombe) <- NULL
Anscombe


# Compute properties of Anscombe
t<- Anscombe %>%
  group_by(set) %>%
  summarize(
    N = n(), 
    mean_of_x = mean(x), 
    std_dev_of_x = sd(x), 
    mean_of_y = mean(y), 
    std_dev_of_y = sd(y), 
    correlation_between_x_and_y = cor(x,y)
  )

