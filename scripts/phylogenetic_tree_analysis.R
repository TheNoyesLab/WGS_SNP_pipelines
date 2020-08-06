library(ape)
library(phytools)
# load treespace and packages for plotting:
library(treespace)
library(phylogram)
# Set seed for reproducibility 
set.seed(1)

# Load metadata file
SRA_metadata <- read.csv("Salmonella_outbreak_SRA_metadata.csv", header = FALSE)

# Read in phylogenetic trees
lyve_tree <- read.tree(file = "../Lyveset_results/lyveset_exported_tree.nwk")
ksnp_tree <- read.tree(file = "../kSNP3_results/kSNP3_exported_tree.ML.nwk")
cfsan_tree <- read.tree(file = "../CFSAN_snp_results/cfsansnpma_preserved_consensus_tree.nwk")
enterobase_tree <- read.tree(file = "../enterobase_results/enterobase_SRA_phylo_tree.nwk")
combined_trees <- c.phylo(lyve_tree,ksnp_tree,cfsan_tree,enterobase_tree)

tree_vector <- c(lyve_tree,ksnp_tree,cfsan_tree,enterobase_tree)

## Simple tree
plotTree(lyve_tree)

## compare trees
comparePhylo(lyve_tree,ksnp_tree, plot=TRUE)
all.equal.phylo(lyve_tree,ksnp_tree)
cospeciation(lyve_tree,ksnp_tree)
cophylo()


# Compare trees with all.equal.phylo
all.equal.phylo(lyve_tree,ksnp_tree)
all.equal.phylo(lyve_tree,cfsan_tree)
all.equal.phylo(lyve_tree,enterobase_tree)
all.equal.phylo(ksnp_tree, cfsan_tree)
all.equal.phylo(ksnp_tree, enterobase_tree)
all.equal.phylo(cfsan_tree, enterobase_tree)

# Compare trees with cospeciation
cospeciation(lyve_tree,ksnp_tree, distance = c("RF","SPR"))
cospeciation(lyve_tree,cfsan_tree, distance = c("RF","SPR"))
cospeciation(lyve_tree,enterobase_tree, distance = c("RF","SPR"))
cospeciation(ksnp_tree, cfsan_tree, distance = c("RF","SPR"))
plot(cospeciation(ksnp_tree, enterobase_tree, distance = c("RF")))
cospeciation(cfsan_tree, enterobase_tree, distance = c("RF","SPR"))

# Compare trees with all.equal.phylo
comparePhylo(lyve_tree,ksnp_tree, plot=TRUE)
comparePhylo(lyve_tree,cfsan_tree, plot=TRUE)
comparePhylo(lyve_tree,enterobase_tree, plot=TRUE)
comparePhylo(ksnp_tree, cfsan_tree, plot=TRUE)
comparePhylo(ksnp_tree, enterobase_tree, plot=TRUE)
comparePhylo(cfsan_tree, enterobase_tree, plot=TRUE)


# http://phytools.org/mexico2018/ex/12/Plotting-methods.html
# Compare trees with all.equal.phylo
plot(cophylo(lyve_tree,ksnp_tree))
plot(cophylo(lyve_tree,cfsan_tree))
plot(cophylo(lyve_tree,enterobase_tree))
plot(cophylo(ksnp_tree, cfsan_tree))
obj <- cophylo(ksnp_tree, enterobase_tree, print= TRUE)
plot(cophylo(cfsan_tree, enterobase_tree))

plot(obj,link.type="curved",link.lwd=3,link.lty="solid",
     link.col="grey",fsize=0.8)
nodelabels.cophylo(which="left",frame="circle",cex=0.8)
nodelabels.cophylo(which="right",frame="circle",cex=0.8)


# SetDiff
setdiff(cfsan_tree$tip.label, ksnp_tree$tip.label)

## Check for sample matches
# Find samples not in cfsan_snp (lowest number of tips)
all_SRA_to_drop = c()

SRA_to_drop <- unique(enterobase_tree$tip.label[! enterobase_tree$tip.label %in% cfsan_tree$tip.label])
all_SRA_to_drop = c(all_SRA_to_drop,SRA_to_drop)
SRA_to_drop <- unique(enterobase_tree$tip.label[! enterobase_tree$tip.label %in% ksnp_tree$tip.label])
all_SRA_to_drop = c(all_SRA_to_drop,SRA_to_drop)

SRA_to_drop <- unique(cfsan_tree$tip.label[! cfsan_tree$tip.label %in% enterobase_tree$tip.label])
all_SRA_to_drop = c(all_SRA_to_drop,SRA_to_drop)

all_SRA_to_drop <- unique(all_SRA_to_drop)
#SRA_to_drop <- unique(cfsan_tree$tip.label[! cfsan_tree$tip.label %in% ksnp_tree$tip.label])
#SRA_to_drop <- unique(ksnp_tree$tip.label[! ksnp_tree$tip.label %in% cfsan_tree$tip.label])
#SRA_to_drop <- unique(cfsan_tree$tip.label[! cfsan_tree$tip.label %in% lyve_tree$tip.label])


lyve_tree <- drop.tip(combined_trees[[1]], all_SRA_to_drop)
ksnp_tree <- drop.tip(combined_trees[[2]], all_SRA_to_drop)
cfsan_tree <- drop.tip(combined_trees[[3]], all_SRA_to_drop)
enterobase_tree <- drop.tip(combined_trees[[4]], all_SRA_to_drop)

lyve_tree <- root(lyve_tree,1, r = TRUE)
ksnp_tree <- root(ksnp_tree,1, r = TRUE)
cfsan_tree <- root(cfsan_tree,1, r = TRUE)
enterobase_tree <- root(enterobase_tree,1, r = TRUE)

#combined_trees <- list(lyve_tree,ksnp_tree,cfsan_tree,enterobase_tree)
#combined_trees <- c.phylo(lyve_tree,ksnp_tree,cfsan_tree,enterobase_tree)
combined_trees <- c.phylo(ksnp_tree,enterobase_tree)


densityTree(combined_trees,type="cladogram",nodes="intermediate")
densityTree(combined_trees,type="cladogram",nodes="intermediate")
densityTree(combined_trees,use.edge.length=FALSE,type="phylogram",nodes="inner", alpha = 0.3)





P# Load updated metadata file 
SRA_metadata <- read.csv("SRA_present.csv", header = FALSE, stringsAsFactors = FALSE)

# Calculate related tree distance
relatedTreeDist(combined_trees, as.data.frame(SRA_metadata), checkTrees = TRUE)

write.csv(lyve_tree$tip.label, "lyve_tree_nodes.csv")
write.csv(ksnp_tree$tip.label, "ksnp3_nodes.csv")














.compressTipLabel(cfsan_tree, ref = combined_trees)

# Branch lengths
plot(compute.brlen(lyve_tree))
# Branch times
#This function computes the branch lengths of a tree giving its branching times (aka node ages or heights).
plot(compute.brtime(lyve_tree))

# dist.topo
dist.topo(combined_trees)

# Consensus
plot(consensus(lyve_tree,ksnp_tree))



# Compare Phylo
comparePhylo(lyve_tree,cfsan_tree)

plot(comparePhylo(lyve_tree,cfsan_tree))

## generate distance matrices for each section of the alignment
dist1 <- dist.dna(lyve_tree)
dist2 <- dist.dna(ksnp_tree)
## build neighbor-joining trees
phy1 <- njs(dist1)
phy2 <- njs(dist2)

dnd1 <- as.dendrogram(lyve_tree)
dnd2 <- as.dendrogram(ksnp_tree)


plotTree(enterobase_tree)
nodelabels()

# Tips to keep
tips_to_keep <- c("SRR1636582", "SRR1060677")

keep.tip(lyve_tree,tips_to_keep)
