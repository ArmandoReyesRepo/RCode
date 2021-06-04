library(readr)
library(dplyr)
library(ggplot2)


cars<- read.csv("cars04.csv")

# Construct a box plot of msrp.
# 
# Exclude the largest 3-5 outliers by filtering the rows to retain cars less
# than $100,000. Save this reduced dataset as cars_no_out.
# 
# Construct a similar box plot of msrp using this reduced dataset.
# Compare the two plots.

# Construct box plot of msrp
cars %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()

# Exclude outliers from data
cars_no_out <- cars %>%
  filter(msrp<100000)

# Construct box plot of msrp using the reduced dataset
cars_no_out %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()

