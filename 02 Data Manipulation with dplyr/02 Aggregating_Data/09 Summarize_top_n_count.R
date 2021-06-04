counties_selected <- counties %>%
  select(state, metro, population)

# Find the total population for each combination of state and metro
counties_selected %>% group_by(state,metro) %>%
  summarize(total_pop=sum(population))

# Extract the most populated row for each state
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population))%>%
  top_n(1, total_pop)


# Count the states with more people in Metro or Nonmetro areas
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>%
  top_n(1, total_pop)  %>%
  ungroup() %>%
  count(metro)



