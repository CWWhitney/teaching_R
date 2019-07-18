participants_data<-read.csv("participants_data.csv")
library(dplyr)
names(participants_data)
aca_work_filter<-select(participants_data, academic_parents,
                        working_hours_per_day)

names(aca_work_filter)

?ethnobotanydata #the '?' symbol opens the help file..
names(ethnobotanydata)
str(ethnobotanydata)  
head(ethnobotanydata)

?str
?head
?names
