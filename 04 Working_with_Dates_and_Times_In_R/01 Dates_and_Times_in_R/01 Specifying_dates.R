# We've stored the string "2013-04-03" in a variable called x.
# 
# Use str() to look at the structure of x and confirm it's just 
# a character string.
# 
# Convert x to a date using as.Date().
# Use str() to look at the structure of x_date and confirm it's 
# a Date.
# 
# Now use as.Date() to store the date April 10, 2014.





# The date R 3.0.0 was released
x <- "2013-04-03"

# Examine structure of x
str(x)

# Use as.Date() to interpret x as a date
x_date <- as.Date(x)

# Examine structure of x_date
str(x_date)

# Store April 10 2014 as a Date
april_10_2014 <- as.Date("2014-04-10")


str(april_10_2014)
