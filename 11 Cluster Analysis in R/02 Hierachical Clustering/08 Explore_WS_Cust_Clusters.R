library(dplyr)
library(ggplot2)
library(dendextend)
setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/11 Cluster Analysis in R")
dir()

customers_spend <- readRDS("ws_customers.rds" )


dist_customers <- dist(customers_spend)
hc_customers <- hclust(dist_customers)
clust_customers <- cutree(hc_customers, h = 15000)
segment_customers <- mutate(customers_spend, cluster = clust_customers)

# Count the number of customers that fall into each cluster
count(segment_customers, cluster)

# Color the dendrogram based on the height cutoff
dend_customers <- as.dendrogram(hc_customers)
dend_colored <- color_branches(dend_customers, h=15000)

# Plot the colored dendrogram

plot(dend_colored)

# Calculate the mean for each category
segment_customers %>% 
  group_by(cluster) %>% 
  summarise_all(list(mean))
