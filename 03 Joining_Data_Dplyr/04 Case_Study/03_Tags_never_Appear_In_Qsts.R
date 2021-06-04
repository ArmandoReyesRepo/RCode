# Use a join to determine which tags never appear on an R question.


# Using a join, filter for tags that are never on an R question
tags %>% anti_join(question_tags, by=c("id"="tag_id"))