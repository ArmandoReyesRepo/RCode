
setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/DataSets")
std_and_poor500 <- readRDS("std_and_poor500_with_pe_2019-06-21.rds" )

View(std_and_poor500)


#####

library(dplyr)
library(assertive)

# Look at the Standard and Poor 500 data
glimpse(std_and_poor500)

# Write a function to calculate the reciprocal
get_reciprocal <- function(x) {
  1/x
}

  calc_harmonic_mean <- function(x, na.rm = FALSE) {
    # Assert that x is numeric
    assert_is_numeric(x)
    x %>%
      get_reciprocal() %>%
      mean(na.rm = na.rm) %>%
      get_reciprocal()
  }
  
  # See what happens when you pass it strings
  calc_harmonic_mean(std_and_poor500$sector)
