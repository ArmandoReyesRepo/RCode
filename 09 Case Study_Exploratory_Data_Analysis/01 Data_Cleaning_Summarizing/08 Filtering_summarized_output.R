# Load the countrycode package
library(countrycode)


# Convert country code 100
countrycode(100, "cown", "country.name")


# Add a country column within the mutate: votes_processed
votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945, country =  countrycode(ccode, "cown", "country.name"))

# Summarize by country: by_country
by_country<- votes_processed %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Use filter() to remove from the sorted data countries that 
# have fewer than 100 votes.


# Filter out countries with fewer than 100 votes
by_country %>%
  arrange(percent_yes) %>%
  filter( total>=100)



