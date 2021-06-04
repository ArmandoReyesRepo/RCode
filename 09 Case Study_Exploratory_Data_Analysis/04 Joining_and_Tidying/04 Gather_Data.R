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


