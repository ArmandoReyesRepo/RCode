names_normalized<- babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  # Ungroup the table 
  ungroup()%>%
  # Add the fraction_max column containing the number by the name maximum 
  mutate(fraction_max=number/name_max)

# Filter for the names Steven, Thomas, and Matthew
names_filtered <- names_normalized %>%
  filter( name %in% c("Steven", "Thomas","Matthew"))


# Visualize these names over time

ggplot( names_filtered, aes(x=year, y= fraction_max, color=name)) + geom_line()

