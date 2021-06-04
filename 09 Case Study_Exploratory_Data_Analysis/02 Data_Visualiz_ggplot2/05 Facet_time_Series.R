# Load the countrycode package
library(countrycode)
library(ggplot2)

# Print the votes dataset
votes<- readRDS("votes.RDS") 


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

# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries

filtered_6_countries<- by_year_country %>% filter( country %in% countries )

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(x=year, y=percent_yes)) +
  geom_line()
facet_wrap(~country )


