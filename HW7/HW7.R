getGroup <- function(toGroup, posVec){
	grouping <- c(0)
	count = 1
	for( i in posVec ){
		grouping[count] = toGroup[i]
		count = count + 1
	}
	return(grouping)
}

testVariance <- function(snp, trait){
	# Split individuals based on genotype. 
	# Each vector contains the (column) positions of these individuals
	domPos = which(snp == "1|1") 
	addPos = which(snp %in% c("1|0", "0|1"))
	recPos = which(snp == "0|0") 

	# Group individuals based on phenotype.
	domGroup = getGroup(trait, domPos)
	addGroup = getGroup(trait, addPos)
	recGroup = getGroup(trait, recPos)

	print(mean(domGroup))
	print(mean(addGroup))
	print(mean(recGroup))
}

main <- function(genotypes, phenotypes){
	for( i in range(2, 4) ){
		# Get traits 
		trait = as.vector(phenotypes[i, 10:90],mode="numeric")
		for( j in range(1,2) ){
			# Get SNPs
			snp = as.vector(unlist(genotypes[j, 10:90]))
			testVariance(snp, trait)
		}
	}
}

