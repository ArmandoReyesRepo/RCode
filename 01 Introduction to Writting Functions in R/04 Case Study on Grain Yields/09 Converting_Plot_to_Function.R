# Wrap this plotting code into a function
plot_yield_vs_year<- function(data)
{
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

# Test it on the wheat dataset

plot_yield_vs_year(wheat)
