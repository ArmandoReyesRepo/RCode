library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

questions<- readRDS("questions.rds" )
answers <- readRDS("answers.rds")


# Count and sort the question id column in the answers table
answer_counts <- answers %>% count(question_id, sort = TRUE)

# Combine the answer_counts and questions tables
questions %>% left_join( answer_counts, by= c("id"="question_id")) %>%
  # Replace the NAs in the n column
  replace_na(list(n = 0))

test1<- questions %>% left_join( answer_counts, by= c("id"="question_id")) %>%
  # Replace the NAs in the n column
  replace_na(list(n = 0))

