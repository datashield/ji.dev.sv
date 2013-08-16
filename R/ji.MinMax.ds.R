#' Generates a matrix with a minimum and maximum value for xvect and yvect - helper function for heatmap plot
#'
#' @param xvect a numerical vector
#' @param yvect a numerical vector
#' @export
#' 
ji.MinMax.ds <- function(xvect, yvect) {
  MinMaxMatrix <- matrix(0,nrow=2,ncol=2)
  MinMaxMatrix <- as.data.frame(MinMaxMatrix)
  names(MinMaxMatrix) <- c('xvect', 'yvect')
  row.names(MinMaxMatrix) <- c('min', 'max')
  MinMaxMatrix['min', 'xvect'] <- min(xvect, na.rm=T)
  MinMaxMatrix['max', 'xvect'] <- max(xvect, na.rm=T)
  MinMaxMatrix['min', 'yvect'] <- min(yvect, na.rm=T)
  MinMaxMatrix['max', 'yvect'] <- max(yvect, na.rm=T)
  
  MinMaxMatrix['min', 'xvect'] <- runif(1, 0.9, 1) * MinMaxMatrix['min', 'xvect']
  MinMaxMatrix['max', 'xvect'] <- runif(1, 1, 1.1) * MinMaxMatrix['max', 'xvect'] # * runif(1, 1, 1.1)
  MinMaxMatrix['min', 'yvect'] <- runif(1, 0.9, 1) * MinMaxMatrix['min', 'yvect'] # * runif(1, 1, 1.1)
  MinMaxMatrix['max', 'yvect'] <- runif(1, 1, 1.1) * MinMaxMatrix['max', 'yvect'] # * runif(1, 1, 1.1)
  return(MinMaxMatrix)  
}