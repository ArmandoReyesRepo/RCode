# Load the countrycode package
library(countrycode)


# Convert country code 100
countrycode(100, "cown", "country.name")


# Add a country column within the mutate: votes_processed
votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945, country =  countrycode(ccode, "cown", "country.name"))



# Change this code to summarize by year
votes_processed %>%
  group_by(year) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))
