setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/06 Exploratory_Data_Analysis")
dir()

library(readr)
library(dplyr)

comics<- read.csv("comics.csv")
View(comics)
glimpse(comics)

head(comics)

str(comics)

# Print the first rows of the data
head(comics)


# Check levels of align
levels(comics$align)

# Check the levels of gender

levels(comics$gender)


# Create a 2-way contingency table

table(comics$align, comics$gender)
