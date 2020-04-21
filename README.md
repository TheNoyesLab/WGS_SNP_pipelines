# Title of Proposal:
## How does analytic approach impact pathogen population structure when analyzing whole genome sequence data?
------------

The overall goal of this project is to support an accurate, reproducible, transparent and uniform approach to whole-genome sequence (WGS) analysis for purposes of outbreak detection and pathogen surveillance.
* The overarching objective is to demonstrate how different analytic approaches to whole-genome sequence analysis can impact analysis results.
* Supporting objectives are to evaluate the impacts:
  * dataset
  * core- vs. pan-genome inclusion
  * genome comparison approach (i.e., using SNPs, k-mers, gene-by-gene alleles, or functional domains).
* Additionally, we wil provide information regarding the usability of different WGS pipelines and NCBI's pathogen genome database.

## Table of contents
* [Study design](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Study_design.md)
* [WGS tool descriptions](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/WGS_tool_descriptions.md)
* [Installing WGS tools](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Installing_WGS_tools.md)
* [Accessing NCBI's pathogen genomes](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Accessing_NCBI_pathogen_genomes.md)
* [FAQs](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Questions.md)

## WGS analysis tools
------------
* [Tools included in the study](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/WGS_tool_descriptions.md):
  * Command-line tools
    * [LYVE-SET](https://github.com/lskatz/lyve-SET)
    * [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
    * [KSNP3](https://sourceforge.net/projects/ksnp/files/)
  * GUI tools included in the study:
    * [ENTEROBASE](https://github.com/zheminzhou/EToKi)
      * Has "EBEis" in silico serotype prediction for Escherichia coli and Shigella spp.
      * Also has "isCRISPOL" in silico prediction of CRISPOL array for Salmonella enterica serovar Typhimurium
    * [wgMLST/BioNumerics](https://www.applied-maths.com/applications/wgmlst)
 
* [Repository of useful docker containers](https://hub.docker.com/r/staphb/lyveset)


## NCBI's pathogen database and genome analysis
------------

* [FAQs](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Questions.md)
* [NCBI pathogen database](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Accessing_NCBI_pathogen_genomes.md)
* [Using Common WGS tools](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Using_common_WGS_tools.md)





# Running the pipelines with this repository
------------

* This pipeline requires singularity to be installed and available in your $PATH.


### Example command
```bash

# Main combined pipeline
# Input is paired end reads
nextflow run main_combined_pipeline.nf --reference_genome /scratch.global/Salmonella_WGS/ref_L_monocytogenes_NC_003210.fasta --reads "/scratch.global/Salmonella_WGS/List_test_genomes/*_{1,2}.fastq.gz" -profile test_singularity_pbs --output /scratch.global/Salmonella_WGS/test_GenomeTrakr_L_monocytogenes_WGS_results --threads 128 -w /scratch.global/Salmonella_WGS/work_test_qsub_l_latest -resume -with-report test_250_Listeria_WGS_tools.report -with-trace -with-timeline


# Lyveset
# Input is interleaved fastq files
nextflow run main_LYVESET.nf --reference_genome /scratch.global/Salmonella_WGS/ref_L_monocytogenes_NC_003210.fasta --interleaved_fastq "/scratch.global/Salmonella_WGS/test_GenomeTrakr_L_monocytogenes_WGS_results/Interleaved_fasta/interleaved_reads/*.fastq.gz" -profile singularity --output /scratch.global/Salmonella_WGS/test_LYVESET_250_GenomeTrakr_L_monocytogenes_WGS_results --threads 3 -w /scratch.global/Salmonella_WGS/work_250_lyveset_qsub_l_latest -resume -with-report 250_Listeria_WGS_tools.report -with-trace -with-timeline --singleEnd true

# cfsan_snp
# Input file is a directory containing one directory per sample with the corresponding paired reads
nextflow run main_CFSAN_snp.nf --reference_genome /scratch.global/Salmonella_WGS/ref_L_monocytogenes_NC_003210.fasta --fastq_dir_path '/scratch.global/Salmonella_WGS/test_GenomeTrakr_L_monocytogenes_WGS_results/Interleaved_fasta/' -profile singularity --output /scratch.global/Salmonella_WGS/test_250_GenomeTrakr_L_monocytogenes_WGS_results --threads 128 -w /scratch.global/Salmonella_WGS/work_250_qsub_l_latest -resume -with-report 250_Listeria_WGS_tools.report -with-trace -with-timeline


# KSNP3
# Input file is ".tsv" file containing a column with an absolute path to each sample file and it's sample ID
# Example below
# /path/to/file/SRR10001252.fasta    SRR10001252
nextflow run main_kSNP3.nf --reference_genome /scratch.global/Salmonella_WGS/ref_L_monocytogenes_NC_003210.fasta --genomes /scratch.global/Salmonella_WGS/WGS_SNP_pipelines/Listeria_genome_location.tsv -profile singularity_pbs --output /scratch.global/Salmonella_WGS/kSNP3_GenomeTrakr_L_monocytogenes_WGS_results --threads 128 -w /scratch.global/Salmonella_WGS/work_kSNP3_l_latest -resume -with-report kSNP3_Listeria_WGS_tools.report -with-trace -with-timeline
```


# Documents
------------

## WGS and regulations
* https://www.efsa.europa.eu/en/consultations/call/public-consultation-efsa-statement-requirements-whole-genome

## Misc resources

* Ways to compare the results from WGS pipelines
  * https://github.com/lskatz/Lyve-SET-paper/blob/master/compareSnps.sh
  * [Phylo.io](https://academic.oup.com/mbe/article/33/8/2163/2579233)
  * Timme et. al. 2019 [Phylogenomic Pipeline Validation for Foodborne Pathogen Disease Surveillance](https://jcm.asm.org/content/57/5/e01816-18)
* WGS tools to consider:
  * [Kalign 3](https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btz795/5607735?rss=1)
  * [Tormes](https://github.com/nmquijada/tormes)
  * [SPANDx](https://www.ncbi.nlm.nih.gov/pubmed/25201145)
  * wgMLST [chewBBACA](https://anaconda.org/bioconda/chewbbaca)
  * MLST [STRAIN](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-2887-1) R package
* WGS analysis
  * Core genome
    * https://www.pnas.org/content/102/39/13950
  * Pan-genome
  * MLST
    * https://pubmlst.org/
    * Enterobase
    * BioNumerics
* Other useful links:
  * https://github.com/jhcepas
