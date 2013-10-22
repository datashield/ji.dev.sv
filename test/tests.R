# load required libraries
library(RCurl)
library(rjson)
library(opal)
library(opaladmin)

# log in to opals
server1 <- opal.login('administrator', 'password', 'http://54.242.140.255')
server2 <- opal.login('administrator', 'password', 'http://54.242.46.59')
server3 <- opal.login('administrator', 'password', 'http://23.22.215.42')
opals <- list(server1,server2,server3)
names(opals) <- c("Study1", "Study2", "Study3")

# assign data to opals
datashield.assign(server1, 'D', 'CNSIM.CNSIM')
datashield.assign(server2, 'D', 'CNSIM.CNSIM')
datashield.assign(server3, 'D', 'CNSIM.CNSIM')

# install respective R package (remove the previous version if needed)
dsadmin.remove_package(opals, 'ji.dev.sv')
dsadmin.install_package(opals, 'ji.dev.sv', ref='master')

# generate a density grid matrix
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL)))
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL, x.min=3))) # should not work as limits=F

# generate a density grid matrix with defined limits
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL, limits=T))) # should not work without defined limits
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL, limits=T, x.min=1,x.max=11,y.min=0,y.max=3)))
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL, limits=T, x.min=1,x.max=11,y.min=0,y.max=3, numints=15)))
datashield.aggregate(opals, quote(ji.densitygrid.ds(D$LAB_TSC, D$LAB_HDL, limits=T, x.min=1,x.max=11,y.min=0,y.max=3, numints=25)))


# generate a categorical variable out of a continuous
datashield.aggregate(opals, quote(class(D$PM_BMI_CONTINUOUS)))
datashield.assign(opals, 'bmi_categorical', quote(cut(D$PM_BMI_CONTINUOUS, breaks=c(18,25,30))))
datashield.assign(opals, 'bmi_categorical', quote(cut(D$PM_BMI_CONTINUOUS, breaks=c(0,18,25,30,60),
                                                      labels=c('underweight', 'normal', 'overweight', 'obesity'))))
datashield.aggregate(opals, quote(table1d.ds(bmi_categorical)))