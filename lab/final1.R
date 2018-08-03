library("caret")
data <- read.csv("train_data1.csv")
data2 <- read.csv("train_data2.csv")
test1 <- read.csv("test_data.csv")

summary(test1)
data3 <- rbind(data,data2)


data3 <- subset(data3, select = -sponsor)
data3 <- subset(data3, select = -no_private)
data3 <- subset(data3, select = -date)
data3 <- subset(data3, select = -recorder)
data3 <- subset(data3, select = -e_type)
data3 <- subset(data3, select = -e_type_grp)
data3 <- subset(data3, select = -fee_type)
data3 <- subset(data3, select = -source)
data3 <- subset(data3, select = -quantity_grp)
data3 <- subset(data3, select = -type_grp)
data3 <- subset(data3, select = -permit)
data3 <- subset(data3, select = -meeting)

data3[data3=='unknown'] <- NA
data3[data3==''] <- NA
data3[data3==0] <- NA
data3 <- na.omit(data3)

summary(data3)

index <- 1:nrow(data3)
set.seed(333)
dt <- sample(index,trunc(0.3*nrow(data3)))
trainset <- na.omit(data3[-dt,])
test <-  na.omit(data3[dt,])

TrainingP <- trainControl(method = "cv" , number = 10)

set.seed(3233)

svm_model <- train(status ~ . , data = trainset , method = "svmRadial" , trControl = TrainingP)

svm_model

test_pred <- predict(svm_model, newdata = test)

confusionMatrix(test_pred, test$status )

summary(test_pred)


test1 <- subset(test1, select = -sponsor)
test1 <- subset(test1, select = -no_private)
test1 <- subset(test1, select = -date)
test1 <- subset(test1, select = -recorder)
test1 <- subset(test1, select = -e_type)
test1 <- subset(test1, select = -e_type_grp)
test1 <- subset(test1, select = -fee_type)
test1 <- subset(test1, select = -source)
test1 <- subset(test1, select = -quantity_grp)
test1 <- subset(test1, select = -type_grp)
test1 <- subset(test1, select = -permit)
test1 <- subset(test1, select = -meeting)

test1[test1=='unknown'] <- NA
test1[test1==''] <- NA
test1[test1==0] <- NA

test1 <- na.omit(test1)
summary(test1)

anyNA(test1)

test2 <- predict(svm_model, newdata = test1)
