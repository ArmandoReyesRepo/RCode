setwd("~/Desktop/03 SLR")
dir()


Galton_men<- read.csv("Galton_men.csv")


# Height of children vs. height of father
ggplot(data = Galton_men, aes(x = father, y = height)) +
  geom_point() + 
  geom_abline(slope = 1, intercept = 0) + 
  geom_smooth(method = "lm", se = FALSE)


Galton_women<- read.csv("Galton_women.csv")

# Height of children vs. height of mother

ggplot(data = Galton_women, aes(x = mother, y = height)) +
  geom_point() + 
  geom_abline(slope = 1, intercept = 0) + 
  geom_smooth(method = "lm", se = FALSE)