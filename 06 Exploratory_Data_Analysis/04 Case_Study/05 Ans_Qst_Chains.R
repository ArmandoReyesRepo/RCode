library(openintro)  ##  email dataset
library(dplyr)  ## glimpse
library(ggplot2)  ## in order to do graphics


email<- email %>% mutate( spam1= ifelse(spam==0,"not-spam","spam"))

# "Within non-spam emails, is the typical length of emails shorter for those 
# that were sent to multiple people?"

# This can be answered with the following chain:
#   
#   email %>%
#   filter(spam == "not-spam") %>%
#   group_by(to_multiple) %>%
#   summarize(median(num_char))

# Build a chain to answer each of the following questions, 
# both about the variable dollar.
# 
# For emails containing the word "dollar", does the typical spam 
# email contain a greater number of occurrences of the word than
# the typical non-spam email? Create a summary statistic that 
# answers this question.
# 
# If you encounter an email with greater than 10 occurrences of 
# the word "dollar", is it more likely to be spam or not-spam? 
# Create a barchart that answers this question.

# Question 1
email %>%
  filter(dollar>0) %>%
  group_by(spam) %>%
  summarize(median(dollar))

# Question 2
email %>%
  filter(dollar>10) %>%
  ggplot(aes(x = spam)) +
  geom_bar()
