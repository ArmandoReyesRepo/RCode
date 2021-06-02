setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/03 Return_Values_and_Scopes")

is_leap_year <- function(year) {
  # If year is div. by 400 return TRUE
  if(year%%400==0) {
    return(TRUE)
  }
  # If year is div. by 100 return FALSE
  if(year%%100==0) {
    return(FALSE)
  }  
  # If year is div. by 4 return TRUE
  if(year%%4==0) {
    return(TRUE)
  }
  
  
  # Otherwise return FALSE
  return(FALSE)
}



is_leap_year(300)
