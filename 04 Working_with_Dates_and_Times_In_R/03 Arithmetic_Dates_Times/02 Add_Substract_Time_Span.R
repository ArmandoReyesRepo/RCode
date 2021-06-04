# It's Monday Aug 27th 2018 at 2pm and you want to remind yourself this time 
# next week to send an email. Add a period of one week to mon_2pm.
# 
# It's Tuesday Aug 28th 2018 at 9am and you are starting some code that
# usually takes about 81 hours to run. When will it finish? Add a duration 
# of 81 hours to tue_9am.
# 
# What were you doing five years ago? Subtract a period of 5 years from today().
# 
# Subtract a duration of 5 years from today(). Will this give a different date?

# Add a period of one week to mon_2pm
mon_2pm <- dmy_hm("27 Aug 2018 14:00")
mon_2pm + weeks()


# Add a duration of 81 hours to tue_9am
tue_9am <- dmy_hm("28 Aug 2018 9:00")
tue_9am + dhours(81)

# Subtract a period of five years from today()
today() - years(5)

# Subtract a duration of five years from today()
today() - dyears(5)
