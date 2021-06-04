# Find the year each name is most common 
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(number)) %>%
  ungroup() %>%
  mutate(fraction = number / year_total) %>%
  group_by(name) %>%
  top_n(1,fraction)


# Armand<- babynames %>% filter(name=="Armand")
# View(Armand)
