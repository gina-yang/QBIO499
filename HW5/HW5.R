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
		# Get bootstrap sample
		bsample <- sample(v, replace = TRUE, prob = NULL)  
		# Get the quantity of interest
		qinterest <- FUN(bsample, ...)
		qvector[i] = qinterest  # Store in a vector
	}
	qvector <- sort(qvector, decreasing=FALSE, ...)
	percentile = 1 - (1 - confWidth) / 2  # Calculate percentile
	lower = qvector[as.integer(length(qvector) * (1 - percentile))]
	upper = qvector[as.integer(length(qvector) * (percentile))]
	confInterval <- c(lower, upper)
	return(confInterval)
}

