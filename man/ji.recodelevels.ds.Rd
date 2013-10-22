\name{ji.recodelevels.ds}
\alias{ji.recodelevels.ds}
\title{recodes a categorical variable}
\usage{
  ji.recodelevels.ds(xvect, newlabels)
}
\arguments{
  \item{xvect}{a factor}

  \item{newlabels}{a string vector with new labels for the
  levels}
}
\value{
  a factor vector with new labels for levels
}
\description{
  this function recodes levels of a categorical variable
  with new given labels.
}
\examples{
\dontrun{
# load the login data
data(logindata)

# login and assign specific variable(s)
myvar <- list("PM_BMI_CATEGORICAL")
library(opal)
opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)

# get the range of the variable 'LAB_HDL'
datashield.aggregate(opals, quote(range.ds(D$LAB_HDL)))
}
}
\author{
  Isaeva, J.
}

