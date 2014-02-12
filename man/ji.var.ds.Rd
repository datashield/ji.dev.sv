\name{ji.var.ds}
\alias{ji.var.ds}
\title{Computes the variance of a vector or matrix}
\usage{
  ji.var.ds(x, y = NULL)
}
\arguments{
  \item{x}{a numeric vector, matrix or data frame.}

  \item{y}{\code{NULL} (default) or a vector, matrix or
  data frame with compatible dimensions to \code{x}.}
}
\value{
  a single value if \code{x} and \code{y} are vectors and a
  matrix otherwise
}
\description{
  Computes the variance of a vector or matrix
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

