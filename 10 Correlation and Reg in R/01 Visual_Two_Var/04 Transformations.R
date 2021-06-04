library(openintro)
library(ggplot2)

# Use coord_trans() to create a scatterplot showing how a mammal's brain weight varies as a function of its body weight, where both the x and y axes are on a "log10" scale.

# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + 
  coord_trans(x = "log10", y = "log10")


# Use scale_x_log10() and scale_y_log10() to achieve the same effect but with different axis labels and grid lines.

# Scatterplot with scale_x_log10() and scale_y_log10()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() +
  scale_x_log10() + 
  scale_y_log10()




