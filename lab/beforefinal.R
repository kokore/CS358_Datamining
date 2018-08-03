library("caret")
library("mlbench")
data <- read.csv("Iris.csv")

summary(data)

data <- subset(data, select = -Id)

summary(data)

index <- 1:nrow(data)
set.seed(333)
dt <- sample(index,trunc(0.3*nrow(data)))
trainset <- na.omit(data[-dt,])
test <-  na.omit(data[dt,])

data_crl <- trainControl(method = "cv", number = 10)
svm_caret <- train(SepalLengthCm ~ ., data = trainset , method = "lm" , trControl = data_crl)

pre <- predict(svm_caret,test)

svm_caret$results

plot(test$Species,pre)

