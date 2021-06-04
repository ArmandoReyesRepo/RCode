library(gapminder)

# Create dataset of 2007 data
gap2007 <- filter(gapminder, year==2007)

# Using the gap2007 data:
#   
# Create a density plot of the population variable.
# 
# Mutate a new column called log_pop that is the natural 
# log of the population and save it back into gap2007.
# 
# Create a density plot of your transformed variable.

# Create density plot of old variable
gap2007 %>%
  ggplot(aes(x = pop)) +
  geom_density()

# Transform the skewed pop variable
gap2007 <- gap2007 %>%
  mutate(log_pop=log(pop))

# Create density plot of new variable
gap2007 %>%
  ggplot(aes(x = log_pop)) +
  geom_density()
