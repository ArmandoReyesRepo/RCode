
jan_31<- as.Date("2020-01-31")


# We've put jan_31, the date for January 31st this year in your workspace.
# 
# Start by creating a sequence of 1 to 12 periods of 1 month.
# 
# Add month_seq to jan_31. Notice what happens to any month where the 
# 31st doesn't exist
# 
# Now add month_seq to jan_31 using the %m+% operator.
# 
# Try subtracting month_seq from jan_31 using the %m-% operator.

# A sequence of 1 to 12 periods of 1 month
month_seq <- 1:12 * months(1)

# Add 1 to 12 months to jan_31
jan_31 + month_seq

# Replace + with %m+%
jan_31 %m+% month_seq

# Replace + with %m-%
jan_31 %m-% month_seq
