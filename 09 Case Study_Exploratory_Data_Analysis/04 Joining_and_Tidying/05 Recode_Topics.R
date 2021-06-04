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


