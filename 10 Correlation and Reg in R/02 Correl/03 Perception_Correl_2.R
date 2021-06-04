# Draw the plot then calculate the correlation between OBP and SLG for all players in the mlbBat10 dataset.


# Run this and look at the plot
ggplot(data = mlbBat10, aes(x = OBP, y = SLG)) +
  geom_point()

# Correlation for all baseball players
mlbBat10 %>%
  summarize(N = n(), r = cor(OBP, SLG))


# Draw the plot then calculate the correlation between OBP and SLG for all players in the mlbBat10 dataset with at least 200 at-bats.


# Run this and look at the plot
mlbBat10 %>% 
  filter(AB > 200) %>%
  ggplot(aes(x = OBP, y = SLG)) + 
  geom_point()

# Correlation for all players with at least 200 ABs
mlbBat10 %>%
  filter(AB >= 200) %>%
  summarize(N = n(), r = cor(OBP, SLG))

# Draw the plot then calculate the correlation between height and weight for each sex in the bdims dataset.

# Run this and look at the plot
ggplot(data = bdims, aes(x = hgt, y = wgt, color = factor(sex))) +
  geom_point() 

# Correlation of body dimensions
bdims %>%
  group_by(sex) %>%
  summarize(N = n(), r = cor(hgt, wgt))

# Draw the plot then calculate the correlation between body weight and brain weight for all species of mammals. Alongside this computation, compute the correlation between the same two quantities after taking their natural logarithms.

# Run this and look at the plot
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + scale_x_log10() + scale_y_log10()

# Correlation among mammals, with and without log
mammals %>%
  summarize(N = n(), 
            r = cor(BodyWt, BrainWt), 
            r_log = cor(log(BodyWt), log(BrainWt)))


