# Consider the variables image and attach. You can read 
# about them with ?email, but the help file is ambiguous: 
# do attached images count as attached files in this dataset?
#   
# Design a simple test to determine if images count as attached
# files. This involves creating a logical condition to compare 
# the values of the two variables, then using sum() to assess 
# every case in the dataset. Recall that the logical operators 
# are < for less than, <= for less than or equal to, > for 
# greater than, >= for greater than or equal to, and == for 
# equal to.

# Test if images count as attachments



sum(email$image>email$attach)
