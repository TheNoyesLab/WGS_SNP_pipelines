
# Study goals
* The overall goal of this project is to support an accurate, reproducible, transparent and uniform approach to whole-genome sequence (WGS) analysis for purposes of outbreak detection and pathogen surveillance.
* The overarching objective is to demonstrate how different analytic approaches to whole-genome sequence analysis can impact analysis results.
* Supporting objectives are to evaluate the impacts of 
  * 1) dataset
  * 2) core- vs. pan-genome inclusion
  * 3) genome comparison approach
    * SNP-based
      * LYVE-set
      * CFSAN
    * k-mers
      * kSNP3
    * gene-by-gene allelic comparison (core genome or whole genome MLST comparison)
      * BioNumerics
      * Enterobase (plus Moura et al. Whole genome-based population biology and epidemiological surveillance of Listeria monocytogenes)
    * functional domains
      * IBM software
* To accomplish our overall objective, we will compare the results of this systematic analytic experiment across datasets, genomic content (i.e., core- versus pan-genome), and analytic approaches.

# Study design
* Generate 15 datasets (5 per species)
  * We will have a total of 15 test datasets -- three high-quality, nine uniform (three each for host species, geography and sample type), and three random.
  * Species
    * *Salmonella enterica*
    * *Escherichia coli* and Shigella
    * *Listeria monocytogenes*
  * Dataset types
    * High-quality datasets
      * Genomes selected that meet rigorous quality control standards to investigate the effect of sequence data quality on the analytic results
    * Uniform datasets
      * Same host species (host species with most isolates)
      * Same geography (geographic region with most isolates)
      * Same sasmple type (sample type with most isolates)
    * Random datasets
      * Sequence data randomly selected from the pathogen databases, using a random number generator. This will serve as the "control" dataset.
* Each of the 15 test datasets will be analyzed to identify their core genomes and pangenomes.
* The core genome and pangenome of each of the 15 datasets (N=30 sets of results) will be subjected to each of the four comparative approaches.

![study design overview](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Misc_files/WGS_overview_experimental_design.PNG)

  
# Analysis of results
* For each approach and dataset, phylogenetic trees and clustering algorithms will be applied to the output (Newick and VCF files), in order to identify population structure and clusters based on relatedness.
  * The same phylogenetic tree and clustering algorithms will be used on each dataset to enable appropriate comparisons.
    * Cherry, J. L. 2017. A practical exact maximum compatibility algorithm for reconstruction of recent evolutionary history. BMC Bioinformatics 18:127.
* Metadata for each isolate will be obtained from the NCBI Pathogen Detection database, and overlayed onto the naïve population structure to determine whether clustering falls along known isolate characteristics.
* Results of each approach will be interpreted in detail, with in-depth discussion of potential implications for regulatory processes and outbreak detection.
  * To compare results across datasets and approaches, we will compare both phylogenetic trees and genomic distances as per Katz et al.
    * Katz et. al. (2017): A Comparative Analysis of the Lyve-SET Phylogenomics Pipeline for Genomic Epidemiology of Foodborne Pathogens
    * Discrepancies between results will be interrogated manually to understand potential applicability to outbreak investigations and/or surveillance efforts.
* Expeced results:
  * How does WGS dataset quality impact WGS analysis results? (“High-quality” versus “Random” dataset comparison)
  * How does a more uniform WGS dataset impact WGS analysis results? (“Uniform” versus “Random” datasets comparison)
  * How does use of a core- versus pan-genome impact WGS analysis results?
  * How does analytic approach (SNP, k-mer, gene-by-gene or function) impact WGS analysis results?
  * How do all of the above considerations differ by pathogen?
  * Is a functional (i.e., domain vector) approach potentially more useful, extendable and representative than current approaches?
