\name{ji.cov.ds}
\alias{ji.cov.ds}
\title{Computes the covariance of a vector or matrix}
\usage{
  ji.cov.ds(x, y = NULL,
    method = c("pearson", "kendall", "spearman"))
}
\arguments{
  \item{x}{a numeric vector, matrix or data frame.}

  \item{y}{\code{NULL} (default) or a vector, matrix or
  data frame with compatible dimensions to \code{x}}

  \item{method}{a character string indicating which
  covariance is to be computed}
}
\value{
  a covariance of \code{x} and \code{y} (or between columns
  of \code{x} and columns of \code{y})
}
\description{
  Compute the covariance of \code{x} and \code{y} if these
  are vectors. If \code{x} and \code{y} are matrices then
  the covariances between the columns of \code{x} and the
  columns of \code{y} are computed.
}
\examples{
\dontrun{
# load the file that contains the login details
library(opal)
data(logindata)

# login and assign a numeric variable to R
myvar <- list("LAB_TSC","LAB_TRIG")
opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)

# compute the variance of LAB_TSC
stat.var <- datashield.aggregate(opals, quote(ji.var.ds(D$LAB_TSC)))

# compute the variance of matrix (LAB_TSC,LAB_TRIG)
datashield.assign(opals,'dummy', quote(cbind(D$LAB_TSC,D$LAB_TRIG)))
stat.var <- datashield.aggregate(opals, quote(ji.var.ds(dummy)))
}
}
\author{
  Isaeva, J.
}

