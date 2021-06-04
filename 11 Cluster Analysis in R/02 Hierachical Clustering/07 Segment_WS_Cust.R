library(dplyr)
library(ggplot2)
setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/11 Cluster Analysis in R")
dir()

customers_spend <- readRDS("ws_customers.rds" )


# Calculate Euclidean distance between customers
dist_customers <- dist(customers_spend, method="euclidean")

# Generate a complete linkage analysis 
hc_customers <- hclust(dist_customers, method="complete")

# Plot the dendrogram

plot(hc_customers)

# Create a cluster assignment vector at h = 15000
clust_customers <- cutree(hc_customers,h=15000)

# Generate the segmented customers data frame
segment_customers <- mutate(customers_spend, cluster = clust_customers)

