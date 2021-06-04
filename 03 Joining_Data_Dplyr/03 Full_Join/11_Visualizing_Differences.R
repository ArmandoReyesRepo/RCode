library(ggplot2)
library(forcats)


colors_joined <- batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
  inner_join(colors, by = c("color_id" = "id")) %>%
  mutate(difference = percent_batman - percent_star_wars,
         total = total_batman + total_star_wars) %>%
  filter(total >= 200) %>%
  mutate(name = fct_reorder(name, difference)) 

#########

df <- tibble::tribble(
  ~color,     ~a, ~b,
  "blue",      1,  2,
  "green",     6,  2,
  "purple",    3,  3,
  "red",       2,  3,
  "yellow",    5,  1
)

df$color <- factor(df$color)
fct_reorder(df$color, df$a, min)

##

color_palette <- setNames(colors_joined$rgb, colors_joined$name)

# Create a bar plot using colors_joined and the name and difference columns
ggplot(colors_joined, aes(name, difference, fill = name)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = color_palette, guide = FALSE) +
  labs(y = "Difference: Batman - Star Wars")


