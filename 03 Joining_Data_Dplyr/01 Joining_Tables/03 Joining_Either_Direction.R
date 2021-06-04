
library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()


parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )


# Combine the parts and inventory_parts tables

test2<- inventory_parts %>% inner_join (parts, by="part_num")
