> park <- read.csv("parkinsons_updrs.data")
> formula <- as.formula((paste("motor_UPDRS~",paste(colnames(park[7:22]),collapse="+"))))
> glm.fit = glm(formula, data=park)
> ff = regsubsets(formula, data=park, method="forward")

cv <- function(data, model){
	# Randomly shuffle the data
	data<-data[sample(nrow(data)),]
	# Create 10 equally sized groups (folds_
	folds <- cut(seq(1,nrow(data)),breaks=10,labels=FALSE)
	# Perform 10-fold cross validation
	for(i in 1:10){
		testIndexes <- which(folds==i,arr.ind=TRUE)
		testData <- data[testIndexes, ]
		trainData <- data[-testIndexes, ]
		lm.fit <- lm(model, data=trainData)
		# newY <- sample(data$motor_UPDRS, length(predict(lm.fit, newData = testData)))
		EMSE <- mean((data$motor_UPDRS - predict(lm.fit, newdata = testData))^2)
		print(EMSE)
	}
}
