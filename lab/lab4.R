library("e1071")
library("rpart")
library("ggplot2")
data("iris")

names(iris)

typeof(iris)

class(iris)

ncol(iris)

nrow(iris)

head(iris)

index <- 1:nrow(iris)
set.seed(142)
dt <- sample(index,trunc(0.3*nrow(iris)))
trainset <- na.omit(iris[-dt,])
test <-  na.omit(iris[dt,])


x <- subset(trainset, select = -Species)
y <- trainset$Species

svm_model <- svm(x,y,kernel = "linear")
pred <- predict(svm_model,x)
table(pred,y)

test1 <- subset(test,select = -Species)
pred1 <- predict(svm_model,test1)
table(pred1,test$Species)




