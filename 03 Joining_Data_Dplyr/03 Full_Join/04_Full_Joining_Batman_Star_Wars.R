##  Execute 1 to 3 exercise


batman_parts <- batman %>%
  count(part_num, color_id, wt = quantity)

star_wars_parts <- star_wars %>%
  count(part_num, color_id, wt = quantity)


# Combine the star_wars_parts table with the batman_parts table; 
# use the suffix argument to include the "_batman" and "_star_wars" 
# suffixes.

# Replace all the NA values in the n_batman and n_star_wars columns 
# with 0s.

batman_parts %>%
  # Combine the star_wars_parts table 
  full_join(star_wars_parts, by= c("part_num","color_id"), suffix = c("_batman","_star_wars")) %>%
  # Replace NAs with 0s in the n_batman and n_star_wars columns 
  replace_na( list(n_batman=0, n_star_wars=0  ))
