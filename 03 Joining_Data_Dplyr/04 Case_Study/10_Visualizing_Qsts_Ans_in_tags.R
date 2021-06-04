library(dplyr)
library(tidyr)  ## this is to use replace_na
library(lubridate)  ##  used for year function in mutate
library(ggplot2)  ## this is used to do the plot

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

questions<- readRDS("questions.rds" )
answers <- readRDS("answers.rds")
question_tags<- readRDS("question_tags.rds")
tags<- readRDS("tags.rds")


questions_with_tags <- questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

answers_with_tags <- answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))



# Combine the two tables into posts_with_tags
posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))


by_type_year_tag <- posts_with_tags %>%
  mutate(year = year(creation_date)) %>%
  count(type, year, tag_name)


# Filter the by_type_year_tag table for the 
# dplyr and ggplot2 tags.
# 
# Create a line plot with that filtered 
# table that plots the frequency (n) over time,
# colored by question/answer and faceted by tag.

# Filter for the dplyr and ggplot2 tag names 
by_type_year_tag_filtered <- by_type_year_tag %>%
  filter(tag_name %in% c("dplyr","ggplot2"))

# Create a line plot faceted by the tag name 
ggplot(by_type_year_tag_filtered, aes(year, n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name)


