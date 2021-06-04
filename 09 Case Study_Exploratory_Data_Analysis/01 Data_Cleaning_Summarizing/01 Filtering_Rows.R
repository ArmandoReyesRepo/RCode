setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/09 Case Study_Exploratory_Data_Analysis")
dir()

# Load the dplyr package.

# Print the votes table.

# Filter out rows where the vote recorded is "not present"
# or "not a member", leaving cases where it is "yes", 
# "abstain", or "no".


# Load the dplyr package
library(dplyr)

# Print the votes dataset
votes<- readRDS("votes.RDS") 

# Filter for votes that are "yes", "abstain", or "no"
votes_1_3<- votes %>% filter (vote<=3)
