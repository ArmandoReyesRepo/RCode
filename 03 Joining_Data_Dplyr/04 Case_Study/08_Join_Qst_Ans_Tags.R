library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

questions<- readRDS("questions.rds" )
answers <- readRDS("answers.rds")
question_tags<- readRDS("question_tags.rds")
tags<- readRDS("tags.rds")

# 
# Use two inner joins to combine the question_tags and tags tables with the questions table.
# Now, use two inner joins to combine the question_tags and tags tables with the answers table.

# Inner join the question_tags and tags tables with the questions table
questions %>%
  inner_join(question_tags, by = c("id"="question_id")) %>%
  inner_join(tags, by = c("tag_id"="id"))

# Inner join the question_tags and tags tables with the answers table
answers %>% 
  inner_join(question_tags, by="question_id" ) %>%
  inner_join(tags, by=c("tag_id"="id"))

