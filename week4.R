# Data visualisation with ggplot2

####################################################################################
## Preparing data                                                                 ##
####################################################################################
library(tidyverse)
df <- read_csv("http://datacarpentry.github.io/dc_zurich/data/portal_data_joined.csv")

####################################################################################
## Plotting with ggplot2                                                          ##
####################################################################################
# To build a ggplot, we will use the following basic template:
# ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +  <GEOM_FUNCTION>()

# - use the `ggplot()` function and bind the plot to a specific data frame using
#   the `data` argument
ggplot(data = df)

# - define a mapping (using the aesthetic (`aes`) function), by selecting the variables to be plotted and specifying how to present them in the graph, e.g. as x/y positions or characteristics such as size, shape, color, etc.
ggplot(data = df, aes(x = weight, y = hindfoot_length))

# - add 'geoms' – graphical representations of the data in the plot (points,
# lines, bars). **`ggplot2`** offers many different geoms; we will use some
# common ones today, including:
# 
# * `geom_point()` for scatter plots, dot plots, etc.
# * `geom_boxplot()` for, well, boxplots!
# * `geom_line()` for trend lines, time series, etc.
# 
# To add a geom to the plot use the `+` operator. Because we have two continuous variables,
# let's use `geom_point()` first:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_point()


# The `+` in the **`ggplot2`** package is particularly useful because it allows
# you to modify existing `ggplot` objects. This means you can easily set up plot
# templates and conveniently explore different types of plots, so the above plot
# can also be generated with code like this:

# Assign plot to a variable
rodent_plot <- ggplot(data = df, aes(x = weight, y = hindfoot_length))

# Draw the plot
rodent_plot +
  geom_point()

####################################################################################
## Building your plots iteratively                                                ##
####################################################################################
# Building plots with **`ggplot2`** is typically an iterative process. We start by
# defining the dataset we'll use, lay out the axes, and choose a geom:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_point()

# Then, we start modifying this plot to extract more information from it. For
# instance, we can add transparency (`alpha`) to avoid overplotting:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.5)

# That only helped a little bit with the overplotting problem. We can also
# introduce a little bit of randomness into the position of our points
# using the `geom_jitter()` function.
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_jitter(alpha = 0.5)

# We can also add colors for all the points:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_jitter(alpha = 0.5, color = "blue")

# Or to color each specie in the plot differently, you could use a vector as an input to the argument **`color`**.  
# Because we are now mapping features of the data to a color, instead of setting one color for all points, the color now needs to be set inside a call to the **`aes`** function. **`ggplot2`** will provide a different color corresponding to different values in the vector. We set the value of **`alpha`** outside of the **`aes`** function call because we are using the same value for all points. Here is an example where we color by **`village`**:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_jitter(aes(color = species), alpha = 0.5)

# It is also very easy to add (and stack) geometries:
ggplot(data = df, aes(x = weight, y = hindfoot_length)) +
  geom_jitter(aes(color = species), alpha = 0.5) +
  geom_smooth(aes(color = species))


################ Exercise 1 ################ 
# Below are two datasets, one from last week, one for some extra information
article_with_citation <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_with_citation.csv")
article_info <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_info.csv")
full_df <- left_join(article_with_citation, article_info, by = "doi") # merge them into a full dataset using one of the joins function

# Univariate Plot: 
# Make a boxplot that visualize `times_cited`


# Now change it to a histogram!


################ Exercise 2 ################ 
# Bivariate Plot: 
# Make a scatter plot that visualize `times_cited` and `altmetric`



# Can you colour it by `journal.title`?



# Make it semi-transparent (eg, alpha = 0.7)?



# Still not very readable, let's split the plot up using facets (try splitting by year and journal.title?)
# Add this to your plot: + facet_wrap(vars(VARIABLE))


################ Exercise 3 ################ 
# Advanced usage (you need to use what you learn from week 2 and 3)

# Combine with group_by() and summarise():
# Make a line plot (geom_line) that shows the total citation count per journal per year?





# Combine with pivot_longer():
# Make another line plot that shows the total sum of`times_cited` and `altmetric` (separately in different colour) by year
# Add facet by journal.title
