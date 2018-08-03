library("caret")
data <- read.csv("train_data1.csv")

summary(data)

data <- subset(data, select = -sponsor)
data <- subset(data, select = -no_private)
data <- subset(data, select = -date)
data <- subset(data, select = -recorder)
data <- subset(data, select = -e_type)
data <- subset(data, select = -e_type_grp)
data <- subset(data, select = -fee_type)
data <- subset(data, select = -source)
data <- subset(data, select = -quantity_grp)
data <- subset(data, select = -type_grp)
data <- subset(data, select = -permit)
data <- subset(data, select = -meeting)

data1 <- data

data1[data1=='unknown'] <- NA
data1[data1==''] <- NA
data1[data1==0] <- NA
data1 <- na.omit(data1)

summary(data1)


index <- 1:nrow(data1)
set.seed(333)
dt <- sample(index,trunc(0.3*nrow(data1)))
trainset <- na.omit(data1[-dt,])
test <-  na.omit(data1[dt,])

anyNA(data1)

summary(trainset)

TrainingP <- trainControl(method = "cv" , number = 10)

set.seed(3233)

svm_model1 <- train(status ~ . , data = trainset , method = "svmRadial" , trControl = TrainingP)

svm_model1

plot(svm_model1)

test_pred <- predict(svm_model1, newdata = test)

confusionMatrix(test_pred, test$status )
