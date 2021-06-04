library(dplyr)

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

parts<- readRDS("parts.rds" )
inventory_parts<- readRDS("inventory_parts.rds" )
sets<- readRDS("sets.rds" )
themes<- readRDS("themes.rds" )
inventories<- readRDS("inventories.rds" )
colors<- readRDS("colors.rds" )

test4<- sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color"))


test5<- select(test4,"set_num", "part_num", "color_id", "quantity")

millennium_falcon <- test5 %>%
  filter(set_num == "7965-1")


star_destroyer <- test5 %>%
  filter(set_num == "75190-1")



# Combine the star_destroyer and millennium_falcon tables
test6<- millennium_falcon %>% left_join(star_destroyer, 
                                by = c("part_num","color_id"), 
                                suffix = c("_falcon", "_star_destroyer"))

# Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
  left_join(star_destroyer_colors, by="color_id", suffix=c("_falcon","_star_destroyer"))







