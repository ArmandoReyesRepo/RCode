library(dplyr)





setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/DataSets")
snake_river_visits <- readRDS("snake_river_visits.rds" )
View(snake_river_visits)

# Run a generalized linear regression 
glm(
  # Model no. of visits vs. gender, income, travel
  n_visits ~ gender + income + travel, 
  # Use the snake_river_visits dataset
  data = snake_river_visits, 
  # Make it a Poisson regression
  family = poisson
)

# From previous step
run_poisson_regression <- function(data, formula) {
  glm(formula, data, family = poisson)
}

# Re-run the Poisson regression, using your function
model <- snake_river_visits %>%
  run_poisson_regression(n_visits ~ gender + income + travel)



setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/01 How to Write a Function")
snake_river_explanatory<-read.csv("snake_river_expl.csv")

## Change name of first column

names(snake_river_explanatory) [1]<-"gender"


# Run this to see the predictions
snake_river_explanatory %>%
  mutate(predicted_n_visits = predict(model, ., type = "response"))%>%
  arrange(desc(predicted_n_visits))




