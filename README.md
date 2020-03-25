# Collection of WGS SNP pipelines to analyze assembled genomes
------------

Title of Proposal: How does analytic approach impact pathogen population structure when analyzing whole genome sequence data?

"The overall goal of this project is to support an accurate, reproducible, transparent and uniform approach to whole-genome sequence (WGS) analysis for purposes of outbreak detection and pathogen surveillance.
* The overarching objective is to demonstrate how different analytic approaches to whole-genome sequence analysis can impact analysis results.
* Supporting objectives are to evaluate the impacts:
  * dataset
  * core- vs. pan-genome inclusion
  * genome comparison approach (i.e., using SNPs, k-mers, gene-by-gene alleles, or functional domains).
* Additionaly, we wil provide information regarding the usability of different WGS pipelines and NCBI's pathogen genome database.

  * Tools included in the study:
    * [LYVE-SET](https://github.com/lskatz/lyve-SET)
      * https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5346554/
    * [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
      * https://www.ifsh.iit.edu/sites/ifsh/files/departments/James_Pettengill.pdf
    * [KSNP3](https://sourceforge.net/projects/ksnp/files/)
      * kSNP identifies the pan-genome SNPs in a set of genome sequences, and estimates phylogenetic trees based upon those SNPs. SNP discovery is based on k-mer analysis, and requires no multiple sequence alignment or the selection of a reference genome, so kSNP can take 100's of microbial genomes as input. A SNP locus is defined by an oligo of length k surrounding a central SNP allele. kSNP can analyze both complete (finished) genomes and unfinished genomes in assembled contigs or raw, unassembled reads. Finished and unfinished genomes can be analyzed together, and kSNP can automatically download Genbank files of the finished genomes and incorporate the information in those files into the SNP annotation
  * GUI tools included in the study:
    * [ENTEROBASE](https://github.com/zheminzhou/EToKi)
    * [wgMLST](https://www.applied-maths.com/applications/wgmlst)


## NCBI's pathogen database and genome analysis
------------

* [FAQs](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Questions.md)
* [NCBI pathogen database](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Accessing_NCBI_pathogen_genomes.md)
* [Using Common WGS tools](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Using_common_WGS_tools.md)





# Running pipeline
------------

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

## WGS pipeline manuscripts


## WGS and regulations
* https://www.efsa.europa.eu/en/consultations/call/public-consultation-efsa-statement-requirements-whole-genome

## Misc resources

* Ways to compare the results from WGS pipelines
  * https://github.com/lskatz/Lyve-SET-paper/blob/master/compareSnps.sh
  * [Phylo.io](https://academic.oup.com/mbe/article/33/8/2163/2579233)
* WGS tools to consider:
  * [Kalign 3](https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btz795/5607735?rss=1)
  * [Tormes](https://github.com/nmquijada/tormes)
  * [SPANDx](https://www.ncbi.nlm.nih.gov/pubmed/25201145)
* Other useful links:
  * https://github.com/jhcepas
