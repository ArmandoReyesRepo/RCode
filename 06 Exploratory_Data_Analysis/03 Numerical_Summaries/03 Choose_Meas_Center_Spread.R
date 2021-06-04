library(gapminder)

# Create dataset of 2007 data
gap2007 <- filter(gapminder, year==2007)



# Generate overlaid density plots
gap2007 %>%
  filter(continent=="Americas") %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_density(alpha = 0.3)

# Compute stats for lifeExp in Americas

gap2007 %>%
  filter(continent=="Americas") %>%
  summarize(mean(lifeExp),
            sd(lifeExp))

# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = pop)) +
  geom_density(alpha = 0.3)

# Compute stats for population
gap2007 %>%
  summarize(median(pop),
            IQR(pop))