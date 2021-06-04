library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()


questions<- readRDS("questions.rds" )
question_tags <- readRDS("question_tags.rds")
tags<- readRDS("tags.rds")

# Join the questions and question_tags tables
questions %>% left_join(question_tags, by=c("id"="question_id"))

# Join in the tags table
questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by= c("tag_id"="id"))

# Replace the NAs in the tag_name column
questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by = c("tag_id" = "id")) %>%
  replace_na(list(tag_name="only-r"))

