library(readr)  ###  library to use read_csv
library(tidyverse)  ## this is in order to use  --  glimpse

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Use read_csv() to import rversions.csv
releases <- read_csv("rversions.csv")

# Find the date of the most recent release by calling max() on the date 
# column in releases.
# 
# Find the rows in releases that have the most recent date, by specifying
# the comparison date == last_release_date in filter()
# 
# Print last_release to see which release this was.
# 
# Calculate how long it has been since the most recent release by subtracting 
# last_release_date from Sys.Date().

# Find the largest date
last_release_date <- max(releases$date)

# Filter row for last release
last_release <- filter(releases, date == last_release_date)

# Print last_release
last_release

# How long since last release?
Sys.Date() - last_release_date
