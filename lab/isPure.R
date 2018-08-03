isPure <- function(data){
  length(unique(data[,ncol(data)])) == 1
}