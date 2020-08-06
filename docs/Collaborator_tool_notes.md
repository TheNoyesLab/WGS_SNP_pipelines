# Pickled data

Summary:
* Data is based on results from assembly of all target genomes, identification of "functional domains", and comparison of differences between:
  * Genomes from a single species
  * Functional domains across multiple species
  
Questions:
* Can you show us how you calculate the linkage scores between genomes?
* What excaly is the "linkage()" function being run on? 
  * In Jamie's example he just has matrix with 10 rows, 2 columns (adds labels for each genus seperately)
  * Each row is a genus and the columns correspond with NodeA and Node B?
  

# Comparing binary trees


Questions:
* When creating my own binary trees:
  * Does the order of the nodes matter when specifying the membership for each tree?
  * In our case, we should theoretically be testing for differences in tree topology and not necessarily it's membership since we expect most genomes to be present in both analysis (results from different tools).
    * The "root" for each tree, as defined by the code, would most often be identical.
* In the "runLinkageDemo()" function:
  * What do you mean by "positions" of the genera?
* When calculating "getMinDifference()", would we have to calculate the difference between all of the nodes in "tree2" and each node in "tree1"?
  * Would need to modify this function to accept a node from "tree2", and compare it to X number of nodes in "tree 1"?
