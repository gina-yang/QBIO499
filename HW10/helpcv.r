
# the following function will do cross-validation for lda and qda
# note the two lines I have marked "# here"
# you can make minor changes to these lines in order to do cross-validation for 
# the other classifiers (logistic regression, naive Bayes, k-nearest neighbors)
# the commands for these classifiers are different enough that it is difficult
# to handle all cases just with FUN...

lda.qda.cv <- function(mydata,myformula,cvfold,ycol,FUN) {
	# mydata is the data frame
	# myformula is our formula
	# cvfold, usually 5 or 10
	# ycol index of column in mydata we are trying to predict
	# FUN lda or qda
	library(MASS)
	n = length(mydata[,1])
	rord = sample(1:n)
	sz = round(n/cvfold)
	temp = 1:cvfold
	for (j in 1:cvfold) {
			lo = ((j-1)*sz) + 1
			hi = j*sz
			if (j == cvfold) { hi = n }
			testind = rord[lo:hi]
			testset = mydata[testind,]
			trainset = mydata[-testind,]
			myfit = FUN(myformula,trainset) # here
			myguess = predict(myfit,testset)$class # here
			temp[j] = mean(myguess != mydata[testind,ycol])
	}
	cv = mean(temp)
	return(cv)
}
# > iris.lda <- lda.qda.cv(iris, Species~., 10, 5, lda)
# > iris.qda <- lda.qda.cv(iris, Species~., 10, 5, qda)


naivebayes.cv <- function(mydata,myformula,cvfold,ycol) {
	# mydata is the data frame
	# myformula is our formula
	# cvfold, usually 5 or 10
	# ycol index of column in mydata we are trying to predict
	n = length(mydata[,1])
	rord = sample(1:n)
	sz = round(n/cvfold)
	temp = 1:cvfold
	for (j in 1:cvfold) {
			lo = ((j-1)*sz) + 1
			hi = j*sz
			if (j == cvfold) { hi = n }
			testind = rord[lo:hi]
			testset = mydata[testind,]
			trainset = mydata[-testind,]
			myfit = naivebayes::naive_bayes(myformula,trainset) # here
			myguess = predict(myfit,testset, type="class") # here
			temp[j] = mean(myguess != mydata[testind,ycol])
	}
	cv = mean(temp)
	return(cv)
}
# > iris.nb <- naivebayes.cv(iris, Species~., 10, 5)


knn.cv <- function(mydata,myformula,cvfold,ycol, neighbors) {  # Optimal num of neighbors (k) = 7
	# mydata is the data frame
	# myformula is our formula
	# cvfold, usually 5 or 10
	# ycol index of column in mydata we are trying to predict
	library(caret)
	n = length(mydata[,1])
	rord = sample(1:n)
	sz = round(n/cvfold)
	temp = 1:cvfold
	for (j in 1:cvfold) {
			lo = ((j-1)*sz) + 1
			hi = j*sz
			if (j == cvfold) { hi = n }
			testind = rord[lo:hi]
			testset = mydata[testind,]
			trainset = mydata[-testind,]
			myfit = knn3(myformula, trainset, k = neighbors) # here
			myguess = predict(myfit,testset, type="class") # here
			temp[j] = mean(myguess != mydata[testind,ycol])
	}
	cv = mean(temp)
	return(cv)
}
# > iris.knn <- knn.cv(iris, Species~., 10, 5, 7)

getMean <- function(repeats){
	iris.lda <- c(0)
	iris.qda <- c(0)
	iris.knn <- c(0)
	iris.nb <- c(0)
	for( i in 1:repeats ){
		iris.lda[i] <- lda.qda.cv(iris, Species~., 10, 5, lda)
		iris.qda[i] <- lda.qda.cv(iris, Species~., 10, 5, qda)
		iris.nb[i] <- naivebayes.cv(iris, Species~., 10, 5)
		iris.knn[i] <- knn.cv(iris, Species~., 10, 5, 7)
	}
	print(mean(iris.lda))
	print(mean(iris.qda))
	print(mean(iris.knn))
	print(mean(iris.nb))
}

# plot(iris.lda, ylim=range(iris.lda, iris.qda, iris.knn, iris.nb), col="black")

plot(iris.lda, main="Misclassification error across 10 iterations of 10-fold cross-validation", xlab="Iteration", ylab="Misclassification error", ylim=range(iris.lda, iris.qda, iris.knn, iris.nb), col="black")
points(iris.qda, col='green')
lines(iris.lda)
lines(iris.qda, col='green')
points(iris.knn, col='blue')
lines(iris.knn, col='blue')
points(iris.nb, col='red')
lines(iris.nb, col='red')