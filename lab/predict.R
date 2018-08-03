predict <- function(tree,features){
  if(tree$child[[1]]$isLeaf)
    return(tree$children[[1]]$name)
  child <- tree$children[[features[[tree$feature]]]]
  return (predic(child,features))
}