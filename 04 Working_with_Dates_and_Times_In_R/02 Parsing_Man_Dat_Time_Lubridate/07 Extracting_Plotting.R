library(ggplot2)
library(dplyr)
library(ggridges)  ## used for density

# Import CSV with read_csv()
akl_daily_raw <- read_csv("akl_weather_daily.csv")

# Print akl_daily_raw
akl_daily_raw

# Parse date 
akl_daily <- akl_daily_raw %>%
  mutate(date = ymd(date))

# Use mutate() to create three new columns: year, yday and month 
# that respectively hold the same components of the date column.
# Don't forget to label the months with their names.
# 
# Create a plot of yday on the x-axis, max_temp of the y-axis where 
# lines are grouped by year. Each year is a line on this plot, with
# the x-axis running from Jan 1 to Dec 31.
# 
# To take an alternate look, create a ridgeline plot(formerly known 
# as a joyplot) with max_temp on the x-axis, month on the y-axis, using 
# geom_density_ridges() from the ggridges package.



# Add columns for year, yday and month
akl_daily <- akl_daily %>%
  mutate(
    year = year(date),
    yday = yday(date),
    month = month(date, label=TRUE))

# Plot max_temp by yday for all years
ggplot(akl_daily, aes(x = yday, y = max_temp)) +
  geom_line(aes(group = year), alpha = 0.5)

# Examine distribution of max_temp by month
ggplot(akl_daily, aes(x = max_temp, y = month, height = ..density..)) +
  geom_density_ridges(stat = "density")