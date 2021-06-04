library(openintro)  ##  email dataset
library(dplyr)  ## glimpse
library(ggplot2)  ## in order to do graphics
 

email<- email %>% mutate( spam1= ifelse(spam==0,"not-spam","spam"))


# Compute summary statistics
email %>%
  group_by(spam1) %>%
  summarize( median(num_char), IQR(num_char))

# Create plot
email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam1, y = log_num_char)) +
  geom_boxplot()