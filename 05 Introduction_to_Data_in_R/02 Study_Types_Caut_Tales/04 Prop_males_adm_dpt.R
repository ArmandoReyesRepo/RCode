setwd("C:/Users/arman/OneDrive/Desktop/2020/DataCamp/05 Introduction_to_Data_in_R")
getwd()
dir()

# Load packages
library(dplyr)


## to read https://stackoverflow.com/questions/7270544/how-to-see-data-from-rdata-file/7275974

ucb_admit<- get(load("ucb_admit.RData"))

# ucb_admit has been pre-loaded for you.
# 
# Assign ucb_admission_counts as the count() of ucb_admit by 
# department, gender, and admission status.


ucb_admission_counts <- ucb_admit %>%
  # Counts by department, then gender, then admission status
  count(Dept, Gender, Admit)

# See the result
ucb_admission_counts


# Group ucb_admission_counts by department then gender.
# 
# Add a new column, prop, which is the ratio of those admitted 
# or rejected by department and gender.
# 
# Filter the rows for males and for those who are admitted.


ucb_admission_counts  %>%
  # Group by department, then gender
  group_by(Dept, Gender) %>%
  # Create new variable
  mutate(prop = n/sum(n)) %>%
  # Filter for male and admitted
  filter(Gender=="Male", Admit=="Admitted")
