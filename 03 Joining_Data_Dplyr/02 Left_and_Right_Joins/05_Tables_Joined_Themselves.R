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


themes %>% 
  # Inner join the themes table
  inner_join(themes, by=c("id"="parent_id"), suffix= c("_parent","_child")) %>%
  # Filter for the "Harry Potter" parent name 
  filter(name_parent=="Harry Potter")

# Join themes to itself again to find the grandchild relationships
test7<-themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  inner_join(themes, by = c("id_child"="parent_id"), suffix= c("_parent","_grandchild")  )



