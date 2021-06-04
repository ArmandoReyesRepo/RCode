questions_with_tags<- questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by = c("tag_id" = "id")) %>%
  replace_na(list(tag_name="only-r"))


# Aggregate by the tag_name.
# 
# Summarize to get the total number of questions, num_questions, as well as the 
# mean score for each question, score.
# 
# Arrange num_questions in descending order to sort the answers by the most 
# asked questions.


questions_with_tags %>%
  # Group by tag_name
  group_by(tag_name) %>%
  
  # Get mean score and num_questions
  summarize(score = mean(score),
            num_questions = n()) %>%
  # Sort num_questions in descending order
  arrange(desc(num_questions))
