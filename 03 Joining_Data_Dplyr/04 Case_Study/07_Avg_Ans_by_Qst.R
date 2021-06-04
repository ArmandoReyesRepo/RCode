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


tagged_answers<- question_answer_counts %>%
  # Join the question_tags tables
  inner_join(question_tags, by=c("id"="question_id")) %>%
  # Join the tags table
  inner_join(tags,by=c("tag_id"="id"))



# Aggregate the tagged_answers table by tag_name.

# Summarize tagged_answers to get the count of questions and the average_answers.

# Sort the resulting questions column in descending order.


tagged_answers %>%
  # Aggregate by tag_name
  group_by(tag_name) %>%
  
  # Summarize questions and average_answers
  summarize(questions = n(),
            average_answers = mean(n)) %>%
  # Sort the questions in descending order
  arrange(desc(questions))



