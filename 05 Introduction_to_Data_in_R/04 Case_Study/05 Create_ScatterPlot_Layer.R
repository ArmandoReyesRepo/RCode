setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)

evals<- get(load("evals.RData"))

# Recode cls_students as cls_type
evals <- evals %>%
  mutate(
    cls_type = case_when(
      cls_students <=18                        ~ "small",
      cls_students>=19 & cls_students<=59      ~ "midsize",
      cls_students>=60                         ~ "large"
    )
  )

# Recreate your visualization from the previous exercise, but this time 
# coloring the points by class type.
# 
# How would you describe the relationship apparent in this visualization?


# Scatterplot of score vs. bty_avg colored by cls_type
ggplot(evals, aes(x=bty_avg, y=score, color=cls_type)) +
  geom_point()