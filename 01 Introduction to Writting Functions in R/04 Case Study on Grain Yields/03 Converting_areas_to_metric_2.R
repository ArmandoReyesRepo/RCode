## Define load step 3

load_step3<- function() {
  assign(
    "acres_to_hectares",
    function(acres) {
      acres %>%
        acres_to_sq_yards() %>%
        sq_yards_to_sq_meters() %>%
        sq_meters_to_hectares()
    },
    envir = globalenv()
  )
}

## Load the functions from the previous steps

load_step3()

# Define a harmonic acres to hectares function
harmonic_acres_to_hectares <- function(acres) {
  acres %>% 
    # Get the reciprocal
    get_reciprocal() %>%
    # Convert acres to hectares
    acres_to_hectares() %>% 
    # Get the reciprocal again
    get_reciprocal()
}