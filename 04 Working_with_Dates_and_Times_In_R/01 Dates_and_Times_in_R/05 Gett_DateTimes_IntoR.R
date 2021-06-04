library(readr)  ###  library to use read_csv
library(tidyverse)  ## this is in order to use  --  glimpse


setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Use read_csv() to import rversions.csv
releases <- read_csv("rversions.csv")

# Use as.POSIXct() and an appropriate string to input the datetime corresponding 
# to Oct 1st 2010 at 12:12:00.
# 
# Enter the same datetime again, but now specify the timezone as 
# "America/Los_Angeles".
# 
# Use read_csv() to read in rversions.csv again.
# 
# Examine the structure of the datetime column to verify read_csv() has 
# correctly interpreted it as a datetime.

# Use as.POSIXct to enter the datetime 
as.POSIXct("2010-10-01 12:12:00")

# Use as.POSIXct again but set the timezone to `"America/Los_Angeles"`
as.POSIXct("2010-10-01 12:12:00", tz = "America/Los_Angeles")

# Use read_csv to import rversions.csv
releases <- read_csv("rversions.csv")

# Examine structure of datetime column
str(releases$datetime)


