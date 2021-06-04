library(dplyr)


trees<- read.csv("trees.csv")

trees<- trees %>% mutate(Height2 = Height*12)


three_trees <- trees[c(1,2,4),c(1,4)]
three_trees

# Calculate distance for three_trees 
dist_trees <- dist(three_trees)

# Scale three trees & calculate the distance  
scaled_three_trees <- scale(three_trees)
dist_scaled_trees <- dist(scaled_three_trees)

# Output the results of both Matrices
print('Without Scaling')
dist_trees

print('With Scaling')
dist_scaled_trees
