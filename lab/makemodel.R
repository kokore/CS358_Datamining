library("e1071")
library("ggplot2")
data <- read.csv("kc_house_data.csv")


summary(data)

data1 <- subset(data , select = -id)
data1 <- subset(data1 , select = -date)
summary(data1)


index <- 1:nrow(data1)
set.seed(333)
dt <- sample(index,trunc(0.3*nrow(data1)) )
trainset <- na.omit(data1[-dt,])
test <-  na.omit(data1[dt,])

x <- subset(trainset, select = -price)
y <- trainset$price


svm_model <- svm(x,y,kernel = "linear" , gamma(0.001))
summary(svm_model)
pred <- predict(svm_model,x)

tc <- tune.control(cross = 10)

svm_tune <- tune(svm, train.x=x, train.y=y, 
                kernel="linear", cost=1, gamma=1 , tunecontrol = tc)
print(svm_tune$best.model)
summary(svm_tune)
pred_tune <- predict(svm_tune$best.model,test)
