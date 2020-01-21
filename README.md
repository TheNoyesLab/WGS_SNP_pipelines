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

  * Tools included:
    * [LYVE-SET](https://github.com/lskatz/lyve-SET)
    * [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
    * [KSNP3](https://sourceforge.net/projects/ksnp/files/)

  * Other GUI tools:
    * [ENTEROBASE](https://github.com/zheminzhou/EToKi)
    * [wgMLST](https://www.applied-maths.com/applications/wgmlst)



## NCBI's pathogen database and genome analysis
------------
[FAQs](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Questions.md)
[NCBI pathogen database](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Accessing_NCBI_pathogen_genomes.md)
[Using Common WGS tools](https://github.com/TheNoyesLab/WGS_SNP_pipelines/blob/master/docs/Using_common_WGS_tools.md)


# Running pipeline
------------

### Example command
```bash
nextflow run main_build_WGS_cfsan_snp.nf --reference_genome /home/enriquedoster/Documents/Projects/Mann_heim_69_genomes/genome_assemblies/ncbi-genomes-2019-08-28/GCF_007963885.1_ASM796388v1_genomic.fna --input_dir /home/enriquedoster/Documents/Projects/63_genomes/test_dir -profile singularity --output test_WGS

# Lyveset
nextflow run main_build_WGS_lyveset.nf --reference_genome /home/enriquedoster/Documents/Projects/Mann_heim_69_genomes/genome_assemblies/ncbi-genomes-2019-08-28/GCF_007963885.1_ASM796388v1_genomic.fna --input_dir /home/enriquedoster/Documents/Projects/63_genomes/test_dir -profile singularity --output test_WGS_lyve

# KSNP3

nextflow run main_build_WGS_cfsan_snp.nf --reference_genome "/scratch.global/test_WGS/ref_genome.fasta" --reads "/scratch.global/test_WGS/test_genomes/*_{1,2}.fastq" -profile singularity --output test_WGS_ksnp

# KSNP3

nextflow run main_build_WGS_ksnp3.nf --reference_genome "/scratch.global/test_WGS/ref_genome.fasta" --reads "/scratch.global/test_WGS/test_genomes/*_{1,2}.fastq" -profile singularity --output test_WGS_ksnp

```


# Documents
------------

## WGS pipeline manuscripts


## Other useful links:
https://github.com/jhcepas
