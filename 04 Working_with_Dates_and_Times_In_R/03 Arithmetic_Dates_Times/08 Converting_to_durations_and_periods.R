library(dplyr)

## Halley
source("https://goo.gl/2aojPM")

# Print monarchs
monarchs

# Create an interval for reign
monarchs <- monarchs %>%
  mutate(reign = from %--% to) 

# Create new columns for duration and period that 
# convert reign into the appropriate object.
# 
# Examine the name, duration and period columns.



# New columns for duration and period
monarchs <- monarchs %>%
  mutate(
    duration = as.duration(reign),
    period = as.period(reign) )

# Examine results    
monarchs %>%
  select(name,duration,period)