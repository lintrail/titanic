# Checking the structure of titanic
str(titanic_df)

#loading ggplot2
library(ggplot2)

# Creating bar graph distribution of sexes based on the passenger's class on the ship 
ggplot(titanic_df, aes(x = ï..pclass, fill = sex)) +
  geom_bar(position = "dodge")

# Replacing NA is survival with 0 
titanic_df$survived[is.na(titanic_df$survived)] <- 0

# Comparing Survival based on passenger class and sex
ggplot(titanic_df, aes(x = ï..pclass, fill = sex)) +
  geom_bar(position = "dodge") + 
  facet_grid(.~survived)


# Defining an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# Creating scatterpolot but now considering the age of the survivors
ggplot(titanic_df, aes(x = ï..pclass, y = age, col = sex)) +
  geom_point(position = posn.jd, alpha = 0.5, size = 3) + 
  facet_grid(.~survived)

