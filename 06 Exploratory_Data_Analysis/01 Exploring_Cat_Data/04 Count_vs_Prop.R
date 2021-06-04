setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/06 Exploratory_Data_Analysis")
dir()

library(readr)
library(dplyr)
library(ggplot2)

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


tab<- table(comics$align, comics$gender) 

# Print tab
tab

# Remove align level
comics_filtered <- comics %>%
  filter(align != "Reformed Criminals") %>%
  droplevels()

# See the result
comics_filtered

# Plot of gender by align
ggplot(comics_filtered, aes(x = align, fill = gender)) +
  geom_bar()

# Plot proportion of gender, conditional on align
ggplot(comics_filtered, aes(x = align, fill = gender)) + 
  geom_bar(position = "fill") +
  ylab("proportion")
