# Progress report - June 1, 2020

**Title of proposal**: How does analytic approach impact pathogen population structure when analyzing whole genome sequence data?

**Lead Investigator**:
Noelle Noyes, Assistant Professor, Veterinary Population Medicine Department, University of
Minnesota, 1365 Gortner Avenue, St. Paul, MN 55108

Phone: 612-624-3562
Fax: 612-625-6241 Email: nnoyes@umn.edu

## Project summary
Whole Genome Sequencing (WGS) is now a common tool for outbreak detection and pathogen surveillance. However, there are still open questions regarding the most suitable, accessible and reproducible analytical approach for addressing the critical question of sequence relatedness. The overall goal of the project is to support an accurate, reproducible, transparent and uniform approach to WGS analysis for purposes of cluster detection. 

The objective of this project is to demonstrate how different analytic approaches to WGS analysis may impact subsequent population structure and cluster membership. Supporting activities are to evaluate the impacts of 1) different databases of WGS, 2) core- vs. pan-genome inclusion, and 3) genome comparison approach (i.e., using SNPs, k-mers, gene-by-gene alleles, or functional domains). The long term goal of this work is to provide concrete guidance to industry on the significance of differing WGS analysis approaches and the accessibility to adopt to a commercial workflow.

# Accomplishments for period September 2019 - May 2020

* The WGS pipelines, kSNP3, lyve-SET, CFSAN-snp, and enterobase have been "containerized" for easier use and "wrapped" into our newly developed pipeline. This means it's possible to just install two programs (singularity and nextflow) and then be able to run all 4 pipelines with a single command.
  * This is highly beneficial because one of the main challenges for using WGS pipelines is getting all of the software requirements installed and setup correctly. By using Singularity containers, we remove this hurdle and allow for the use of these 4 different pipelines without the need for individual installation of complicated software requirements. Here's an example of running the 4 pipelines with one command:
![pipeline example](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/run_WGS_pipeline_image.png)
  
* The Bionumerics software has not been tested because it is not open-source and has different costs associated with using components of the pipeline.
  * We spoke with the Bionumerics agent to discuss pricing and potential discounts.
  * The standard price for performing wgMLST on raw reads (not assembled) with Bionumerics is $8.75 per sample.
  * Even with quoting the price for analyzing 150,000 genomes, the best price available was $7/sample.
    * This price is prohibitively high considering that the cost for 150,000 genomes would be > $1 million dollars
* IBM's pipeline using functional classification for genome comparison
  * We have all of the necessary bioinformatic results from this pipeline and are now working through the statistical analysis of phylogenetic trees. 
* Genome dataset creation and ongoing bioinformatic analysis
  * The selection of 15 genome datasets was finalized.
  * To address computing challenges in running large datasets, we purchased access to a computing node with 2TB of RAM and 180 TB of storage capacity.
  * Datasets are being analyzed sequentially and this process is currently underway.
* Statistical comparison of phylogenetic trees
  * We are finalizing the workflow for comparing the phylogenetic trees resulting from WGS analysis using 4 different WGS pipelines. We are developing R scripts to automatically create summary statistics as well as convert the results from each pipeline to facilite the use with other software. Below are examples comparing phylogenetic trees from kSNP3 and enterobase.

![example_phylogenetic_stats](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/example_phylogenetic_comparisons.png)
![example_ksnp_enterobase](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/example_ksnp_vs_enterobase.png)

![example_knsp_vs_enterobase_clade](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/example_knsp_vs_enterobase_clade.png)
![example_knsp_vs_enterobase_density](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/example_knsp_vs_enterobase_density_tree.png)
![example_knsp_vs_enterobase_cladogram](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/example_knsp_vs_enterobase_cladogram.png)


