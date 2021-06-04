library(ggplot2)
library(readr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/04 Working_with_Dates_and_Times_In_R")
dir()

# Use read_csv() to import rversions.csv
releases <- read_csv("rversions.csv")

# Use wday() to tabulate release by day of the week
wday(releases$datetime) %>% table()

# Add label = TRUE to make table more readable
wday(releases$datetime, label=TRUE) %>% table()

# Create column wday to hold labelled week days
releases$wday <- wday(releases$datetime, label=TRUE)

# Plot barchart of weekday by type of release
ggplot(releases, aes(wday)) +
  geom_bar() +
  facet_wrap(~ type, ncol = 1, scale = "free_y")

