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

# Filter by adjusted p-values
filtered_countries <- country_coefficients %>%
  filter(term == "year") %>%
  mutate(p.adjusted = p.adjust(p.value)) %>%
  filter(p.adjusted < .05)



# Using arrange() and desc(), sort the filtered countries to find 
# the countries whose percentage "yes" is most quickly increasing over time.
# 
# Using arrange(), sort to find the countries whose percentage "yes" is 
# most quickly decreasing.


# Sort for the countries increasing most quickly

filtered_countries %>% 
  arrange(desc(estimate))



# Sort for the countries decreasing most quickly

filtered_countries %>% 
  arrange(estimate)


