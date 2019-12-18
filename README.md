# Collection of WGS SNP pipelines to analyze assembled genomes
------------

Goal: Create a pipeline that wraps popular WGS analysis tools.

  * Tools included:
    * [LYVE-SET](https://github.com/lskatz/lyve-SET)
    * [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
    * [KSNP3](https://sourceforge.net/projects/ksnp/files/)

  * Other GUI tools:
    * [ENTEROBASE](https://github.com/zheminzhou/EToKi)
    * [wgMLST](https://www.applied-maths.com/applications/wgmlst)


# Running pipeline
------------

### Example command
```bash
nextflow run main_build_WGS_cfsan_snp.nf --reference_genome /home/enriquedoster/Documents/Projects/Mann_heim_69_genomes/genome_assemblies/ncbi-genomes-2019-08-28/GCF_007963885.1_ASM796388v1_genomic.fna --input_dir /home/enriquedoster/Documents/Projects/63_genomes/test_dir -profile singularity --output test_WGS
```



# Documents
------------

## WGS pipeline manuscripts


## Other useful links:
https://github.com/jhcepas
