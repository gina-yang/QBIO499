# Assignment 4: Unweighted Pair Group with Arithmetic Mean (UPGMA) Algorithm

#### 7 February 2019
 
The [UPGMA algorithm](https://www.sequentix.de/gelquest/help/upgma_method.htm) is a distance analysis method that can be used for constructing phylogenetic trees. The "unweighted" refers to the fact that all distances contribute equally to each average calculated in the algorithm. However, note that UPGMA can often be inaccurate because it assumes a constant rate of evolution (aka the molecular clock hypothesis).

The algorithm (in HW4.py) can be called with:

```Python
outputTree = upgma(speciesList, distancesMatrix)
```

`speciesList` is a list of trees represented by tuples. `distancesMatrix` is a dictionary specifying pairwise distances between species. Each key is a tuple consisting of a pair of trees (ex. `(("species A", (), ()), ("species B", (), ())`) and the value represents their pairwise distance. Examples can be found in mitodata.py. Finally, the output `outputTree` is a tuple of the form `(name, leftTree, rightTree)`, representing the final tree consisting of all the species in `speciesList`. 

The algorithm sucessively merges the two trees with the smallest distance into a new tree and recalculating the distance values between the new tree and the rest of the trees. When one tree remains, it is returned as the final phylogenetic tree consisting of all input species.
