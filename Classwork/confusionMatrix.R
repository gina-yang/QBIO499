heart = read.csv("Heart.csv")
logreg = glm(AHD~., data=heart, family=binomial)
confmx <- function(myfit, mydata, th){
	temp = predict(myfit, mydata)
	pp = exp(temp)/(1+exp(temp))
	guess = temp
	guess[pp > th] = "Yes"
	guess[pp < th] = "No"

	cm = matrix(nrow=2,ncol=2)
	truth = mydata$AHD
	cm[1,1] = sum(guess[truth == "No"] == "No", na.rm = T)
	cm[1,2] = sum(guess[truth == "No"] == "Yes", na.rm = T)
	cm[2,1] = sum(guess[truth == "Yes"] == "No", na.rm = T)
	cm[2,2] = sum(guess[truth == "Yes"] == "Yes", na.rm = T)
}

roc -< function(myfit, mydata, thvec) {
	tp = thvec
	fp = thvec
	for( i in 1:length(thvec)){
		th = thvec[i]
		cm = confmx(myfit, mydata, th)
		tp[i] = cm[2,2]/sum(cm[2,])  # True positive rate (sensitivity)
		fp[i] = cm[1,2]/sum(cm[1,])  # False positive rate (1 - specificity)
	}
}