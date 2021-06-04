library(dplyr)
library(tidyr)  ## this is to use replace_na

setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/03 Joining_Data_Dplyr")
dir()

questions<- readRDS("questions.rds" )
answers <- readRDS("answers.rds")


# Use an inner join to combine the questions and answers tables using the suffixes 
# "_question" and "_answer", respectively.
# 
# Subtract creation_date_question from creation_date_answer within the as.integer() 
# function to create the gap column.



questions %>%
  # Inner join questions and answers with proper suffixes
  inner_join(answers, by=c("id"="question_id"),suffix= c("_question","_answer")) %>%
  
  # Subtract creation_date_question from creation_date_answer to create gap
  mutate(gap = as.integer(creation_date_answer - creation_date_question))
