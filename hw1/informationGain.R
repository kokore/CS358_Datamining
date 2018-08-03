informationGain <- function(tble){
  source('C:/Program Files/R/entropy.r')
  tble <- as.data.frame.matrix(tble)
  pEntropy <- entropy(colSums(tble))
  s <- rowSums(tble)
  cEntropy <- sum(s/sum(s)* apply(tble,MARGIN = 1,FUN = entropy))
  IG <- pEntropy - cEntropy
  return(IG)
}
