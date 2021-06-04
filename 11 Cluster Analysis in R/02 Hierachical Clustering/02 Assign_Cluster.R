library(dplyr)

setwd("~/Desktop/Cluster Analysis in R")

dir()

lineup<- readRDS("lineup.RDS")

# Calculate the Distance
dist_players <- dist(lineup, method="euclidean")

# Perform the hierarchical clustering using the complete linkage
hc_players <- hclust(dist_players, method="complete")

# Calculate the assignment vector with a k of 2
clusters_k2 <- cutree(hc_players,k=2)

# Create a new data frame storing these results
lineup_k2_complete <- mutate(lineup, cluster = clusters_k2)
