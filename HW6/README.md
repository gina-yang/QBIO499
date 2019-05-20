# Assignment 6: Calculating Nucleotide Diversity

#### 21 February 2019

A **single-nucleotide polymorphism (SNP)** is a substitution of a single nucleotide occuring at a specific position in the genome. Such a variation may be unique or existent in an appreciable portion of individuals in a population. Some SNPs are associated with a certain trait or disease, and these associations can be useful for determining how an individual responds to diseases, drugs, etc. SNPs are perhaps most useful as markers in **genome-wide association studies** for gene mapping related to these traits or diseases because of their quantity and stable inheritance over generations.

**Nucleotide diversity** is used to measure the degree of polymorphism within a population. It is thus a measure of genetic variation, and can be calculated by examining DNA sequences directly. A commonly used measure of nucleotide diversity is defined as the average number of nucleotide differences per site between two DNA sequences in all pairs in the sample population. 

```avgPairwiseDiv()``` calculates and returns the average pairwise nucleotide diversity between two individuals' haplotypes for ```numPairs``` of randomly chosen pairs. Call it like:

```R
mean = avgPairwiseDiv(numPairs, indivSet1, indivSet2)
```
