library("ggplot2")
data <- read.csv(file = "kc_house_data.csv")

summary(data)

gg <- ggplot(data,aes(x=zipcode,y=price))+
  geom_hline(yintercept=4500000)+
  geom_point()
  
plot(gg)

