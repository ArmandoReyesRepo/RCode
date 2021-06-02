setwd("C:/Users/arman/OneDrive/Desktop/Introduction to Writting Functions in R/03 Return_Values_and_Scopes")
dir()

capitals<- read.csv("capitals.csv")
names(capitals)[1]<- "city"


national_parks<- read.csv("national_parks.csv", header = FALSE)
national_parks<- national_parks[,"V1"]

population<- read.csv("population.csv", header = FALSE)

rsa_lst <- list(capitals= capitals, 
                national_parks= national_parks,
                population=population)

ls.str(rsa_lst)


#######

rsa_env<- list2env(rsa_lst)

######

parent<- parent.env(rsa_env)

# Print its name
environmentName(parent)

##  New rsa_env

rsa_lst <- list(capitals= capitals, 
                national_parks= national_parks)

rsa_env<- list2env(rsa_lst)

# Compare the contents of the global environment and rsa_env

ls.str(globalenv())
ls.str(rsa_env)

# Does population exist in rsa_env?  -  It will appear because it looks in parent environment
exists("population",envir = rsa_env)

# Does population exist in rsa_env, ignoring inheritance? - It will not appear it only look in reference, not parent
exists("population",envir = rsa_env, inherits=FALSE)










