# Gina Yang
# QBIO 499
# 21 February 2019

pairwiseDiv <- function(individual1, individual2){
	if( sample(1:2, 1) == 1 ){
		i1hap <- as.integer(substr(data[[individual1]], 1, 1))
	} else{
		i1hap <- as.integer(substr(data[[individual1]], 3, 3))
	}
	if( sample(1:2, 1) == 1 ){
		i2hap <- as.integer(substr(data[[individual2]], 1, 1))
	} else{
		i2hap <- as.integer(substr(data[[individual2]], 3, 3))
	}
	return(sum((i1hap != i2hap)))
}

avgPairwiseDiv <- function(numPairs, indivSet1, indivSet2){
	divVec <- vector(mode="numeric", length=0)
	for( i in 1:numPairs ){
		individual1 <- sample(indivSet1, 1)
		if( missing(indivSet2) ){
			individual2 <- sample(indivSet1, 1)
		} else{
			individual2 <- sample(indivSet2, 1)
		}
		divVec[i] = pairwiseDiv(individual1, individual2)
	}
	return(mean(divVec))
}
