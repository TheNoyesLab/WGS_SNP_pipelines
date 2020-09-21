#!/bin/bash

##PBS -l mem=22gb,nodes=1:ppn=8,walltime=2:00:00
##PBS -m abe
##PBS -M edoster@umn.edu
##PBS -q mesabi

module load sratoolkit/2.8.2
module load parallel

cd /tempalloc/noyes042//Rumen_data/bovine_samples

for sra in $(find /tempalloc/noyes042/edoster_sra/sra/ -name '*.sra' | sort -V)
do
    echo "fastq-dump --split-files --gzip ${sra}"
done | parallel -j 50
