library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()


parts<- readRDS("parts.rds" )
part_categories <- readRDS("part_categories.rds")

# Add the correct verb, table, and joining column
parts %>% inner_join(part_categories, by= c("part_cat_id" = "id") )

# Use the suffix argument to replace .x and .y suffixes
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix= c("_part","_category"))




