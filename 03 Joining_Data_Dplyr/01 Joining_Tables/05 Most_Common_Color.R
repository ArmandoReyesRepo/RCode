library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )
inventories<- readRDS("inventories.rds" )
colors<- readRDS("colors.rds" )



# Add an inner join for the colors table
test3<-sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by =c("color_id"="id"), suffix=c("_set","_color")  )

# Count the number of colors and sort
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color")) %>%
  count(name_color, sort=TRUE) 
