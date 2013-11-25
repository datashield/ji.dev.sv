\name{ji.changerefgroup.ds}
\alias{ji.changerefgroup.ds}
\title{changes a reference level of a factor}
\usage{
  ji.changerefgroup.ds(xvect, ref = NULL)
}
\arguments{
  \item{xvect}{a factor}

  \item{ref}{the reference level}
}
\value{
  a factor of the same length as xvect
}
\description{
  this function is similar to R function \code{relevel},
  but in addition addes numbering to the levels so that
  they are displayed in the right order when creating
  cross-tables.
}
\examples{
\dontrun{
# load the login data
data(logindata)

# login and assign specific variable(s)
myvar <- list("PM_BMI_CATEGORICAL")
library(opal)
opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)

# rename the levels of PM_BMI_CATEGORICAL and make "obesity" as a reference level
datashield.assign(opals, 'bmi_new', quote(ji.recodelevels.ds(D$PM_BMI_CATEGORICAL, newlabels=c('normal', 'overweight', 'obesity'))))
datashield.assign(opals, 'bmi_ob', quote(ji.changerefgroup.ds(bmi_new, ref='obesity')))
}
}
\author{
  Isaeva, J.
}

