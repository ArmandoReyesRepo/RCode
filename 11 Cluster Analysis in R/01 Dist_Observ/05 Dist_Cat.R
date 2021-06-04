library(dummies)

job_survey<- read.csv("job_survey.csv")

# Dummify the Survey Data
dummy_survey <- dummy.data.frame(job_survey)

# Calculate the Distance
dist_survey <- dist(dummy_survey, method="binary")

# Print the Original Data
job_survey

# Print the Distance Matrix
dist_survey
