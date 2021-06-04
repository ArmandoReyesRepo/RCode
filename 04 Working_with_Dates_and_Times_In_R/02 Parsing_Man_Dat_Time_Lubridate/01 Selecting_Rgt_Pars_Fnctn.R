library(lubridate)

# For each date the ISO 8601 format is displayed as 
# a comment after it, to help you check your work
# 
# Choose the correct function to parse x.
# Choose the correct function to parse y.
# Choose the correct function to parse z.

# Parse x 
x <- "2010 September 20th" # 2010-09-20
ymd(x)

# Parse y 
y <- "02.01.2010"  # 2010-01-02
dmy(y)

# Parse z 
z <- "Sep, 12th 2010 14:00"  # 2010-09-12T14:00
mdy_hm(z)
