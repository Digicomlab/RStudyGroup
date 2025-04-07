# ---
# title: "R Study Group (Week 2)"
# author: "Justin Ho"
# last updated: "04/04/2025"
# ---

####################################################################################
## Quick Recaps                                                                   ##
####################################################################################

# You could read dataframes using the following code:
df <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_with_citation.csv")

View(df) # view the dataframe as a spreadsheet

################ Inspecting data frames ################
# There are functions to extract this information from data frames.
# Here is a non-exhaustive list of some of these functions:
# 
# Size:
dim(df) # returns number of rows, number of columns
nrow(df) # returns the number of rows
ncol(df) # returns the number of columns

# Content:
head(df) # shows the first 6 rows
tail(df) # shows the last 6 rows

# Names:
names(df) # returns the column names (same as 'colnames()')

# Summary:
str(df) # structure of the object and information about the class, length and content of each column
summary(df) # summary statistics for each column

################ Indexing and subsetting data frames ################
## first element in the first column of the data frame
df[1, 1]

## first column of the data frame
df[, 1]

## first column of the data frame
df[1]

## first column of the data frame (as a vector)
df[[1]]

## first three elements in the 7th column
df[1:3, 7]

## the 3rd row of the data frame
df[3, ]

## equivalent to head(df) 
df[1:6, ]
df[-c(7:131), ] # - minus means except

# The whole data frame, except the first column
df[, -1]          

# Data frames can be subset by calling indices (as shown previously), 
# but also by calling their column names directly:

df["title"]       # Result is a data frame
df[, "title"]     # Result is a data frame
df[["title"]]     # Result is a vector
df$title          # Result is a vector

################ Data Manipulation using dplyr ################
# We're going to use some of the most common `dplyr` functions:
# - `select()`: subset columns
# - `filter()`: subset rows on conditions
# - `mutate()`: create new columns by using information from other columns
# - `group_by()` and `summarize()`: create summary statistics on grouped data
# - `arrange()`: sort results
# - `count()`: count discrete values

# Set Up
library(tidyverse)

# To select columns of a data frame, use `select()`.
# The first argument is the dataframe and the subsequent are the columns to keep.
select(df, times_cited, title, journal.title)

# To choose rows based on a specific criteria, use `filter()`:
filter(df, times_cited > 5)
filter(df, journal.title == "Social Media + Society")

# Pipes take the output of one function and send it directly to the next
# - `%>%`
# - you can type the pipe with 'Ctrl' + 'Shift' + 'M' ('Cmd' + 'Shift' + 'M' for Mac)
df %>%
  filter(times_cited > 5) %>%
  select(title)

# Mutate creates new columns based on the values in existing columns
mutate(df, times_cited_plusone = times_cited + 1)

# Here's a more advanced application using case_when()
mutate(df, highly_cited = case_when(times_cited >= 5 ~ TRUE,
                                    times_cited < 5 ~ FALSE))

################ Split-apply-combine data analysis and the summarize() function ################
df %>%
  group_by(journal.title) %>%
  summarize(mean_citation = mean(times_cited))


####################################################################################
## Exercises                                                                      ##
####################################################################################

################ Exercise 1 ################ 
# Use `group_by()` and `summarize()` to find the mean, min, and max
# number of citations for each journal.




################ Exercise 2 ################ 
# Find out how many articles are published per year?
# Tips: use `group_by()` and `count()`


# Find out how many articles are published per journal per year?




################ Exercise 3 ################ 
# Create a new variable `recent_pub` using mutate() and case_when()
# Apply TRUE to articles published in or after 2023, FALSE to all other articles


# Then calculate the average citation count for BOTH recent articles and non-recent articles





################ Exercise 4 ################ 
# Extract 5 most cited articles from BOTH journal
# There are multiple ways to do the same thing.
# These functions can be useful: `group_by()`, `arrange()`, `desc()`, `head()`
# If possible, try using `slice_head()`. You will need to learn it by reading the document `?slice_head()`



