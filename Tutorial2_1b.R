library("Rcmdr")
library(ggplot2)

library(dplyr)    
filter(labs, Gender == "F", SvcSat == "Y")
filter(labs, Gender == "F", SvcSat == "N")
filter(labs, Gender == "M", SvcSat == "Y")
filter(labs, Gender == "M", SvcSat == "N")

dat <- data.frame(SvcSat=c('Y','N'), Female=c(73,9), Male=c(53,16))
library(reshape2)
dat.m <- melt(dat, id.vars='SvcSat')
ggplot(dat.m, aes(variable, value)) + geom_bar(aes(fill = SvcSat), stat='identity', position = "dodge")
ggplot(dat.m, aes(x=SvcSat, y=value)) + geom_bar(aes(fill = SvcSat), stat='identity') + facet_grid(.~variable) 
