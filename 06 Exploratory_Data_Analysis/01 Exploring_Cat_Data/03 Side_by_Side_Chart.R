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

# See levels for align in comics_filtered

levels(comics_filtered$align)


# Here you'll construct two side-by-side barcharts of the comics data.
# This shows that there can often be two or more options for presenting 
# the same data. Passing the argument position = "dodge" to geom_bar()
# says that you want a side-by-side (i.e. not stacked) barchart.


# Create side-by-side barchart of gender by alignment
ggplot(comics_filtered, aes(x = align, fill = gender)) + 
  geom_bar(position = "dodge")

# Create side-by-side barchart of alignment by gender
ggplot(comics_filtered, aes(x = gender, fill = align)) + 
  geom_bar(position="dodge") +
  theme(axis.text.x = element_text(angle = 90))
