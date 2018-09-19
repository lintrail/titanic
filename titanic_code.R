titanic_df <- titanic_original
head(titanic_df)

#load dplyr, tidyr
library(dplyr)
library(tidyr)

# replace empty observations in embark with S
titanic_df[titanic_df$embarked == "", "embarked"] <- "S"


# replace NA in age with mean of age
titanic_df$age[is.na(titanic_df$age)] <- mean(titanic_df$age, na = TRUE)

# fill empty boat values with "NA"
titanic_df[titanic_df$boat == "", "boat" ] <- "NA"

# create new column has_cabin_number
titanic_df <- titanic_df %>%
  mutate(has_cabin_number =ifelse(cabin == "", 1, 0))

write.csv(titanic_df, file = "titanic_clean.csv")
