# Read data
b1 = read.table("b1.bracken", sep="\t", header=T)

# Return species greater than given threshold
aboveThres <- function(table, th){
	species = table[,1]
	freq = table[,7] 
	return(species[freq > th])
}


samp = c("1", "3", "5", "6", "7", "8", "VH")
for( i in 1:7 ){
	fin = sprintf("b%s.bracken", samp[i])
}
# Write to file
write(t(m), ncol=2, file="myout.txt", append=T)