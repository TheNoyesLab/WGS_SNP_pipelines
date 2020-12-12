#!/bin/bash
#SBATCH --job-name=WGS_pipelines
#SBATCH --partition=cn1107
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=100:00:00
#SBATCH --export=ALL
#SBATCH --mail-user=enriquedoster@gmail.com
#SBATCH --mail-type=ALL

module load jdk/1.8.0
module load singularity/2.5.2

nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta \ 
--reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity \ 
--output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100_Salm_HighQuality_IBM_WGS_results --threads 20 \
-w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/workSalm_HighQuality_IBM -resume -with-report Salm_HighQuality_IBM_WGS_tools.report \
-with-trace -with-timeline --species salmonella_enterica
