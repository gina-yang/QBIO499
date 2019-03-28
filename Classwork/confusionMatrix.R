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