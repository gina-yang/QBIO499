

testVariance <- function(snpRow){
	# Split individuals based on genotype. 
	# Each vector contains the (column) positions of these individuals in the csv file
	dom = which(snpRow == "1|1") + 9
	het = which(snpRow %in% c("1|0", "0|1")) + 9
	rec = which(snpRow == "0|0") + 9
	
}

# Get traits 
trait1 = as.vector(y[2,10:90], mode="numeric")
trait2 = as.vector(y[3,10:90], mode="numeric")
trait3 = as.vector(y[4,10:90], mode="numeric")

# get SNPs
snpRow = as.vector(unlist(x[1, 10:90]))