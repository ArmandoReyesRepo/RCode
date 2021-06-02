
## Define load_step3

load_step3<- function() {
  assign(
    "bushels_to_lbs",
    function(bushels, crop) {
      c(barley = 48, corn = 56, wheat = 60) %>%
        extract(crop) %>%
        multiply_by(bushels)
    },
    envir = globalenv()
  )
  assign(
    "lbs_to_kgs",
    function(lbs) {
      0.45359237 * lbs
    },
    envir = globalenv()
  )
}



## Load fns defined in previous steps

load_step3()




# Write a function to convert bushels to kg
bushels_to_kgs <- function(bushels, crop) {
  bushels %>%
    # Convert bushels to lbs for this crop
    bushels_to_lbs(crop) %>%
    # Convert lbs to kgs
    lbs_to_kgs()
}
