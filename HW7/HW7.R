# Gina Yang
# QBIO499
# 28 February 2019

# The null hypothesis of an ANOVA using a single SNP is that there is no difference 
# between the trait means of any genotype group (homozygous dominant, heterozygous, homozygous recessive)

# Use a position vector and an input vector to isolate into another vector the elements
# with positions in the position vector
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
	hetPos = which(snp %in% c("1|0", "0|1"))
	recPos = which(snp == "0|0") 

	# Group individuals based on phenotype.
	domGroup = getGroup(trait, domPos)
	hetGroup = getGroup(trait, hetPos)
	recGroup = getGroup(trait, recPos)

	g <- factor(rep(letters[1:3], c(length(domGroup), length(hetGroup), length(recGroup))),)
	test = aov(trait~g)
	pval = summary(test)[[1]][["Pr(>F)"]]
	return(pval)
}

main <- function(){
	genotypes = read.csv("geno-hw7.csv", header=T)
	phenotypes = read.csv("pheno-hw7.csv", header=T)
	for( i in 1:3 ){
		# Get traits 
		trait = as.vector(phenotypes[i, 10:90],mode="numeric")
		v <- c(0)
		for( j in 1:81 ){
			# Get SNPs
			snp = as.vector(unlist(genotypes[j, 10:90]))
			pval = testVariance(snp, trait)
			v[j] = pval
		}
		sigSNPLoc = which(v < 0.05)
		names = as.vector(unlist(genotypes[sigSNPLoc, 3]))
		print(names)
	}
}

