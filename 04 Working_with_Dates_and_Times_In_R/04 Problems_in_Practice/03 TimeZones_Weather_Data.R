library(readr)
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Import "akl_weather_hourly_2016.csv"
akl_hourly_raw <- read_csv("akl_weather_hourly_2016.csv")

# Print akl_hourly_raw
akl_hourly_raw

# Use make_date() to combine year, month and mday 
akl_hourly  <- akl_hourly_raw  %>% 
  mutate(date = make_date(year = year, month = month, day = mday))

# Parse datetime_string 
akl_hourly <- akl_hourly  %>% 
  mutate(
    datetime_string = paste(date, time, sep = "T"),
    datetime = ymd_hms(datetime_string)
  )

glimpse(akl_hourly)


# The data is available in the akl_hourly data frame.
# 
# What timezone are datetime and date_utc currently in? Examine 
# the head of the datetime and date_utc columns to find out.
# 
# Fix datetime to have the timezone for "Pacific/Auckland".
# 
# Reexamine the head of the datetime column to check the times have the 
# same clocktime, but are now in the right timezone.
# 
# Now tabulate up the difference between the datetime and date_utc columns.
# It should be zero if our hypothesis was correct.

# Examine datetime and date_utc columns
head(akl_hourly$datetime)
head(akl_hourly$date_utc)

# Force datetime to Pacific/Auckland
akl_hourly <- akl_hourly %>%
  mutate(
    datetime = force_tz(datetime, tzone = "Pacific/Auckland"))

# Reexamine datetime
head(akl_hourly$datetime)

# Are datetime and date_utc the same moments
table(akl_hourly$datetime - akl_hourly$date_utc)


