# Load the countrycode package
library(countrycode)

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


# Load the tidyr package
library(tidyr)
# Nest all columns besides country
nested<- by_year_country %>% nest(-country)


# Print the nested data for Brazil

nested$data[[7]]
