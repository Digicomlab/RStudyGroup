# Basic Statistics

# Solution from last week
df_year_all2 <- full_df_filtered %>%
  group_by(year, journal.title) %>%
  summarize(total_citation = sum(times_cited), total_altmetric = sum(altmetric))
data_long = pivot_longer(df_year_all2, cols = c(total_citation, total_altmetric))
ggplot(data_long, aes(year, value)) + geom_line(aes(colour = name)) + facet_wrap(vars(journal.title))

####################################################################################
## Preparing data                                                                 ##
####################################################################################
library(tidyverse)
library(sjPlot)
library(broom)
library(stargazer)
df <- read_csv("http://datacarpentry.github.io/dc_zurich/data/portal_data_joined.csv")

# Important to know: formula notation (dependent ~ independent)
# This is how we do a t-test
t.test(df$weight ~ df$sex)

# Always a good idea to also visualise it
df %>% 
  na.omit() %>% 
  ggplot(aes(sex, weight)) + 
  geom_boxplot()

# Anova
m <- aov(df$weight ~ df$species)
summary(m)

df %>% 
  na.omit() %>% 
  ggplot(aes(species, weight)) + 
  geom_boxplot() +
  coord_flip()

# OLS Regression
m <- lm(weight ~ hindfoot_length + sex, data=df)  
summary(m)
plot_model(m) # The output is actually a ggplot
tab_model(m)

# Comparing and diagnosing models
m1 = lm(weight ~ hindfoot_length + sex, data=df)  
m2 = lm(weight ~ hindfoot_length + sex + hindfoot_length:sex, data=df)  
anova(m1, m2)
tab_model(m1, m2)

# Model performance metrics
glance(m1)
glance(m2)

# Make a latex table 
# check ?stargazer for the million things you can change
stargazer(m1, m2, type ="text")

# Logistical Regression
df$Female <- 0
df$Female[df$sex == "F"] <- 1
df$Female[is.na(df$sex)] <- NA

m <- glm(Female ~ hindfoot_length + weight, 
        data=df, family=binomial)
summary(m)
tab_model(m)
# PS: by changing the family, you can easily run other models, like poisson regression

################ Exercises ################ 
# Below is the dataset that we used
article_with_citation <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_with_citation.csv")
article_info <- read.csv("https://raw.githubusercontent.com/Digicomlab/RStudyGroup/refs/heads/main/article_info.csv")
full_df <- left_join(article_with_citation, article_info, by = "doi") # merge them into a full dataset using one of the joins function

# Conduct a t-test to see whether times_cited is different between these two journals




# Let's do a OLS Regression, see if author_no and altmetric could predict times_cited?




# Now fit another model, and also control for the year?




# Compare the models using first anova(), and then glance()?




# Make a regression table using whichever way you like

