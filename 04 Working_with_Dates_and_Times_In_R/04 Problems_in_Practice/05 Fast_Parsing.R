library(readr)
library(dplyr)
library(readr)

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


library(microbenchmark)
library(fasttime)


dates<- akl_hourly$datetime_string
# 
# We've loaded the datetimes from the Auckland hourly data as strings into 
# the vector dates.
# 
# Examine the structure of dates to verify it is a string and in the ISO 
# 8601 format.
# 
# Parse dates with fasttime and pipe to str() to verify fastPOSIXct parses 
# them correctly.
# 
# Now to compare timing, call microbenchmark where the first argument uses 
# ymd_hms() to parse dates and the second uses fastPOSIXct().



# Examine structure of dates
str(dates)

# Use fastPOSIXct() to parse dates
fastPOSIXct(dates) %>% str()

# Compare speed of fastPOSIXct() to ymd_hms()
microbenchmark(
  ymd_hms = ymd_hms(dates),
  fasttime = fastPOSIXct(dates),
  times = 20)

