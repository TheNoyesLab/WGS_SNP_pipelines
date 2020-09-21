#!/bin/bash
##PBS -l mem=22gb,nodes=1:ppn=8,walltime=4:00:00
##PBS -m abe
##PBS -M edoster@umn.edu
##PBS -q mesabi

module load sratoolkit/2.8.2
module load parallel

cd /tempalloc/noyes042/WGS_project/

for sra in $(cat /panfs/roc/groups/11/noyes046/shared/projects/WGS_project/genome_runs/rumen_bovine.csv)
do
    echo "prefetch ${sra} --max-size 50GB"
done | parallel -j 30
