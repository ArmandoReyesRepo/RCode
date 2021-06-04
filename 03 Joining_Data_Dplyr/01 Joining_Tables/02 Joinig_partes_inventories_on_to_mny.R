
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )




# Combine the parts and inventory_parts tables
parts %>% inner_join (inventory_parts,by ="part_num")

test1<- parts %>% inner_join (inventory_parts,by ="part_num")


