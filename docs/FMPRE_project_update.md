# Progress report - June 1, 2020

**Title of proposal**: How does analytic approach impact pathogen population structure when analyzing whole genome sequence data?

**Lead Investigator**:
Noelle Noyes, Assistant Professor, Veterinary Population Medicine Department, University of
Minnesota, 1365 Gortner Avenue, St. Paul, MN 55108
Phone: 612-624-3562 Fax: 612-625-6241 Email: nnoyes@umn.edu

## Project summary
Whole Genome Sequencing (WGS) is now a common tool for outbreak detection and pathogen surveillance. However, there are still open questions regarding the most suitable, accessible and reproducible analytical approach for addressing the critical question of sequence relatedness. The overall goal of the project is to support an accurate, reproducible, transparent and uniform approach to WGS analysis for purposes of cluster detection. 

The objective of this project is to demonstrate how different analytic approaches to WGS analysis may impact subsequent population structure and cluster membership. Supporting activities are to evaluate the impacts of 1) different databases of WGS, 2) core- vs. pan-genome inclusion, and 3) genome comparison approach (i.e., using SNPs, k-mers, gene-by-gene alleles, or functional domains). The long term goal of this work is to provide concrete guidance to industry on the significance of differing WGS analysis approaches and the accessibility to adopt to a commercial workflow.

## Accomplishments for period September 2019 - May 2020


WGS pipelines
  * The Bionumerics software has not been tested as it not open-source and has different costs associated with different components of the pipeline.
    * We spoke with the Bionumerics agent to discuss pricing and potential discounts.
    * The standard price for performing wgMLST on raw reads (not assembled) with Bionumerics is $8.75 per sample.
    * Even with quoting the price for analyzing 150,000 genomes, the best price available was $7/sample.
      * This price is prohibitively high considering that the cost for 150,000 genomes would be > $1 million dollars.
  * IBM's pipeline for genome comparison
    * We have all of the necessary bioinformatic results from this pipeline and are now working through the statistical analysis of phylogenetic trees.
  * All other pipelines including kSNP3, lyve-SET, CFSAN-snp, and enterobase have been "containerized" for easier use. In combination with our newly developed pipeline, it's possible to install two programs 
  (singularity and nextflow) and be able to run all 4 pipelines with a single command. This is highly beneficial because one of the first challenges for using WGS pipelines is getting all of the software requirements. By using Singularity containers, we remove this hurdle and allow for the use of these 4 different pipelines, which each require different software tools, without the need for individual installation.
  
Analyzing WGS results
  
  
Dataset creation and ongoing analysis
  * As proposed, the selection of 15 different datasets was finalized.
  * Datasets are being analyzed sequentially
  * The first dataset is currently being analyzed.
