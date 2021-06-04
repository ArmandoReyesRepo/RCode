library(dplyr)

## Halley
source("https://goo.gl/2aojPM")
# 
# We've put the data monarchs in your workspace.
# 
# Print monarchs to take a look at the data
# 
# Create a new column called reign that is an interval 
# between from and to.
# 
# Create another new column, length, that is the interval 
# length of reign. The rest of the pipeline we've filled 
# in for you, it arranges by decreasing length and selects 
# the name, length and dominion columns.


## url
## https://community.rstudio.com/t/dplyr-filter-issue-with-intervals-from-lubridate/9456



# Print monarchs
monarchs

# Create an interval for reign
monarchs <- monarchs %>%
  mutate(reign = from %--% to) 

# Find the length of reign, and arrange
monarchs %>%
  mutate(length = int_length(reign)) %>% 
  arrange(desc(length)) %>%
  select(name, length, dominion)
