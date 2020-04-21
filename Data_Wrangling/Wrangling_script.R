#make a new object

#New Object ####
#I made this because Dr. Whitney said to make it
#The idea is to assign the number '4' to an object called 'object'
new_object <- c(4, 3, 2, NA)

#Mean new object ########

mean_new_object <- mean(new_object, na.rm = TRUE)

# to annotate and not run ###

#If not Rmarkdown then at least use ‘—-’ or ####

#Section 1—-

#Section 2####

#Section 3####

#check the R with version

version

# install.packages("tidyverse")
library(tidyverse)

# see some vignettes
browseVignettes("tidyverse")

#load the data ####
participants_data <- read.csv("participants_data.csv")
str(participants_data)

aca_work_filter <- select(participants_data, academic_parents, working_hours_per_day)
names(aca_work_filter)
head(aca_work_filter)

non_aca_work_filter <- select(participants_data, -academic_parents, -working_hours_per_day)

work_filter <- filter(participants_data, working_hours_per_day > 10)

work_name_filter <- filter(participants_data, working_hours_per_day >10 & letters_in_first_name >6)

participants_data <- rename(participants_data, name_length = letters_in_first_name)

participants_data <- rename(participants_data, daily_labor = working_hours_per_day)

participants_data <- mutate(participants_data, labor_mean = daily_labor*mean(daily_labor))

participants_data <- mutate(participants_data, 
                            commute = ifelse(km_home_to_zef > 10, 
                            "commuter", "local"))

commuter_data <- group_by(participants_data, commute)

commuter_summary <- summarize(commuter_data, mean(days_to_email_response), median(name_length))


pipe_data <- participants_data %>% 
  mutate(commute = ifelse(
    km_home_to_zef > 10, 
    "commuter", "local")) %>% 
  group_by(commute) %>% 
  summarize(mean(days_to_email_response), 
            median(name_length), 
            max(years_of_study)) %>% 
  as.data.frame












participants_data_regression <- participants_data %>%
  split(.$batch) %>% # from base R
  map(~ lm(days_to_email_response ~ daily_labor, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")

cars_regression <- mtcars %>%
  split(.$cyl) %>% # from base R
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")
