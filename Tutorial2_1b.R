library("Rcmdr")
library(ggplot2)

library(dplyr)  
#gender & svcsat
filter(labs, Gender == "F", SvcSat == "Y")
filter(labs, Gender == "F", SvcSat == "N")
filter(labs, Gender == "M", SvcSat == "Y")
filter(labs, Gender == "M", SvcSat == "N")

dat <- data.frame(SvcSat=c('Y','N'), Female=c(73,9), Male=c(53,16))
library(reshape2)
dat.m <- melt(dat, id.vars='SvcSat')
ggplot(dat.m, aes(variable, value)) + geom_bar(aes(fill = SvcSat), stat='identity', position = "dodge")
ggplot(dat.m, aes(x=SvcSat, y=value)) + geom_bar(aes(fill = SvcSat), stat='identity') + facet_grid(.~variable) 

#age groups & svcsat
filter(labs, AGE > 10, AGE <= 20, SvcSat == "Y")
filter(labs, AGE > 10, AGE <= 20, SvcSat == "N")
filter(labs, AGE > 20, AGE <= 30, SvcSat == "Y")
filter(labs, AGE > 20, AGE <= 30, SvcSat == "N")
filter(labs, AGE > 30, AGE <= 40, SvcSat == "Y")
filter(labs, AGE > 30, AGE <= 40, SvcSat == "N")
filter(labs, AGE > 40, AGE <= 50, SvcSat == "Y")
filter(labs, AGE > 40, AGE <= 50, SvcSat == "N")
filter(labs, AGE > 50, AGE <= 60, SvcSat == "Y")
filter(labs, AGE > 50, AGE <= 60, SvcSat == "N")
filter(labs, AGE > 60, SvcSat == "Y")
filter(labs, AGE > 60, SvcSat == "N")

dm <- data.frame(SvcSat=c('Y','N'), Age_below_20=c(7,0), Age_21to30=c(49,6), Age_31to40=c(18,1), Age_41to50=c(9,7), Age_above_60=c(6,9))
mm <- melt(dm, id.vars='SvcSat')
ggplot(mm, aes(variable, value)) + geom_bar(aes(fill = SvcSat), stat='identity', position = "dodge")

