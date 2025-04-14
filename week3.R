# ---
# title: "R Study Group (Week 3)"
# author: "Justin Ho"
# last updated: "11/04/2025"
# ---

####################################################################################
## Quick Recaps                                                                   ##
####################################################################################

library(tidyverse)

################ Joining Datasets ################
df1 <- data.frame(name = c("Dori", "Nori", "Ori", "Óin"), grade1 = c(7,8,6,9))
df2 <- data.frame(name = c("Dori", "Nori", "Ori", "Glóin"), grade2 = c(9,10,10,5))
df1
df2

# There are multiple ways to join two datasets in R
# The most common ones are:
left_join(df1, df2, by = "name")
right_join(df1, df2, by = "name")
inner_join(df1, df2, by = "name")
full_join(df1, df2, by = "name")

################ Recoding Datasets ################
df_full <- full_join(df1, df2, by = "name")

# This is how to recode (categorical) data
df_full %>% mutate(name = recode(name, "Glóin" = "Bifur"))

# This is how you can replace NA as 0
df_full$grade1 <- replace_na(df_full$grade1, 0)
df_full

# And of course there is the option to drop all NAs
na.omit(df_full)

################ Reshaping ################
# For "long" data format, there are three components (columns):
# 1. one for the id variable
# 2. one* for the observed variable(s) (variable name)
# 3. one for the observed value (of the variable in the same row).

pivot_longer(data = df_full, 
             cols = grade1:grade2, # Notice we only selected 2 out of 3 variables, the leftover one is call ID variable
             names_to = "which_grade",
             values_to = "value")

################ Exercise 1 ################ 
# Below are two datasets, one from last week, one for some extra information
article_with_citation <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_with_citation.csv")
article_info <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_info.csv")

# Try to merge them into a full dataset using one of the joins function




# Let's do some recoding, change the journal.title to "SMS" and "NMS" respectively




# Now do some data cleaning, there are a lot of NAs in altmetric, replace with 0





# Create 2 new variables:
# 1. total_impact: by adding `times_cited` and `altmetric`
# 2. cite_per_author: by dividing `times_cited` with `author_no`




################ Exercise 2 ################ 
# Create a long dataset, I want the observed variable (call it `impact`) to be `times_cited` and `altmetric`




################ Exercise 3 ################ 
# Try exporting the data using the `write.csv()` function. You might need to read the help file.




