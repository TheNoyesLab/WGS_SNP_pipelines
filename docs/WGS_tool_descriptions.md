# Command line tools


## LYVE-set
* The CDC published Lyve-SET as an update to SET. 
* [LYVE-SET](https://github.com/lskatz/lyve-SET)
  * Docker hub website contains many useful docker containers:
    * https://hub.docker.com/r/staphb/lyveset
  * https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5346554/
    *  Lyve-SET requires as input a set of raw reads
    * phylogenetically related reference genome assembly
  * Overview:
    * Lyve-SET is a high quality SNP (hqSNP) pipeline, designed to remove lower-quality SNPs from its analysis and increase phylogenetic signal.
    * Lyve-SET has its origins in the original SET algorithm described in Katz et al. (2013).
      * Major changes in Lyve-SET compared to SET include:
        * integrated read cleaning and phage masking
        * the use of VarScan instead of FreeBayes for SNP calling
        * improved production of intermediate files in standard formats
        * the use of RAxML v8 to infer trees instead of PhyML (Guindon et al., 2010; Garrison and Marth, 2012; Koboldt et al., 2012; Stamatakis, 2014). The source code is available at https://github.com/lskatz/Lyve-SET (v1.1.4f, doi: 10.5281/zenodo.163647).
.
      * Lyve-SET has only been tested with Illumina reads and default settings are optimized for Illumina data, but it can accept FASTQ files from any platform. 


## CFSAN-snp
* The FDA uses a core genome SNP-based approach with CFSAN-snp.
* [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
  * https://www.ifsh.iit.edu/sites/ifsh/files/departments/James_Pettengill.pdf

## kSNP3
* [kSNP3](https://sourceforge.net/projects/ksnp/files/)
  * kSNP identifies the pan-genome SNPs in a set of genome sequences, and estimates phylogenetic trees based upon those SNPs. SNP discovery is based on k-mer analysis, and requires no multiple sequence alignment or the selection of a reference genome, so kSNP can take 100's of microbial genomes as input. A SNP locus is defined by an oligo of length k surrounding a central SNP allele. kSNP can analyze both complete (finished) genomes and unfinished genomes in assembled contigs or raw, unassembled reads. Finished and unfinished genomes can be analyzed together, and kSNP can automatically download Genbank files of the finished genomes and incorporate the information in those files into the SNP annotation
* Personal opinion comments
  * Easy to install, but not available as an anaconda package. 
  * Does not provide any useful warnings if an error is caused.
  
  
## IBM functional approach
* This approach uses IBM's OMXWare software.
* IBM Research (co-investigator) has assembled and annotated over 166,000 high-quality
bacterial genomes. 
  * This annotation revealed over 46 million genes, over 33.5 million proteins, and over 138 million protein domains with associated functional codes (e.g., stress response, virulence, DNA replication, antimicrobial resistance, etc…) across more than 500 bacterial genera.
  * Following the addition of domains for each WGS dataset, we will create a vector representing within-protein domains and/or the frequency of their functional annotations for each WGS observation.
    * Domains are distinct and independent subsections of proteins; a single protein can contain multiple domains, and a single domain can be found in multiple proteins.
    * This approach, which replaces the nucleotide sequence with a “functional capacity vector”, not only provides a high level of dimensionality reduction (to aid in computational feasibility), but it also replaces the genotypic representation (raw sequence) with a phenotypic representation of the same data.
  * We will use this annotation scheme to create a domain vector for the highest quality WGS observations in our 15 test datasets, and then we will use this domain vector to compare sequences (and functions) across WGS observations.

-----
# GUI tools

## Enterobase
* [ENTEROBASE](https://github.com/zheminzhou/EToKi)

## BioNumerics
* PulseNet International has recommended a so-called whole-genome MLST approach (wgMLST) in which genomes are compared on a gene-by-gene basis.
* [wgMLST/BioNumerics](https://www.applied-maths.com/applications/wgmlst)
  * Cost
    * The job options in the wgMLST client are as follows (if your genomes are already assembled then you will only need the assembly-based BLAST allele finder):
      * (We only typically allow the evaluation of a maximum of 2 organisms at a time)
      * De novo assembly (1 credit)
      * BLAST allele finder, on the assembled genome (3 credits)
      * Assembly-free allele finder, on the reads themselves (3 credits)
      * Reference mapping for cloud based wgSNP analysis, if interested (1 credit) 
      * We have given you 50 free credits for use during your evaluation, per project. Afterwards, credits are $1.25 per credit, or $8.75 per wgMLST sample from soup to nuts..

-----
# Other tools
* NCBI utilizes a WGS “Pathogen Detection System” that seems to combine SNPs and k-mers, although it is unclear how these are used because the website states that “Details of the analysis system will be published at a future date 
  * www.ncbi.nlm.nih.gov/pathogens/about/.
