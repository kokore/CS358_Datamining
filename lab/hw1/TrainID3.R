TrainID3 <- function(node, data) {
  node$obsCount <- nrow(data)
  #if the data-set is pure (e.g. all toxic), then
  source('C:/Program Files/R/isPure.r')
  source('C:/Program Files/R/informationGain.r')
  if (isPure(data)) {
    #construct a leaf having the name of the pure feature (e.g. 'toxic')
    child <- node$AddChild(unique(data[,ncol(data)]))
    node$feature <- tail(names(data), 1)
    child$obsCount <- nrow(data)
    child$feature <- ''
  } else {
    #chose the feature with the highest information gain (e.g. 'color')
    ig <- sapply(colnames(data)[-ncol(data)], 
                 function(x) informationGain(
                   table(data[,x], data[,ncol(data)])
                 )
    )
    print(ig)
    feature <- names(ig)[ig == max(ig)][1] #select first feature when have same information gain
    node$feature <- feature
    
    #take the subset of the data-set having that feature value
    childObs <- split(data[,!(names(data) %in% feature)], 
                      data[,feature], drop = TRUE)
    
    for(i in 1:length(childObs)) {
      #construct a child having the name of that feature value (e.g. 'red')
      child <- node$AddChild(names(childObs)[i])
      #call the algorithm recursively on the child and the subset      
      TrainID3(child, childObs[[i]])
    }
  }
}
