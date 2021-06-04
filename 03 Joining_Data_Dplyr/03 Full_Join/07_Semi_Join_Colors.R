library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

inventory_parts<- readRDS("inventory_parts.rds" )
colors <- readRDS("colors.rds")

# Use inventory_parts to find colors included in at least one set
colors %>% semi_join (inventory_parts, by=c("id"="color_id"))