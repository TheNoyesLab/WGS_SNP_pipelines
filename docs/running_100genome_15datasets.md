# Notes on running the 100 genome subsets for all 15 datasets

-----
# 100 genome subsets


# E coli
### 100 genome subset - E coli - Host bovine associated
Started Nov-27 17:40:30 CST
Moved final results to: /tempalloc/noyes042/FMPRE_clean/ALL_results/100_genome_results/100_genome_Ecoli_Host_bovine_WGS_results

```
Nov-27 17:40:30.349 [main] DEBUG nextflow.cli.Launcher - $> nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_host_cattle/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/E_coli_Host_bovine_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_host -resume -with-report Ecoli_host_WGS_tools.report -with-trace -with-timeline --species escherichia_coli

# lyveset error
# Trimming step was frozen on a sample for > 1 hour
# restarted 2020-11-29 14:40:20
# finished Nov 30 11:23 CST

```
### 100 genome subset - E coli - Beef associated
Started Dec-06 00:56:37.026 CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_sampletype_beef/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_E_coli_sampletype_beef_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_sampletype -resume -with-report Ecoli_sampletype_WGS_tools.report -with-trace -with-timeline --species escherichia_coli
```


### 100 genome subset - E coli - IBM high quality
Started Dec-6 9:38pm CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_E_coli_HighQuality_IBM_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_IBM -resume -with-report Ecoli_HighQuality_IBM_WGS_tools.report -with-trace -with-timeline --species escherichia_coli
```
100genomes_Ecoli_HighQuality_IBM/





# Salmonella
## 100 genome subset - Salmonella - Host poultry associated
Started Nov-28 01:57:20.181 AM CST
Finished by Dec-02 10:02:44 AM CST
Results moved to /tempalloc/noyes042/FMPRE_clean/ALL_results/100_genome_results/100_genome_Salm_Host_Poultry_WGS_results

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_host_poultry/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/Salm_Host_Poultry_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_salm_poultry_host -resume -with-report Poultry_host_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
```

## 100 genome subset - Salmonella - Sample type chicken breast associated

Started Dec-6 1:28 AM CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_sampletype_chickenbreast/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100_Salm_Sampletype_ChickenBreast_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_salm_sampletype -resume -with-report SampleType_ChickenBreast_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
```

# Listeria
## 100 genome subset - Listeria - Host human associated
Started Nov-28  02:06 PM CST
Results moved to /tempalloc/noyes042/FMPRE_clean/ALL_results/100_genome_results/100genome_Listeria_Host_human_WGS_results
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_host_human/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_Host_human_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_human_host -resume -with-report List_host_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes
N E X T F L O W  ~  version 20.07.1
Launching `main_combined_pipeline.nf` [suspicious_curie] - revision: 1c8a4a77a8
executor >  local (523)
[25/d9c539] process > RunFastqConvert (SRR2062685) [100%] 173 of 173, cached: 1 ✔
[17/a57db7] process > RunMakeList (null)           [100%] 1 of 1 ✔
[14/358a75] process > RunCFSAN                     [100%] 1 of 1 ✔
[62/575602] process > RunKSNP3 (null)              [100%] 1 of 1 ✔
[96/dc1227] process > RunLYVESET (null)            [100%] 1 of 1, failed: 1 ✔
[2e/8c5443] process > etoki_FastqQC (SRR2062685)   [100%] 173 of 173 ✔
[1d/0ad241] process > etoki_assemble (SRR10766058) [100%] 173 of 173 ✔
[06/326815] process > etoki_align (null)           [100%] 1 of 1 ✔
[96/dc1227] NOTE: Process `RunLYVESET (null)` terminated with an error exit status (25) -- Error is ignored
Completed at: 29-Nov-2020 14:58:45
Duration    : 1d 53m 44s
CPU hours   : 88.9 (0% cached, 26.4% failed)
Succeeded   : 522
Cached      : 1
Ignored     : 1
Failed      : 1

# Lyveset
# erase possible problem sample - ERR3604679
# Re-started Nov 29 - 5:49 pm CST
/tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_human_host/96/dc1227a5571c0c0d2790ab7d1e2634
# Still had error, but seemed to go further so re-started once again on Dec 6 - 12:16 pm CST
launch_set.pl:  Finished at 2020-12-06 13:22:42
launch_set.pl:  Duration: 66 minutes, 46 seconds


```

## 100 genome subset - Listeria - Environmental swab
Started Dec-6  02:00 AM CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_sampletype_envswab/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_sampletype_envswab_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_sampletype_envswab -resume -with-report List_sampletype_envswab_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes

```


## 100 genome subset - Listeria - IBM high quality
Run on cn4201
Started Dec 6 2020 - 2:12pm CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_HighQuality_IBM_WGS_results --threads 7 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_HighQuality_IBM -resume -with-report Listeria_HighQuality_IBM_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes


```