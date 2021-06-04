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

# Vector of four countries to examine
countries <- c("United States", "United Kingdom",
               "France", "India")

# Filter by_year_country: filtered_4_countries

filtered_4_countries<- by_year_country %>%
  filter( country %in% countries)


# Line plot of % yes in four countries
ggplot(filtered_4_countries, aes(x=year, y=percent_yes, color=country)) +
  geom_line()
