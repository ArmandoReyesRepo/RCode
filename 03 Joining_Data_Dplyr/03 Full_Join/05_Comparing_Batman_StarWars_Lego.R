setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

inventories<- readRDS("inventories.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )
colors <- readRDS("colors.rds")
parts <- readRDS("parts.rds")


##  continue from 1->4 exercises

parts_joined <- batman_parts %>%
  full_join(star_wars_parts, by = c("part_num", "color_id"), suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(n_batman = 0, n_star_wars = 0))


##  Comparing Batman and Star Wars Lego

test7<- parts_joined %>%
  # Sort the number of star wars pieces in descending order 
  arrange( desc(n_star_wars))  %>%
  
  # Join the colors table to the parts_joined table
  inner_join (colors, by=c("color_id"="id")) %>%
  
  # Join the parts table to the previous join 
  
  inner_join(parts, by="part_num", suffix= c("_color","_part"))




