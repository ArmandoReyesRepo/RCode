
# Filter the country_topic_coefficients data to include only the 
# slope term.
# 
# Add a p.adjusted column containing adjusted p-values 
# (using the p.adjust() function).
# 
# Filter for only adjusted p-values less than .05.
# 
# Save the result as country_topic_filtered.

# Create country_topic_filtered


country_topic_filtered<- country_topic_coefficients %>% filter(term=="year") %>%
  mutate( p.adjusted = p.adjust(p.value)) %>%
  filter(p.adjusted < 0.05)


t<- country_topic_filtered %>% arrange(desc(estimate))
