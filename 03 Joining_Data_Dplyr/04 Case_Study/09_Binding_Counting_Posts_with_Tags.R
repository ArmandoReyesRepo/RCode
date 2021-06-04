library(dplyr)
library(tidyr)  ## this is to use replace_na
library(lubridate)  ##  used for year function in mutate

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



# Combine the questions_with_tags and answers_with_tags 
# tables into posts_with_tags.
# 
# Add a year column to the posts_with_tags table, then 
# aggregate by type, year, and tag_name.

# Combine the two tables into posts_with_tags
posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))


# Add a year column, then aggregate by type, year, and tag_name
posts_with_tags %>% mutate (year = year(creation_date)) %>%
  count(type, year, tag_name)
