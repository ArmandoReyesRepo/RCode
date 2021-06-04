library(openintro)
library(ggplot2)

data("mammals")

ggplot()


# Using the mammals dataset, create a
# scatterplot illustrating how the brain
# weight of a mammal varies as a function of 
# its body weight.



# Mammals scatterplot


ggplot( mammals,  aes(x=BodyWt, y=BrainWt)) +
geom_point()


# Using the mlbBat10 dataset, create a scatterplot illustrating how the slugging percentage (SLG) of a player varies as a function of his on-base percentage (OBP).

ggplot(mlbBat10, aes(x=OBP, y=SLG)) + geom_point()


# Using the bdims dataset, create a scatterplot illustrating how a person's weight varies as a function of their height. Use color to separate by sex, which you'll need to coerce to a factor with factor().
# Body dimensions scatterplot

ggplot(bdims, aes(x=hgt,y=wgt, color=factor(sex))) +
  geom_point()

# Using the smoking dataset, create a scatterplot illustrating how the amount that a person smokes on weekdays varies as a function of their age.

# Smoking scatterplot

ggplot(smoking, aes(x=age, y=amtWeekdays)) + geom_point()


