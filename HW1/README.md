# Assignment 1: Identifying open reading frames

#### 16 January 2019

This script identifies all open reading frames (ORFs) in an input nucleotide sequence and its reverse complement. An ORF begins with the start codon **ATG** and ends in-frame with one of the stop codons **TAA**, **TAG**, **TGA**.

Required inputs: An *.fa* or *.fasta* file containing a nucleotide sequence string, along with the number of simulations to run. During each simulation, the input sequence is shuffled, and the longest ORF out of all shufflings is found (this is known as the threshold). To eliminate very short ORFs, only the ORFs longer than this threshold are returned.

The script outputs the threshold, the starting and ending positions of each ORF longer than the threshold, +1 (if ORF was found in the forward direction) or -1 (if ORF was found in the reverse complement), and finally the ORF itself.

The getthresh() and printORF2d() functions can also be called manually on a nucleotide string as 

&gt;&gt;&gt;threshold = getthresh(sequenceString, numSimulations)

&gt;&gt;&gt;printORF2d(sequenceString, threshold)

where sequenceString is the nucleotide string and numSimulations denotes the number of simulations to run.


*Note: the script slows significantly as the number of simulations increases. This is due to the inefficiency of shuffling a long string.*
