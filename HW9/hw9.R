# Gina Yang
# QBIO 499
# 28 March 2019
# HW9

> park <- read.csv("parkinsons_updrs.data")
> formula <- as.formula((paste("motor_UPDRS~",paste(colnames(park[7:22]),collapse="+"))))
> lm.fit <- lm(formula, data=park)
> ff = regsubsets(formula, data=park, method="forward")

cv10f <- function(data, model){
	# Shuffle data
	data<-data[sample(nrow(data)),]
	# Create 10 equally sized groups (folds)
	folds <- cut(seq(1,nrow(data)),breaks=10,labels=FALSE)
	# Perform 10-fold cross validation
	EMSE = 0
	mse_vec <- c(0)
	for(i in 1:10){
		testIndexes <- which(folds==i,arr.ind=TRUE)
		testData <- data[testIndexes, ]
		trainData <- data[-testIndexes, ]
		lm.fit <- lm(model, data=trainData)
		MSE <- mean((data$motor_UPDRS - predict(lm.fit, newdata = testData))^2)
		mse_vec[i] = MSE
	}
	return(mean(mse_vec))
}

> amse_vec <- c(0)
> amse_vec[1] = cv10f(park, motor_UPDRS~PPE)
> amse_vec[2] = cv10f(park, motor_UPDRS~PPE+DFA)
> amse_vec[4] = cv10f(park, motor_UPDRS~PPE+DFA+Jitter.Abs.+HNR)
> amse_vec[8] = cv10f(park, motor_UPDRS~PPE+DFA+Jitter.Abs.+HNR+NHR+Jitter...+Shimmer.DDA+Shimmer.APQ11)
> amse_vec[16] = cv10f(park, formula)

> plot(amse_vec, xlab="number regression terms included", ylab="MSE", main="Parkinsons: 10-fold Cross-validation" )

