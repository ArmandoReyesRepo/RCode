library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )
inventories<- readRDS("inventories.rds" )
colors<- readRDS("colors.rds" )
part_categories<- readRDS("part_categories.rds" )


parts %>%
  # Count the part_cat_id
  count(part_cat_id, sort=TRUE) %>%
  
  # Right join part_categories
  right_join(part_categories, by=c("part_cat_id"="id" ))

## filter for where the column n is NA.
parts %>%
  count(part_cat_id) %>%
  right_join(part_categories, by = c("part_cat_id" = "id")) %>%
  # Filter for NA
  filter( is.na(n))


## cleaning up your counts
parts %>%
  count(part_cat_id) %>%
  right_join(part_categories, by = c("part_cat_id" = "id")) %>%
  # Use replace_na to replace missing values in the n column
  replace_na(list(n=0))

