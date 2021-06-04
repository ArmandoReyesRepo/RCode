# Load the countrycode package
library(countrycode)


# Add a country column within the mutate: votes_processed

votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945, country =  countrycode(ccode, "cown", "country.name"))

# Group by year and country: by_year_country
by_year_country<- votes_processed %>%
  group_by(year, country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Print by_year_country

by_year_country

# Create a filtered version: UK_by_year

UK_by_year<- by_year_country %>% filter (country=="United Kingdom")


# Line plot of percent_yes over time for UK only
ggplot(UK_by_year, aes(x=year, y=percent_yes)) +
  geom_line()




