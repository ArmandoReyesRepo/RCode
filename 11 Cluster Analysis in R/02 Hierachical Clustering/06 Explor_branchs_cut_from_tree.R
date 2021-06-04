library(dplyr)
library(ggplot2)
setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/11 Cluster Analysis in R")
dir()

lineup<- readRDS("lineup.rds")

dist_players <- dist(lineup, method = 'euclidean')
hc_players <- hclust(dist_players, method = "complete")

# Calculate the assignment vector with a h of 20
clusters_h20 <- cutree(hc_players,h=20)

# Create a new data frame storing these results
lineup_h20_complete <- mutate(lineup, cluster = clusters_h20)

# Calculate the assignment vector with a h of 40
clusters_h40 <- cutree(hc_players,h=40)

# Create a new data frame storing these results
lineup_h40_complete <- mutate(lineup, cluster = clusters_h40)

# Plot the positions of the players and color them using their cluster for height = 20
ggplot(lineup_h20_complete, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

# Plot the positions of the players and color them using their cluster for height = 40

ggplot(lineup_h40_complete, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()
