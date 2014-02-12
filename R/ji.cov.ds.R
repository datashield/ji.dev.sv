#'
#' @title Computes the covariance of a vector or matrix
#' @description Compute the covariance of \code{x} and \code{y} if these are vectors. 
#' If \code{x} and \code{y} are matrices then the covariances between the columns of \code{x} and the columns of \code{y} are computed.
#' @param x a numeric vector, matrix or data frame.
#' @param y \code{NULL} (default) or a vector, matrix or data frame with compatible dimensions to \code{x}
#' @param method a character string indicating which covariance is to be computed
#' @return a covariance of \code{x} and \code{y} (or between columns of \code{x} and columns of \code{y})
#' @author Isaeva, J.
#' @export
#' @examples 
#' \dontrun{
#' # load the file that contains the login details
#' library(opal)
#' data(logindata)
#' 
#' # login and assign a numeric variable to R
#' myvar <- list("LAB_TSC","LAB_TRIG")
#' opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)
#' 
#' # compute the covariance of LAB_TSC and LAB_TRIG
#' stat.cov <- datashield.aggregate(opals, quote(ji.cov.ds(D$LAB_TSC,D$LAB_TRIG)))
#' 
#' # compute the covariance matrix of concatenated vectors (LAB_TSC and LAB_TRIG)
#' datashield.assign(opals, 'dummy', quote(cbind(D$LAB_TSC,D$LAB_TRIG)))
#' stat.cov = datashield.aggregate(opals, quote(ji.cov.ds(dummy)))
#' }
#'
ji.cov.ds <- function (x, y=NULL, method = c('pearson', 'kendall', 'spearman')) {
  #   if(length(xvect) > 0 & length(xvect) < 5){
  #     stop("Operation not allowed: argument contains between 1 and 4 observations only!\n")
  #   }else{
  result <- cov(x, na.rm=TRUE, method=method) 
  #   }
  return(result)
}