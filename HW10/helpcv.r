
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

naivebayes.cv <- function(mydata,myformula,cvfold,ycol) {
	# mydata is the data frame
	# myformula is our formula
	# cvfold, usually 5 or 10
	# ycol index of column in mydata we are trying to predict
	# FUN lda or qda
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
			myguess = predict(myfit,testset) # here
			temp[j] = mean(myguess != mydata[testind,ycol])
	}
	cv = mean(temp)
	return(cv)
}

knn.cv <- function(mydata,myformula,cvfold,ycol) {
	# mydata is the data frame
	# myformula is our formula
	# cvfold, usually 5 or 10
	# ycol index of column in mydata we are trying to predict
	# FUN lda or qda
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
			myfit = knn3(myformula, trainset, k=25) # here
			myguess = predict(myfit,testset, type="class") # here
			temp[j] = mean(myguess != mydata[testind,ycol])
	}
	cv = mean(temp)
	return(cv)
}
