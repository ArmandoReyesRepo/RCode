library(openintro)  ##  email dataset
library(dplyr)  ## glimpse
library(ggplot2)  ## in order to do graphics


email<- email %>% mutate( spam1= ifelse(spam==0,"not-spam","spam"))

# Compute center and spread for exclaim_mess by spam
email %>%
  group_by(spam1) %>%
  summarize( median(exclaim_mess), IQR(exclaim_mess))

# Create plot for spam and exclaim_mess

## box plot
email %>%
  mutate(log_exclaim_mess = log(exclaim_mess + 0.01)) %>%
  ggplot(aes(x = 1, y = log_exclaim_mess)) +
  geom_boxplot() + 
  facet_wrap(~spam1)

##  histogram  
email %>%
  mutate(log_exclaim_mess = log(exclaim_mess +0.01)) %>%
  ggplot(aes(x = log_exclaim_mess)) +
  geom_histogram() +
  facet_grid(~spam1)

## overlaid

email %>%
  mutate(log_exclaim_mess = log(exclaim_mess + 0.01)) %>%
  ggplot(aes(x = log_exclaim_mess, fill = spam1)) +
  geom_density(alpha=0.3)


