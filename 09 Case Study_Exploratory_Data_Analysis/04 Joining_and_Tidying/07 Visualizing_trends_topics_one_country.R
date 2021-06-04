# Load the ggplot2 package.
# 
# Filter the by_country_year_topic dataset for just the United 
# States and save the result as US_by_country_year_topic.
# 
# Use this dataset to graph the percentage "yes" over time for 
# the United States, faceting by topic.

# Load the ggplot2 package
library(ggplot2)


# Filter by_country_year_topic for just the US
US_by_country_year_topic<- by_country_year_topic %>% 
  filter(country=="United States")



# Plot % yes over time for the US, faceting by topic

US_by_country_year_topic %>%
  ggplot(aes(x=year,y=percent_yes)) + 
  geom_line()+
  facet_wrap(~topic)
