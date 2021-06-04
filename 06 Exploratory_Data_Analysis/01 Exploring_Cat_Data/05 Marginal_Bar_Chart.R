# Change the order of the levels in align
comics_filtered$align <- factor(comics_filtered$align, 
                       levels = c("Bad", "Neutral", "Good"))

# Create plot of align
ggplot(comics_filtered, aes(x = align)) + 
  geom_bar()