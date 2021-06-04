

batman_colors <- inventory_parts_themes %>%
  # Filter the inventory_parts_themes table for the Batman theme
  filter(name_theme=="Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  # Add a percent column of the total divided by the sum of the total 
  mutate(percent= total/sum(total))

# Filter and aggregate the Star Wars set data; add a percent column
star_wars_colors <- inventory_parts_themes %>%
  filter( name_theme=="Star Wars")  %>%
  group_by(color_id)  %>%
  summarize(total=sum(quantity))  %>%
  mutate( percent = total/sum(total))


colors<- readRDS("colors.rds" )

# Join the batman_colors and star_wars_colors tables; 
# be sure to include all observations from both tables.
# 
# Replace the NAs in the total_batman and total_star_wars
# columns.


batman_colors %>%
  # Join the Batman and Star Wars colors
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  # Replace NAs in the total_batman and total_star_wars columns
  replace_na(list(total_batman=0,total_star_wars=0 )) %>%
  inner_join(colors, by = c("color_id" = "id")) 


# Add a difference column that calculates the difference between percent_batman 
# and percent_star_wars, and a total column, which is the sum of total_batman 
# and total_star_wars.
# 
# Add a filter to select observations where total is at least 200.

test_x<- batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
  inner_join(colors, by = c("color_id" = "id")) %>%
  # Create the difference and total columns
  mutate(difference = percent_batman - percent_star_wars,
         total = total_batman + total_star_wars) %>%
  # Filter for totals greater than 200
  filter(total > 200)


