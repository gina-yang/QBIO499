# Gina Yang
# QBIO 499
# Assignment 4

def dist(tree1, tree2, distances):
    """Helper fn to find the distance between two input trees within the distances dictionary"""
    for key in distances:
        if key == (tree1, tree2) or key == (tree2, tree1):
            return distances.get(key)
    print("Err: tree pair not found in dict")
    return -1

def countLeaves(tree):
    """Helper fn to recursively count the number of leaves in input tree"""
    if tree[1] == ():
        return 1
    else:
        return countLeaves(tree[1]) + countLeaves(tree[2])

def findClosestPair(speciesList, distances):
    """Finds and returns the pair of trees with the least distance"""
    min_val = 1000.0
    min_key = (((), (), ()), ((), (), ()))
    for i in speciesList:
        for j in speciesList:
            if (i, j) in distances:
                if 0 < distances.get((i, j)) < min_val:
                    min_key = (i, j)
                    min_val = distances.get((i, j))
    return min_key

def updateDist(speciesList, distances, newTree):
    """Updates distance dictionary with new values from the generated tree"""
    n_i = newTree[1]
    n_j = newTree[2]
    for tree in speciesList:
        i_leaves = countLeaves(n_i)
        j_leaves = countLeaves(n_j)
        # Calculate distance
        new_dist = (dist(n_i, tree, distances) * i_leaves) + (dist(n_j, tree, distances) * j_leaves) / (i_leaves + j_leaves)
        distances[newTree, tree] = new_dist  # Add calculated distance to distances dictionary

def upgma(speciesList, distances):
    """Returns best tree generated by the UPGMA algorithm"""
    while len(speciesList) > 1:
        closest_pair = findClosestPair(speciesList, distances)
        cp_distance = dist(closest_pair[0], closest_pair[1], distances)
        newTree = (cp_distance / 2, closest_pair[0], closest_pair[1])  # Creates tuple (dist/2, tree_i, tree_j)
        # Remove the merged nodes from list
        speciesList.remove(closest_pair[0])
        speciesList.remove(closest_pair[1])
        updateDist(speciesList, distances, newTree)
        speciesList.append(newTree)
    return speciesList[0]
