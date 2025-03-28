# ---
# title: "R Study Group (Week 1)"
# author: "Justin Ho"
# last updated: "28/03/2025"
# ---

####################################################################################
## Quick Recaps                                                                   ##
####################################################################################

################ Assigning Objects ################
# You can get output from R simply by typing math in the console.
# However, to do useful and interesting things, we need to assign values to
# objects. To create an object, we need to give it a name followed by the
# assignment operator `<-` or `=` (you can use either of them, they are interchangeable) 
# and the value we want to give it:
#
# In RStudio, typing 'Alt' + '-' will write `<- ` in a single keystroke in a
# PC, while typing 'Option' + '-' does the same in a Mac.

################ Functions ################
# Functions are "canned scripts"
# They are often predefined, or can be made available by importing R *packages*
# A function usually gets one or more inputs called *arguments*
# Can return a single value, and also a set of things, or even a dataset 
# Example, the `sqrt()` function will return the square root of the input:
sqrt(100)

####################################################################################
## Exercises                                                                      ##
####################################################################################

################ Exercise 1 ################ 
# Create two variables `r_length` and `r_width` and assign them values (eg 2 and 3).
# Create a third variable `r_area` and give it a value based on the values of `r_length` times `r_width`.
# Tips: the operator for multiplication in R is `*`

r_length <-            # Finish this line
                       # And this line
                       # And finally this line



  
# Note: When you finish, post it to the pad (https://pad.carpentries.org/asocr) so that we can have a look together
  
################ Exercise 2 ################ 
# Below is a list of grades from a student assignment
# Calculate the average grade using the `sum()` and the `length()` function.
# Tips: the division operator in R is `\`

grades <- c(1, 2, 3, 4, 7, 1, 6, 3, 6, 8, 8, 10, 3, 5, 7, 2, 6)





################ Exercise 3 ################ 
# Below is a line of code that read in a dataset
# The way to extract a variable from a datase is `$`
# For example, `df$grade` will extract the `grade` column from the dataset as a vector:

df <- read.csv("grades.csv")
df$grade

# Now, calculate the average grade of the students in the dataset



# Finally, use the new function `mean()` to do it.
# Tips, to learn about the mean function, type `?mean()`






################ Bonus Challenge (DO NOT TRY THIS AT HOME) ################ 
# Proceed only if you are bored and want a EXTREMELY difficult challenge...
# Find Standard Deviation using R
# Tips: here are the stips.
# 1. Find the average (mean)
# 2. Find how far each number is from the mean
#    - Subtract the mean from each number.
#    - Square the result (so all values are positive).
# 3. Find the average of those squared differences
#    - Add them up.
#    - Divide by one less than the total number of numbers.
# 4. Take the square root





