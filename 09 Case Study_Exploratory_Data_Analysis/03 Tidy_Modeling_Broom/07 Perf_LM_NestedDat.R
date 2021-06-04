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

# Load the tidyr and purrr packages.
# 
# After nesting, use the map() function within a mutate() to 
# perform a linear regression on each dataset (i.e. each item 
# in the data column in by_year_country) modeling percent_yes 
# as a function of year. Save the results to the model column.



# Perform a linear regression on each item in the data column
by_year_country %>%
  nest(-country) %>%
  mutate(model= map(data, ~ lm(percent_yes ~ year, data = .) ) )





