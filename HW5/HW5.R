fracAboveThres <- function(v, th){
	return(length(v[v > 5])/length(v))
}

bootstrap <- function(v, confWidth, sampleCount, FUN, ...){
	qvector <- c(0)
	for (i in 1:sampleCount){
		bsample <- sample(x, replace = TRUE, prob = NULL)
		qinterest <- FUN(bsample, ...)
		append(qvector, qinterest, after=length(qvector))
	}
	sort(qvector)
}
