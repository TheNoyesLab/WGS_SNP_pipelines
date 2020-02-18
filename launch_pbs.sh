#!/bin/bash -l
#PBS -l walltime=8:00:00,mem=5gb,nodes=1:ppn=2
#PBS -o /scratch.global/test_WGS/outfile_o_file
#PBS -e /scratch.global/test_WGS/errorfile_e_file
#PBS -q mesabi

#PBS -m abe
#PBS -M edoster@umn.edu

module purge
module load singularity

cd /scratch.global/test_WGS/WGS_SNP_pipelines

/home/noyes046/shared/tools/nextflow run main_combined_pipeline.nf --reference_genome /scratch.global/test_WGS/ref_Ecoli_NC_000913.fasta --reads '/scratch.global/test_WGS/test_genomes/*_{1,2}.fastq' -profile singularity_pbs --output /scratch.global/test_WGS/GenomeTrakr_EcoliShigella_qsub --threads 128 -w /scratch.global/test_WGS/qsub_work_small_ecoli -resume -with-report WGS_tools.report -with-trace -with-timeline
