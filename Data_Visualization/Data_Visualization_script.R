#The notes I was writing during the Data Vis lecture. 

#load data

participants_data<- read.csv("participants_data.csv")

plot(participants_data$academic_parents)

plot(participants_data$academic_parents, participants_data$days_to_email_response)


library(ggplot2)
ggplot(data = participants_data, aes(x=letters_in_first_name, 
                                      y=days_to_email_response, 
                                     color = academic_parents, 
                                     size = working_hours_per_day)) + 
  geom_point()


ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, 
           color=Species, size=Petal.Width))+ 
  geom_point()

ggplot(data = diamonds, aes(x=carat, y=price, alpha = 0.2)) + geom_point()

ggplot(data = diamonds, aes(x=log(carat), y= log(price), alpha = 0.2)) + geom_point()


library(dplyr)
dsmall <- top_n(diamonds, n=100)
#Plot with different colors for color
ggplot(data = dsmall, aes(x=carat, y=price, color = color))+ geom_point()

ggplot( data = dsmall, aes(carat, price, shape = cut)) + geom_point()

ggplot(data = diamonds, aes(carat, price, alpha=I(0.1), color=I("blue"))) + geom_point()

ggplot(data = diamonds, aes(carat, price, alpha=I(0.4), color=I("green"))) + geom_point()

ggplot(data=diamonds, aes(x=color, y=price/carat, alpha=I(0.1)))+
  geom_boxplot()+
  geom_jitter()

ggplot(data = diamonds, aes(x=carat)) +
  geom_density()

ggplot(data = diamonds, aes(x=carat, fill = color)) +
  geom_density()


ggplot(data = diamonds, aes(x=carat, fill = color, alpha=I(0.3))) +
  geom_density()

ggplot2::ggplot(data = mpg, aes(x=displ, y=hwy,  color = factor(cyl)))+ 
  geom_point()+
  geom_smooth(method="lm")

ggplot(mtcars, aes(mpg, y = hp, col = gear)) +
  geom_point() +
  ggtitle("My Title") +
  labs(x = "the x label", y = "the y label", col = "legend title")


ggplot(data = mtcars) +
  aes(x = mpg) +
  labs(x = "the x label") +
  aes(y = hp) +
  labs(y = "the y label") +
  geom_point() +
  aes(col = gear) +
  labs(col = "legend title") +
  labs(title = "My Title")


part_data<-select_if(participants_data, is.numeric)

cormat <- round(cor(part_data), 1)

melted_cormat <- melt(cormat)

ggplot(data = melted_cormat, aes(x=Var1, 
                                 y=Var2, fill=value)) + 
  geom_tile()


png(file = "cortile.png", width = 7, height = 6, units = "in", res = 300)

ggplot(data = melted_cormat, aes(x = Var1, y = Var2, fill = value)) + geom_tile() + theme(axis.text.x = element_text(angle = 45, hjust = 1))

dev.off()

ggplot(datasaurus_dozen, aes(x=x, y=y))+
  geom_point()+
  theme_minimal() +
  transition_states(dataset, 3, 1) + 
  ease_aes('cubic-in-out')

ggplot(data = dsmall, aes(x = carat, y = price, color = color)) + 
  geom_line() +
  transition_reveal(carat) + 
  ease_aes("linear") +
  labs(title='Diamond carats: {frame_along}')

