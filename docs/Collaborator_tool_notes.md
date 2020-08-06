
# Main questions and clarification points
Comparing trees
* How can I setup the WGS pipeline results for comparison with the "compareTrees.py" script?
  * In the "runLinkageDemo()" function:
  * What do you mean by "positions" of the genera?
    * Confirm: Does this correspond with the "edge" matrix
  * When calculating "getMinDifference()", would we have to calculate the difference between all of the nodes in "tree2" and each node in "tree1"?
    * Confirm: Goal is to modify this function to accept a single node from "tree2", and compare it to X number of nodes in "tree 1"?

Pickled data
* Confirm: What exactly is the "linkage()" function being run on? Based on some of Jamie's code, it seems like we run linkage() on the edge list of a tree?
* Confirm: If for example, we wanted to compare the results of your analysis on Salmonella genome functional domains with our other WGS pipelines. Are these the right steps:
  * We would extract the genome IDs from the Salmonella pickled data
  * Re-run the linkage() function on the subset edge list (do we need to recalculate a tree?) 
  * Convert to binary tree
  * Run with Jamie's compareTrees.py code
* Extra: 
  * Example code for heatmaps



