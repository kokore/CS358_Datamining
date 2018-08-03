library("caret")

data <- read.csv("kc_house_data.csv")

summary(data)

data1 <- subset(data , select = -id)
data1 <- subset(data1 , select = -date)
summary(data1)


index <- 1:nrow(data1)
set.seed(333)
dt <- sample(index,trunc(0.3*nrow(data1)))
trainset <- na.omit(data1[-dt,])
test <-  na.omit(data1[dt,])

x <- subset(trainset, select = -price)
y <- trainset$price

svm_caret <- train(x , y , method = "svmRadial")
print(svm_caret$results)

pre <- predict(modelFit = svm_caret, newdata = test)

testdata_ctrl <- trainControl(method = "repeatedcv" , number = 5)

svm_caret_tune <- train( x ,y , trControl = data_ctrl , method = "svmRadial") 

summary(svm_caret_tune)
print(svm_caret_tune$resample)

svm_caret
svm_caret_tune$results
