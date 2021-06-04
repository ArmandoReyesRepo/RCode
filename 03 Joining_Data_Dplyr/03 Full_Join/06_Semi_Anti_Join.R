

batmobile <- inventory_parts_joined %>%
  filter(set_num == "7784-1") %>%
  select(-set_num)

batwing <- inventory_parts_joined %>%
  filter(set_num == "70916-1") %>%
  select(-set_num)


# Filter the batwing set for parts that are also in the batmobile set
batwing %>% semi_join(batmobile, by="part_num")


# Filter the batwing set for parts that aren't in the batmobile set
batwing %>% anti_join(batmobile, by="part_num")
