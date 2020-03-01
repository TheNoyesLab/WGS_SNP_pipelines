#!/bin/bash -l
#PBS -l walltime=96:00:00,mem=5gb,nodes=1:ppn=2
#PBS -o /scratch.global/test_WGS/outfile_o_file
#PBS -e /scratch.global/test_WGS/errorfile_e_file
#PBS -q mesabi

#PBS -m abe
#PBS -M edoster@umn.edu

module purge
module load singularity

cd /scratch.global/Salmonella_WGS/WGS_SNP_pipelines

/home/noyes046/shared/tools/nextflow run main_combined_pipeline.nf --reference_genome /scratch.global/Salmonella_WGS/Senterica_LT2_ref_genome.fasta --reads '/scratch.global/Salmonella_WGS/all_genomes/*_{1,2}.fastq.gz' -profile singularity_pbs --output /scratch.global/Salmonella_WGS/allSources_Salmonella_WGS_results --threads 128 -w /scratch.global/Salmonella_WGS/qsub_work_salmonella -resume -with-report Salmonella_WGS_tools.report -with-trace -with-timeline
