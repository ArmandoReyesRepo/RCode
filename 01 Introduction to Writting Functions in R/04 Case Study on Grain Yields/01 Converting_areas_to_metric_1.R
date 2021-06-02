
# Write a function to convert acres to sq. yards
acres_to_sq_yards <- function (acres) {
  acres * 4840
}

# Write a function to convert square yards to square meters

sq_yards_to_sq_meters<- function(sq_yards) {
  sq_yards %>% 
    ## Take the square root
    sqrt() %>% 
    ## Convert yards to meters
    yards_to_meters() %>% 
    ## Square it
    raise_to_power(2)
}

# Write a function to convert yards to meters
yards_to_meters<- function(yards)
{ yards*36* 0.0254  }

# Write a function to convert sq. meters to hectares

sq_meters_to_hectares<- function(sq_meters)
{ 1/10000*sq_meters }


# Write a function to calculate the reciprocal
get_reciprocal <- function(x) {
  1/x
}


