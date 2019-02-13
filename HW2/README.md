# Assignment 2: Miscellaneous Nucleotide Sequence Tools

#### 24 January 2019

Some miscellaneous tools for analyzing nucleotide strings.

`num_nucleotides(sequence)` returns a list with 4 entries denoting the number of A, C, G, and T nucleotides in the input sequence

`consec_nucleotides(sequence, n_string)` returns the number of times two consecutive nucleotides (denoted in n_string) appear in the input sequence

`all_consec_nucleotides(sequence)` returns a list with 16 entries denoting tjhe number of appearances of all possible nucleotide pairs in input sequence

This can also be run as a script, which takes in a *.fa* or *.fasta* file containing a nucleotide sequence and prints the return values of `num_nucleotides(sequence)` and `all_consec_nucleotides(sequence)` for the sequence in the file.

*Note: TODO: needs to be edited to return dictionaries instead of lists for easier viewing*
