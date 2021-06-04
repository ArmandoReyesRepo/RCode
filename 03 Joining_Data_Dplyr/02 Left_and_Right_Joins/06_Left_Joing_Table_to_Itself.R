library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

themes<- readRDS("themes.rds" )

themes %>% 
  # Left join the themes table to its own children
  left_join(themes, by=c("id"="parent_id"), suffix=c("_parent","_child")) %>%
  # Filter for themes that have no child themes
  filter(is.na(name_child))
