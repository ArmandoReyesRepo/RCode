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

# Filtering the joined dataset
# 
# There are six columns in the descriptions dataset (and therefore in 
# the new joined dataset) that describe the topic of a resolution:
#   
# me: Palestinian conflict
# nu: Nuclear weapons and nuclear material
# di: Arms control and disarmament
# hr: Human rights
# co: Colonialism
# ec: Economic development
# 
# Each contains a 1 if the resolution is related to this topic and a 0 
# otherwise.

## Instructions

# Filter the votes_joined dataset for votes relating to colonialism.


# Filter for votes related to colonialism

votes_joined %>%
  filter(co==1)
