setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)


## to read https://stackoverflow.com/questions/7270544/how-to-see-data-from-rdata-file/7275974

ucb_admit<- get(load("ucb_admit.RData"))

# Count number of male and female applicants admitted
ucb_admission_counts<- ucb_admit %>%
  count(Gender, Admit)

# 
# The table of counts of gender and admission status you developed earlier is 
# available as ucb_admission_counts.
# 
# Group the data by gender.
# 
# Create the new variable described above, prop, the proportion of males and 
# females admitted.
# 
# Filter the data for those who are admitted so that the resulting data frame 
# only contains proportions of males and females who are admitted.
# 
# Which gender has a higher admission rate, male or female?


ucb_admission_counts %>%
  # Group by gender
  group_by(Gender) %>%
  # Create new variable
  mutate(prop = n / sum(n)) %>%
  # Filter for admitted
  filter(Admit == "Admitted")

