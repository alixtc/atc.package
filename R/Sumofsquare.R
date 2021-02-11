#' Directly get sum of square of a vector
#' @export
sumofsquare = function(vector){
  result <- sum( (vector - mean(vector) )^2 )
  return(result)
}
