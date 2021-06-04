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

# Add an unnest() step to unnest the tidied models stored in the tidied
# column. Save the result as country_coefficients.
# 
# Print the resulting country_coefficients object to the console.

# Add one more step that unnests the tidied column
country_coefficients <- by_year_country %>%
  nest(-country) %>%
  mutate(model = map(data, ~ lm(percent_yes ~ year, data = .)),
         tidied = map(model, tidy)) %>%
  unnest(tidied)


# Print the resulting country_coefficients variable

country_coefficients



# Print the country_coefficients data frame to the console.
# 
# Perform a filter() step that extracts only the slope 
# (not intercept) terms.

# Print the country_coefficients dataset

country_coefficients

# Filter for only the slope terms

country_coefficients %>%
  filter( term=="year")

