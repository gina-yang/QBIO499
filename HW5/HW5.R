# Gina Yang
# QBIO 499
# 14 February 2019

# Returns the fraction of entries in vector v greater than threshold th
fracAboveThres <- function(v, th){
	return(length(v[v > th])/length(v))
}

# Bootstrap function to calculate confidence intervals
bootstrap <- function(v, confWidth, sampleCount, FUN, ...){
	qvector <- vector(mode="numeric", length=0)
	for (i in 1:sampleCount){
		bsample <- sample(v, replace = TRUE, prob = NULL)
		qinterest <- FUN(bsample, ...)
		qvector[i] = qinterest
	}
	qvector <- sort(qvector, decreasing=FALSE, ...)
	lower = qvector[as.integer(length(qvector) * (1 - confWidth))]
	upper = qvector[as.integer(length(qvector) * (confWidth))]
	confInterval <- c(lower, upper)
	return(confInterval)
}

