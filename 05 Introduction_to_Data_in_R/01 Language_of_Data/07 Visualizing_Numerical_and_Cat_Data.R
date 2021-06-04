library(openintro)  ##  for the use of email50
library(ggplot2)
library(dplyr)

data("email50")

# Scatterplot of exclaim_mess vs. num_char
ggplot(email50, aes(x = num_char, y = exclaim_mess, color = factor(spam))) +
  geom_point()
