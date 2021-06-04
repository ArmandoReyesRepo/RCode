# Load the ggplot2 package.
# 
# Filter the votes_joined dataset for only votes by the United States 
# relating to colonialism, then summarize() the percentage of votes that 
# are "yes" within each year. Name the resulting column percent_yes and 
# save the entire data frame as US_co_by_year.
# 
# Add a geom_line() layer to your ggplot() call to create a line graph of
# the percentage of "yes" votes on colonialism (percent_yes) cast by the 
# US over time.


# Load the ggplot2 package
library(ggplot2)

# Filter, then summarize by year: US_co_by_year

US_co_by_year<- votes_joined %>%
  filter (country=="United States", co==1) %>%
  group_by(year) %>%
  summarize(percent_yes= mean (vote==1))


# Graph the % of "yes" votes over time
ggplot(US_co_by_year, aes(x=year,y=percent_yes)) +
  geom_line()
