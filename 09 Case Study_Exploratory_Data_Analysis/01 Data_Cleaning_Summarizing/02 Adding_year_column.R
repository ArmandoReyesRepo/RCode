# Load the dplyr package
library(dplyr)

# Print the votes dataset
votes<- readRDS("votes.RDS") 


# Use mutate() to add a year column by adding 1945 
# to the session column.

# Add another %>% step to add a year column
votes_1_3_1945<- votes %>%
  filter(vote <= 3) %>%
  mutate (year = session + 1945)