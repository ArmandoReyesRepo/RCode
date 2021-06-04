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

# Print the by_country dataset created in the last exercise.
# Use arrange() to sort the countries in ascending order of percent_yes.
# Arrange the countries by the same variable, but in descending order.

# Print the by_country dataset

by_country


# Sort in ascending order of percent_yes

by_country %>% arrange(percent_yes)

# Now sort in descending order

by_country %>% arrange(desc(percent_yes))


