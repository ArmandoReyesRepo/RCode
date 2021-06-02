## Defining load_step2 function
load_step2<- function()
 {
  assign(
    "sq_yards_to_sq_meters",
    function(sq_yards) {
      sq_yards %>% 
        sqrt() %>% 
        yards_to_meters() %>% 
        raise_to_power(2)
    },
    envir = globalenv()
  )
  
 }

# Load the function from the previous step
load_step2()


# Write a function to convert acres to hectares
acres_to_hectares <- function(acres) {
  acres %>%
    # Convert acres to sq yards
    acres_to_sq_yards() %>%
    # Convert sq yards to sq meters
    sq_yards_to_sq_meters() %>%
    # Convert sq meters to hectares
    sq_meters_to_hectares()
}
