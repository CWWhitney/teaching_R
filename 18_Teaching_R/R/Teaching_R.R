#Use hashtag to write things that will not be read
getwd()
setwd("/Users/macbook/Dropbox/University of Bonn/Teaching_R")
list.files()

participants_data <- read.csv("participants_data.csv")

head(participants_data)
names(participants_data)
class(participants_data)
summary(participants_data)
str(participants_data)

#Plot####

plot(participants_data$academic_parents)

plot(participants_data$academic_parents,
     participants_data$days_to_email_response)

plot(
  participants_data$number_of_publications,
  participants_data$days_to_email_response
)

#Start with a quick plot option
? qplot 										# READ
#Example from built in R data
? iris 	#READ
qplot(
  Sepal.Length,
  Petal.Length,
  data = iris,
  color = Species,
  size = Petal.Width
)

#Example from your data OFFER SUGGESTIONS
qplot(
  days_to_email_response,
  letters_in_first_name,
  color = academic_parents,
  size = working_hours_per_day,
  data = participants_data
)

#### install.packages("dplyr") ####

library(dplyr)

head(select(participants_data, academic_parents:working_hours_per_day))

#Select
aca_work_filter <-
  select(participants_data, academic_parents, working_hours_per_day)
aca_work_filter
non_aca_work_filter <-
  select(participants_data,-(academic_parents) - (working_hours_per_day))
non_aca_work_filter

#Base R alternative
aca_work <- participants_data[, c(8, 6)]
aca_work
non_aca_work <- participants_data[, c(8, 6)]
non_aca_work


#filter
work_filter <- filter(participants_data, working_hours_per_day > 10)
work_filter

work_name_filter <-
  filter(participants_data,
         working_hours_per_day > 10 & letters_in_first_name > 6)
work_name_filter

#Arrange
participants_data <-
  arrange(participants_data, letters_in_first_name) #ascending
participants_data

head(participants_data)
tail(participants_data)

participants_data <-
  arrange(participants_data, desc(letters_in_first_name)) #descending
participants_data


#rename
participants_data <-
  rename(participants_data, name_length = letters_in_first_name)
names(participants_data)

participants_data <-
  rename(participants_data,
         daily_labor = working_hours_per_day,
         uni_kid = academic_parents)
names(participants_data)

#mutate
#center a bit
participants_data <-
  mutate(participants_data, labor = daily_labor * mean(daily_labor))
head(participants_data)

participants_data <-
  mutate(participants_data, siblings =
         number_of_siblings - mean(number_of_siblings))
head(participants_data)

#create a factor called 'farcat'
participants_data <-
  mutate(participants_data, farcat = factor(1 * (km_home_to_zef > 10), labels = c("far", "near")))
participants_data$farcat

#group by
#Commuter category
participants_data <-
  mutate(participants_data, commute = factor(1 * (km_home_to_zef > 10), labels = c("commuter", "local")))
participants_data$commute

commuter_data <- group_by(participants_data, commute)
as.data.frame(commuter_data)

summarize(
  commuter_data,
  mean(days_to_email_response),
  median(name_length),
  max(years_of_study)
)

#Do all that with a pipeline %>%
participants_data %>% mutate(commute = factor(1* 
(km_home_to_zef > 10), labels = c("commuter", "local"))) %>% 
group_by(commute) %>% summarize(mean(days_to_email_response), 
median(name_length), max(years_of_study)) %>% as.data.frame


#merge data

dplyr::full_join(commuter_data, participants_data)
dplyr::full_join(commuter_data, participants_data, by = "continent_of_origin")

merge(commuter_data, participants_data, all = TRUE)
merge(commuter_data, participants_data, by = "continent_of_origin")

#PLOTTING####
#install.packages("ggplot2")####
library(ggplot2)

#example from built in R data
qplot(
  Sepal.Length,
  Petal.Length,
  data = iris,
  color = Species,
  size = Petal.Width
)

#example from your data OFFER SUGGESTIONS ?qplot ####

qplot(
  days_to_email_response,
  letters_in_first_name,
  color = academic_parents,
  size = working_hours_per_day,
  position = "jitter",
  data = participants_data
)

#scatterplot
qplot(data = participants_data, days_to_email_response, letters_in_first_name)


#Correlation######
?cor
cor(participants_data$days_to_email_response,
  participants_data$letters_in_first_name)

cor.test(participants_data$days_to_email_response,
  participants_data$letters_in_first_name)

ggplot(
  data = participants_data,
  aes(x = days_to_email_response, y = letters_in_first_name, fill = research_continent)
) +
  geom_tile()

#smaller data

part_data <-
  select(
    participants_data,
    days_to_email_response,
    number_of_siblings,
    years_of_study,
    number_of_publications,
    letters_in_first_name,
    km_home_to_zef,
    working_hours_per_day,
    days_to_email_response
  )

head(part_data)


cormat <- round(cor(part_data), 1)
head(cormat)


library(reshape2)
melted_cormat <- melt(cormat)
head(melted_cormat)

#Create a correlation heatmap

library(ggplot2)
cortile<-ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

qplot(data = participants_data, letters_in_first_name, years_of_study)
qplot(data = participants_data, number_of_publications, years_of_study)

#Export Figures####
?pdf
?png

png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)
ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
dev.off()
list.files()
#Simple Model Building####
participants_data <- read.csv("participants_data.csv")

#Model formulas formation
#Y ~ X1 + X2 + Z * W
#Linear regression

lm(days_to_email_response ~ letters_in_first_name, data=participants_data)

lm(days_to_email_response ~ letters_in_first_name + 
km_home_to_zef + working_hours_per_day, data=participants_data)

#Anova####
#If y is continuous and z is categorical 
aov(days_to_email_response ~ academic_parents, data = participants_data)
#Y is the explanatory variable
#∼ means “is modeled as a function of” 
#the right hand side is an expression in the explanatory variables.

