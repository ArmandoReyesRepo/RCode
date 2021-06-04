library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

inventories<- readRDS("inventories.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )


inventory_parts_themes <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version) %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman_colors <- inventory_parts_themes %>%
  # Filter the inventory_parts_themes table for the Batman theme
  filter(name_theme=="Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  # Add a percent column of the total divided by the sum of the total 
  mutate(percent= total/sum(total))

# Filter and aggregate the Star Wars set data; add a percent column
star_wars_colors <- inventory_parts_themes %>%
  filter( name_theme=="Star Wars")  %>%
  group_by(color_id)  %>%
  summarize(total=sum(quantity))  %>%
  mutate( percent = total/sum(total))


