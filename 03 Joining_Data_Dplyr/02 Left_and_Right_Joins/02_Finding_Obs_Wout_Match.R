library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

sets<- readRDS("sets.rds" )
inventories<- readRDS("inventories.rds" )



## Inventories version 1
inventory_version_1 <- inventories %>%
  filter(version == 1)

# Join versions to sets
sets %>%
  left_join(inventory_version_1, by="set_num") %>%
  # Filter for where version is na
  filter(is.na(version))

