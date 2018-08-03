library("e1071")

data <- read.csv(file="simpletoy.csv",header = TRUE)

plot(data,pch=15)

model <- svm(y ~ x,data,kernel = 'sigmoid')

predict_svm <- predict(model , data)

points(data$x,predict_svm,col = "red" , pch = 15)

obj <- tune(svm,y~x,data=data,kernel = 'sigmoid',ranges = list(epslion= seq(0,1,0.1) , cost = 1:100 ) )

best_svm <- obj$best.model

best_predict_svm <- predict(best_svm,data)

points(data$x,best_predict_svm,col = "blue" , pch = 15)


