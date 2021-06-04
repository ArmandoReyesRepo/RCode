y2001 <- ymd("2001-01-01") %--% ymd("2001-12-31")

ymd("2001-03-30") %within% y2001
## will give TRUE

ymd("2002-03-30") %within% y2001
## will give FALSE

## url
## https://community.rstudio.com/t/dplyr-filter-issue-with-intervals-from-lubridate/9456


source("https://goo.gl/SSvqZF")

# We've put halleys a data set describing appearances of 
# Halley's comet in your workspace.
# 
# Print halleys to examine the date. perihelion_date is 
# the date the Comet is closest to the Sun. start_date 
# and end_date are the range of dates the comet is visible 
# from Earth.
# 
# Create a new column, visible, that is an interval from 
# start_date to end_date.
# 
# You'll work with one appearance, extract the 14th row of 
# halleys.
# 
# Filter monarchs to those where halleys_1066$perihelion_date
# is within reign.
# 
# Filter monarchs to those where halleys_1066$visible overlaps 
# reign.

# Create an interval for reign
monarchs <- monarchs %>%
  mutate(reign = from %--% to) 

# Print halleys
halleys

# New column for interval from start to end date
halleys <- halleys %>% 
  mutate(visible = start_date %--% end_date )

# The visitation of 1066
halleys_1066 <- halleys[14, ] 

# Monarchs in power on perihelion date
monarchs %>% 
  filter(halleys_1066$perihelion_date %within% reign) %>%
  select(name, from, to, dominion)

# Monarchs whose reign overlaps visible time
monarchs %>% 
  filter(int_overlaps(halleys_1066$visible,reign)) %>%
  select(name, from, to, dominion)




