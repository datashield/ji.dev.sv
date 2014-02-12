#'
#' @title Computes the variance of a vector or matrix
#' @param x a numeric vector, matrix or data frame.
#' @return a single value if \code{x} is a vector and a covariance matrix if \code{x} is a matrix
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
#' # compute the variance of LAB_TSC
#' stat.var <- datashield.aggregate(opals, quote(ji.var.ds(D$LAB_TSC)))
#' 
#' # compute the variance of matrix (LAB_TSC,LAB_TRIG)
#' stat.var <- datashield.aggregate(opals, quote(ji.var.ds(cbind(D$LAB_TSC,D$LAB_TRIG)))
#' }
#'
ji.var.ds <- function (x) {
#   if(length(xvect) > 0 & length(xvect) < 5){
#     stop("Operation not allowed: argument contains between 1 and 4 observations only!\n")
#   }else{
    result <- var(x, na.rm=TRUE) 
#   }
  return(result)
}