

setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/DataSets")
std_and_poor500 <- readRDS("std_and_poor500_with_pe_2019-06-21.rds" )

View(std_and_poor500)


#####

library(dplyr)

# Look at the Standard and Poor 500 data
glimpse(std_and_poor500)

# Write a function to calculate the reciprocal
get_reciprocal <- function(x) {
  1/x
}


# Swap na.rm arg for ... in signature and body
calc_harmonic_mean <- function(x, ...) {
  x %>%
    get_reciprocal() %>%
    mean(...) %>%
    get_reciprocal()
}


std_and_poor500 %>% 
  # Group by sector
  group_by(sector) %>% 
  # Summarize, calculating harmonic mean of P/E ratio
  summarize(hmean_pe_ratio = calc_harmonic_mean(pe_ratio, na.rm=TRUE))