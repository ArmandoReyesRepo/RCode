setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

getwd()

library(readr)
library(anytime)

# Use read_csv() to read in the CSV file rversions.csv as releases.
# 
# Use str() to examine the structure of the date column. Notice 
# it's already a Date object.
# 
# We've loaded anytime and created an object called sep_10_2009. Use 
# the anytime() function to parse sep_10_2009.



# Use read_csv() to import rversions.csv
releases <- read_csv("rversions.csv")

# Examine the structure of the date column
str(releases$date)


# Various ways of writing Sep 10 2009
sep_10_2009 <- c("September 10 2009", "2009-09-10", "10 Sep 2009", "09-10-2009")

# Use anytime() to parse sep_10_2009
anytime(sep_10_2009)

