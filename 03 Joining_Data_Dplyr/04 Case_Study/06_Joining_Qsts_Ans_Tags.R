library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

questions<- readRDS("questions.rds" )
answers <- readRDS("answers.rds")
question_tags<- readRDS("question_tags.rds")
tags<- readRDS("tags.rds")


# Count and sort the question id column in the answers table
answer_counts <- answers %>% count(question_id, sort = TRUE)

# Combine the answer_counts and questions tables
question_answer_counts<- questions %>% left_join( answer_counts, by= c("id"="question_id")) %>%
  # Replace the NAs in the n column
  replace_na(list(n = 0))

# Combine the question_tags table with question_answer_counts using an inner_join.
# Now, use another inner_join to add the tags table.

question_answer_counts %>%
  # Join the question_tags tables
  inner_join(question_tags, by=c("id"="question_id")) %>%
  # Join the tags table
  inner_join(tags,by=c("tag_id"="id"))


