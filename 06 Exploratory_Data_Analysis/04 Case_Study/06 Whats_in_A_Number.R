library(openintro)  ##  email dataset
library(dplyr)  ## glimpse
library(ggplot2)  ## in order to do graphics


email<- email %>% mutate( spam1= ifelse(spam==0,"not-spam","spam"))

# Reorder levels
email$number_reordered <- factor(email$number, levels=c("none","small","big"))

# Construct plot of number_reordered
ggplot(email, aes(x=number_reordered)) +
  geom_bar() +
  facet_wrap(~ spam1)