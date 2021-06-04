library(readr)
library(dplyr)
library(ggplot2)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Use read_csv() to read in "akl_weather_hourly_2016.csv". readr knows 
# about the hms class, so if it comes across something that looks like a
# time it will use it.
# 
# In this case the time column has been parsed as a time without a date. 
# Take a look at the structure of the time column to verify it has the class hms.
# 
# hms objects print like times should. Take a look by examining the head of 
# the time column.
# 
# You can use hms objects in plots too. Create a plot with time on the x-axis, 
# temperature on the y-axis, with lines grouped by date.




# Import "akl_weather_hourly_2016.csv"
akl_hourly <- read_csv("akl_weather_hourly_2016.csv")
# Examine structure of time column
str(akl_hourly$time)

# Examine head of time column
head(akl_hourly$time)

# A plot using just time
ggplot(akl_hourly, aes(x = time, y = temperature)) +
  geom_line(aes(group = make_date(year, month, mday)), alpha = 0.2)
