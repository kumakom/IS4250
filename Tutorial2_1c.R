for(i in 1:nrow(labs)){
  if(labs$SvcSat[i]=="Y"){
    labs$Service[i]=1
  }
  if(labs$SvcSat[i]=="N"){
    labs$Service[i]=0
  }
}

corr<-data.frame(labs$Service,labs$WaitTime)
colnames(corr)[1] <- "Service"
colnames(corr)[1] <- "Wait"
cor(corr, use="complete.obs", method="kendall") 
cor(corr, use="complete.obs", method="pearson") 
cor(corr, use="complete.obs", method="spearman") 
