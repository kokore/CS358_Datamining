library(party)
library("data.tree")
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
input <- read.csv(file="mushrooms.csv",header = TRUE)

typeof(input)
class(input)
names(input)
ncol(input)
nrow(input)

lapply(input,function(x) unique(x))

index <- 1:nrow(input)
set.seed(142)
dt <- sample(index,trunc(0.3*nrow(input)))
trainset <- na.omit(input[-dt,])
testset <-  na.omit(input[dt,])


tabl <- cforest(class ~ . , data= input)
varimp(tabl)


source("C:/Program Files/R/TrainID3.r")
tree <- Node$new("mushroom")
TrainID3(tree,input)
plot(tree)

fit <- rpart(class ~ . , data = input)
fancyRpartPlot(fit)
