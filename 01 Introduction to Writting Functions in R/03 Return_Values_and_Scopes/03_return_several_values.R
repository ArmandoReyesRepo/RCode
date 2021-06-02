setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/DataSets")
snake_river_visits <- readRDS("snake_river_visits.rds" )
View(snake_river_visits)


## 

# From previous step
run_poisson_regression <- function(data, formula) {
  glm(formula, data, family = poisson)
}

# Re-run the Poisson regression, using your function
model <- snake_river_visits %>%
  run_poisson_regression(n_visits ~ gender + income + travel)




# Look at the structure of model (it's a mess!)
str(model)

# Use broom tools to get a list of 3 data frames
library(broom)

list(
  # Get model-level values
  model = glance(model),
  # Get coefficient-level values
  coefficients = tidy(model),
  # Get observation-level values
  observations = augment(model)
)



# Wrap this code into a function, groom_model
groom_model<- function(model)
{
  list(
    model = glance(model),
    coefficients = tidy(model),
    observations = augment(model)
  )
}


## Using zeallot fot multiassignment operator

library(zeallot)

c(mdl,cff,obs)%<-% groom_model(model)

mdl; cff; obs


