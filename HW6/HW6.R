pairwiseDiv <- function(individual1, individual2){
	# Takes in 2 individuals (by name) and outputs the pairwise nucleotide diversity between one haplotype from each of these individuals
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
	print(sum(!(i1hap & i2hap)))
	print(sum(!(i1hap & i2hap))/length(i1hap))
}

avgPairwiseDiv <- function(indivSet, numPairs){
	divVec <- vector(mode="numeric", length=0)
	for( i in 1:numPairs ){
		individual1 <- sample(indivSet, 1)
		individual2 <- sample(indivSet, 1)
		
		divVec[i] = pairwiseDiv(individual1, individual2)
	}
	print(mean(divVec))
	print(sd(divVec))
}

main <- function(data){
	
}