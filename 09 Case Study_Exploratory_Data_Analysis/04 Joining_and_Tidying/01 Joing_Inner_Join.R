# Load tidyr and purrr

library(tidyr)
library(purrr)
library(countrycode)

# Print the votes dataset
votes<- readRDS("votes.RDS") 
descriptions<- readRDS("descriptions.rds" )

# Add a country column within the mutate: votes_processed

votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945, country =  countrycode(ccode, "cown", "country.name"))

# Load the dplyr package.
# 
# Print the votes_processed dataset.
# 
# Print the new descriptions dataset.
# 
# Join the two datasets using dplyr's inner_join(), using the rcid 
# and session columns to match them. Save as votes_joined.


## dplyr already loaded


# Print the votes_processed dataset

votes_processed


# Print the descriptions dataset

descriptions


# Join them together based on the "rcid" and "session" columns

votes_joined<- votes_processed %>% 
  inner_join (descriptions, by=c("rcid", "session"))

