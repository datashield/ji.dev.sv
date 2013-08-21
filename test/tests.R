# load required libraries
library(RCurl)
library(rjson)
library(opal)
library(opaladmin)

# log in to opals
o1<-opal.login('administrator', 'password', 'http://54.242.140.255')
o2<-opal.login('administrator', 'password', 'http://54.242.46.59')
opals<-list(o1, o2)
names(opals)<-c('Study 1', 'Study 2')

# assign data to opals
datashield.assign(opals[[1]], 'D', 'HOPsim.hopsim1ob')
datashield.assign(opals[[2]], 'D', 'HOPsim.hopsim2ob')

# install respective R package (remove the previous version if needed)
# dsadmin.remove_package(opals, 'ji.dev.sv')
dsadmin.install_package(opals, 'ji.dev.sv', ref='master')

# test the density grid function
datashield.aggregate(opals, quote(ji.griddensitylim.ds(D$sbp, D$glu,x.min=80,x.max=200,y.min=4,y.max=9)))
datashield.aggregate(opals, quote(ji.griddensitylim.ds(D$sbp, D$glu,x.min=80,x.max=200,y.min=4,y.max=9, numints=15)))
datashield.aggregate(opals, quote(ji.griddensitylim.ds(D$sbp, D$glu,x.min=80,x.max=200,y.min=4,y.max=9, numints=25)))
