# Load tidyr and purrr

library(tidyr)
library(purrr)
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


# Load the broom package.
# 
# Use the map() function to apply the tidy() function to each 
# linear model in the model column, creating a new column 
# called tidied.


# Load the broom package

library(broom)


# Add another mutate that applies tidy() to each model
by_year_country %>%
  nest(-country) %>%
  mutate(model = map(data, ~ lm(percent_yes ~ year, data = .)), tidied= map(model,tidy)  ) 







