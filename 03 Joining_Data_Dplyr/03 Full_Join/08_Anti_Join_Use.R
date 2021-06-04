# Use filter() to extract version 1 from the inventories table; save the filter to 
# version_1_inventories.
# 
# Use anti_join to combine version_1_inventories with sets to determine which set is 
# missing a version 1.

# Use filter() to extract version 1 
version_1_inventories <- inventories %>% filter(version==1)


# Use anti_join() to find which set is missing a version 1
sets %>% anti_join( version_1_inventories, by="set_num" )
