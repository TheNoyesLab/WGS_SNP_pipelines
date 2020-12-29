#!/bin/bash
##PBS -l mem=22gb,nodes=1:ppn=8,walltime=4:00:00
##PBS -m abe
##PBS -M edoster@umn.edu
##PBS -q mesabi

module load sratoolkit/2.8.2
module load parallel


for sra in $(cat /tempalloc/noyes042/FMPRE_clean/Dataset_SRA/100_RUNS_EcoliShigella_Geo_SD_associated_isolates_Dec62020.txt)
do
    echo "prefetch ${sra} --max-size 50GB"
done | parallel -j 30
