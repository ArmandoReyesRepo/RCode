
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()


parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )
inventories<- readRDS("inventories.rds" )
colors<- readRDS("colors.rds" )


sets %>%
  # Add inventories using an inner join 
  inner_join(inventories, by="set_num") %>%
  # Add inventory_parts using an inner join 
  inner_join(inventory_parts, by= c("id"="inventory_id" ))

test3<- sets %>%
  # Add inventories using an inner join 
  inner_join(inventories, by="set_num") %>%
  # Add inventory_parts using an inner join 
  inner_join(inventory_parts, by= c("id"="inventory_id" ))

