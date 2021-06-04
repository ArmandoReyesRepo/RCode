# Load the tidyr package.
# 
# Gather the six topic columns in votes_joined into one column 
# called topic (containing one of me, nu, etc.) and a column called 
# has_topic (containing 0 or 1). Print the result without saving it.
# 
# You don't actually care about the cases where has_topic is 0. Perform
# the gather() operation again, but this time also filter for only
# the rows where the topic in topic describes the vote. Save the result
# as votes_gathered.




votes_joined %>%
  filter (country=="United States", co==1) %>%
  group_by(year) %>%
  summarize(percent_yes= mean (vote==1))


# Load the tidyr package
library(tidyr)


# Gather the six me/nu/di/hr/co/ec columns

votes_joined %>%
  gather(topic, has_topic, me:ec)



# Perform gather again, then filter

votes_gathered<- votes_joined %>%
  gather(topic, has_topic, me:ec) %>%
  filter(has_topic ==1)

# Recoding the topics
# There's one more step of data cleaning to make this more interpretable.
# Right now, topics are represented by two-letter codes:
# 
# me: Palestinian conflict
# nu: Nuclear weapons and nuclear material
# di: Arms control and disarmament
# hr: Human rights
# co: Colonialism
# ec: Economic development
# So that you can interpret the data more easily, recode the data to replace these codes with their full name. You can do that with dplyr's recode() function, which replaces values with ones you specify:
#   
# example <- c("apple", "banana", "apple", "orange")
# recode(example,
#        apple = "plum",
#        banana = "grape")

# Instructions
# 
# Use the recode() function from dplyr in a mutate() to replace each 
# two-letter code in the votes_gathered data frame with the 
# corresponding full name. Save this as votes_tidied.

# Replace the two-letter codes in topic: votes_tidied
votes_tidied <- votes_gathered %>%
  mutate(topic = recode(topic,
                        me = "Palestinian conflict",
                        nu = "Nuclear weapons and nuclear material",
                        di = "Arms control and disarmament",
                        hr = "Human rights",
                        co = "Colonialism",
                        ec = "Economic development"))


# Print the votes_tidied dataset to the console.
# 
# In a single summarize() call, compute both the total number of votes 
# (total) and the percentage of "yes" votes (percent_yes) for each 
# combination of country, year, and topic. Save this as 
# by_country_year_topic. Make sure that you ungroup() after summarizing.
# 
# Print the by_country_year_topic dataset to the console.

# Print votes_tidied

votes_tidied


# Summarize the percentage "yes" per country-year-topic
by_country_year_topic<-votes_tidied %>%
  group_by(country, year, topic) %>%
  summarize(total=n(), percent_yes= sum(vote==1)/total) %>%
  ungroup()


# Print by_country_year_topic

by_country_year_topic

# Load the purrr, tidyr, and broom packages.
# 
# Print the by_country_year_topic dataset to the console.
# 
# Fit a linear model within each country and topic in this 
# dataset, saving the result as country_topic_coefficients. 
# You can use the above code as a starting point.
# 
# Print the country_topic_coefficients dataset to the console.


# Load purrr, tidyr, and broom
library(purrr)
library(tidyr)
library(broom)

# Print by_country_year_topic
by_country_year_topic


# Fit model on the by_country_year_topic dataset

country_topic_coefficients <- by_country_year_topic %>%
  nest(-country,-topic) %>%
  mutate(model = map(data, ~ lm(percent_yes ~ year, data = .)),
         tidied = map(model, tidy)) %>%
  unnest(tidied)



# Print country_topic_coefficients

country_topic_coefficients
