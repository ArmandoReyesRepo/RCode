library(openintro)  ##  for the use of email50

data("email50")

# Subset of emails with big numbers: email50_big
email50_big <- email50 %>%
  filter(number=="big")

# Glimpse the subset

glimpse(email50_big)
