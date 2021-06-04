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

# Percentage of yes votes from the US by year: US_by_year
US_by_year <- by_year_country %>%
  filter(country == "United States")

# Print the US_by_year data
US_by_year
# Perform a linear regression of percent_yes by year: US_fit

US_fit <- lm( percent_yes~ year, data=US_by_year  )

# Perform summary() on the US_fit object

summary(US_fit)



