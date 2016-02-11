
## Question 1c
labs$BMI = labs$WT/(labs$HT *labs$HT)
bmi<-data.frame(labs$BMI,labs$TC)
bmi$labs.TC <- as.numeric(bmi$labs.TC)
colnames(corr)[1] <- "BMI"
colnames(corr)[1] <- "Total Cholesterol"
cor(bmi, use="complete.obs", method="kendall") 
cor(bmi, use="complete.obs", method="pearson") 
cor(bmi, use="complete.obs", method="spearman") 


## Question 1d
#Assume Linear Model
#Discretize Catergorical Values
labs$Chinese=0
labs$Malay=0
labs$Indian=0
labs$Male=0
labs$Female =0

for(i in 1:nrow(labs)){
  if(labs$ETHNIC[i]=="C"){
    labs$Chinese[i]=1
  }
  if(labs$ETHNIC[i]=="M"){
    labs$Malay[i]=1
  }
  if(labs$ETHNIC[i]=="I"){
    labs$Indian[i]=1
  }
  if(labs$Gender[i]=="M"){
    labs$Male[i]=1
  }
  if(labs$Gender[i]=="F"){
    labs$Female[i]=1
  }
}

reg<-data.frame(labs$BMI,labs$AGE, labs$SBP,labs$TC,labs$Male,labs$Female,labs$Chinese,labs$Malay,labs$Indian)
reg$labs.TC <- as.numeric(reg$labs.TC)
reg$labs.BMI <- as.numeric(reg$labs.BMI)
reg$labs.AGE <- as.numeric(reg$labs.AGE)
reg$labs.SBP <- as.numeric(reg$labs.SBP)
reg <- setNames(reg, c("BMI","AGE","SBP","TC","Male","Female", "Chinese","Malay","Indian"))
fit <- lm(BMI ~ AGE + SBP + TC + Male + Female + Chinese + Malay + Indian, data=reg)
summary(fit) 
prediction<- (0.027*45) + (0.065*135) + (0.057*150) + 12.78 + (-0.0825) + (-1.624)
prediction
#Answer: 29.61
