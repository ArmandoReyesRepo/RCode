##  Define load_step4

load_step4<- function() {
  load_step3()
  assign(
    "bushels_to_kgs",
    function(bushels, crop) {
      bushels %>% 
        bushels_to_lbs(crop) %>% 
        lbs_to_kgs()
    },
    envir = globalenv()
  )
}

# Load fns defined in previous steps

load_step4()




# Write a function to convert bushels/acre to kg/ha
bushels_per_acre_to_kgs_per_hectare <- function(bushels_per_acre, crop = c("barley","corn","wheat")) {
  # Match the crop argument
  crop <- match.arg(crop)
  bushels_per_acre %>%
    # Convert bushels to kgs for this crop
    bushels_to_kgs(crop) %>%
    # Convert  acres to ha
    acres_to_hectares()
}
