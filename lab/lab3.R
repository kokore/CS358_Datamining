library("e1071")

data <- data(Ozone)




index <- 1:nrow(Ozone)
set.seed(142)
dt <- sample(index,trunc(0.3*nrow(Ozone)))
trainset <- na.omit(Ozone[-testindex,])
test <-  na.omit(Ozone[testindex,])