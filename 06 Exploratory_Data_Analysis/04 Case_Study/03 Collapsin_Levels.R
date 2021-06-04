library(openintro)  ##  email dataset
library(dplyr)  ## glimpse
library(ggplot2)  ## in order to do graphics


email<- email %>% mutate( spam1= ifelse(spam==0,"not-spam","spam"))



# Starting with email, form a continuous chain that links 
# together the following tasks:
#   
# Create a new variable called has_image that is TRUE where 
# the number of images is greater than zero and FALSE otherwise.
# 
# Create an appropriate plot with email to visualize the 
# relationship between has_image and spam.



# Create plot of proportion of spam by image
email %>%
  mutate(has_image = image>0) %>%
  ggplot(aes(x = has_image, fill = spam1)) +
  geom_bar(position = "fill")

