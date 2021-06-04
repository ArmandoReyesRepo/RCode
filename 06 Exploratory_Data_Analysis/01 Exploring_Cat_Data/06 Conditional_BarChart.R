# Plot of alignment broken down by gender
ggplot(comics_filtered, aes(x = align)) + 
  geom_bar() +
  facet_wrap(~ gender)