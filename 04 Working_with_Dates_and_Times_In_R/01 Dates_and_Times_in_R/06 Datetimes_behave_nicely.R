library(readr)  ###  library to use read_csv
library(tidyverse)  ## this is in order to use  --  glimpse

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Use read_csv() to import cran-logs_2015-04-17.csv.
# 
# Print logs to see the information we have on each download.
# 
# Store the R 3.2.0 release time as a POSIXct object.
# 
# Find out when the first request for 3.2.0 was made by filtering 
# for values in the datetime column that are greater than release_time.
# 
# Finally see how downloads increase by creating histograms of download 
# time for 3.2.0 and the previous version 3.1.3. We've provided most of 
# the code, you just need to specify the x aesthetic to be the datetime 
# column.


# Import "cran-logs_2015-04-17.csv" with read_csv()
logs<- read_csv("cran-logs_2015-04-17.csv")

# Print logs
logs

# Store the release time as a POSIXct object
release_time <- as.POSIXct("2015-04-16 07:13:33", tz = "UTC")

# When is the first download of 3.2.0?
logs %>% 
  filter(datetime>release_time,
         r_version == "3.2.0")

# Examine histograms of downloads by version
ggplot(logs, aes(x = datetime)) +
  geom_histogram() +
  geom_vline(aes(xintercept = as.numeric(release_time)))+
  facet_wrap(~ r_version, ncol = 1)
