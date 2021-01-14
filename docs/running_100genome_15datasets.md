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
Finished December 10, 2020 - 12:54AM CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_sampletype_beef/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_E_coli_sampletype_beef_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_sampletype -resume -with-report Ecoli_sampletype_WGS_tools.report -with-trace -with-timeline --species escherichia_coli

N E X T F L O W  ~  version 20.07.1
Launching `main_combined_pipeline.nf` [cranky_boyd] - revision: 4e6438034a
executor >  local (347)
[00/f1de45] process > RunFastqConvert (SRR12974196) [100%] 114 of 114 ✔
[4b/9e9f57] process > RunMakeList (null)            [100%] 1 of 1 ✔
[09/532e21] process > RunCFSAN                      [100%] 1 of 1 ✔
[23/f7b482] process > RunKSNP3 (null)               [100%] 1 of 1 ✔
[c4/0209be] process > RunLYVESET (null)             [100%] 1 of 1, failed: 1 ✔
[be/eb7cdb] process > etoki_FastqQC (SRR12974196)   [100%] 114 of 114 ✔
[aa/0b78b5] process > etoki_assemble (SRR12974196)  [100%] 114 of 114 ✔
[55/e3831d] process > etoki_align (null)            [100%] 1 of 1 ✔
Waiting files transfer to complete (1 files)
Completed at: 06-Dec-2020 17:14:00
Duration    : 16h 17m 21s
CPU hours   : 80.1 (17.4% failed)
Succeeded   : 346
Ignored     : 1
Failed      : 1

# Lyveset error
sort -k1,1d -k2,2n
sort: cannot create temporary file in '': Read-only file system
QSUB ERROR
36096
launch_set.pl: Schedule::SGELK::command: ERROR with command: Inappropriate ioctl for device
  /usr/bin/perl /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_sampletype/c4/0209be9b5619a6d1c8e46c0ad08158/Lyveset_results/log/SGELK/qsub.964901.pl
Stopped at /usr/local/lyve-SET/scripts/../lib/Schedule/SGELK.pm line 661.
# Restart at December 8,2020 2:31AM CST
# Finished December 10, 2020 - 12:54AM CST
```


### 100 genome subset - E coli - IBM high quality
Started Dec-6 9:38pm CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_E_coli_HighQuality_IBM_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_IBM -resume -with-report Ecoli_HighQuality_IBM_WGS_tools.report -with-trace -with-timeline --species escherichia_coli

Completed at: 07-Dec-2020 12:25:42
Duration    : 14h 47m 34s
CPU hours   : 48.6 (28.8% failed)
Succeeded   : 265
Ignored     : 1
Failed      : 1

# Lyveset error again
# Restart Dec-9 8:48am CST
# Failed with transition to SLURM in nodes
# Re-started Dec 17, 2020 at 1:28am CST
# Re-started 
cd /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_IBM/da/c8fe4639824d400f17823143933a93
launch_set.pl --numcpus 20 -ref Lyveset_results/reference/ref_genome.fasta Lyveset_results --noqsub --read_cleaner CGP --tmpdir Lyveset_temp/ --presets escherichia_coli

The following genomes kept causing errors one-by-one so I started looking them up and found they belonged to Listeria monocytogenes 
ERR1590275
ERR1599710
ERR1599881
ERR1599736
ERR1599881

# Removed another sample, and restarted Dec 17, 2020 at 9:18pm CST
SRR1153448
SRR1506606
# Restarted 10:46pm CST
SRR1640089
SRR1695788
SRR2048048
SRR2540519
SRR2982245
SRR3037948

# After issues with cn1107 and workshop. Removed another sample, restarted Jan 11, 2021 at 4:12pm CST
SRR3112625


```


### 100 genome subset - E coli - Geography - South Dakota

Started Dec-28 1:05am CST
running on cn4201 - 
Re-started Dec-30 10:51pm CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_geography_SD/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_E_coli_Geo_SD_results --threads 8 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_Geo_SD -resume -with-report Ecoli_Geo_SD_WGS_tools.report -with-trace -with-timeline --species escherichia_coli

# restarted Jan 11, 2021 at 4:16pm CST
/tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_Geo_SD/8b/8a478b0f913b886c969e07c5cad0ea

launch_set.pl --numcpus 8 -ref Lyveset_results/reference/ref_genome.fasta Lyveset_results --noqsub --read_cleaner CGP --tmpdir Lyveset_temp/ --presets escherichia_coli


```

### 100 genome subset - E coli - all genomes - random subset


```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_all_genomes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_Ecoli_all_genomes_WGS_results --threads 8 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_all -resume -with-report Ecoli_all_genomes_WGS_tools.report -with-trace -with-timeline --species escherichia_coli
```





-----


# Salmonella
## 100 genome subset - Salmonella - Host poultry associated

Started Nov-28 01:57:20.181 AM CST

Finished by Dec-02 10:02:44 AM CST
Results moved to /tempalloc/noyes042/FMPRE_clean/ALL_results/100_genome_results/100_genome_Salm_Host_Poultry_WGS_results

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_host_poultry/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/Salm_Host_Poultry_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_salm_poultry_host -resume -with-report Poultry_host_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
```

## 100 genome subset - Salmonella - Sample type - chicken breast associated

Started Dec-6 1:28 AM CST
Completed December 10, 2020 @8:43pm CST
Results moved to: /tempalloc/noyes042/FMPRE_clean/ALL_results/100_genome_results/100_Salm_Sampletype_ChickenBreast_WGS_results/ 
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_sampletype_chickenbreast/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100_Salm_Sampletype_ChickenBreast_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_salm_sampletype -resume -with-report SampleType_ChickenBreast_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
Completed at: 06-Dec-2020 22:57:52
Duration    : 21h 30m 4s
CPU hours   : 100.0 (15.9% failed)
Succeeded   : 493
Ignored     : 1
Failed      : 1

# Lyveset error
# Restart 2020-12-8 2:35pm CST
# Nodes got migrated and interrupted some projects but this finished at December 10, 2020 @8:43pm CST

```

## 100 genome subset - Salmonella - High quality IBM 

Started Dec 12 - 5:07pm CST
Got cancelled due to login node restrictions after SLURM transition. 

```
# tried running the interactive node by requesting multiple days, but that seem to fail
srun --time=3-0 --nodelist cn1107 -p noyes --pty bash

# Tried again requesting just 24 hours and that seemed to work
srun --time=24:00:00 --nodelist cn1107 -p noyes --pty bash

# Re-started Dec 17, 2020 at 12:04am CST
tmux attach -t 2

ln0004

# Submited SBATCH on cn4201
# Submission didn't seem to work, finally got confirmation that computing nodes would be fixed back to normal (without queue)
# Restarted Dec 26, 2020 4:40pm CST
/tempalloc/noyes042/FMPRE_clean/Pipeline_runs/salm_WGS_SNP_pipelines
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100_Salm_HighQuality_IBM_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/workSalm_HighQuality_IBM -resume -with-report Salm_HighQuality_IBM_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica

[9c/3bb829] process > RunFastqConvert (ERR217462) [100%] 113 of 113 ✔
[dc/ecdbfa] process > RunMakeList (null)          [100%] 1 of 1 ✔
[39/40630a] process > RunCFSAN                    [100%] 1 of 1 ✔
[a3/c69b10] process > RunKSNP3 (null)             [100%] 1 of 1 ✔
[c0/efd6e4] process > RunLYVESET (null)           [100%] 1 of 1, failed: 1 ✔
[bd/c818f2] process > etoki_FastqQC (ERR217462)   [100%] 113 of 113 ✔
[14/408530] process > etoki_assemble (ERR217462)  [100%] 113 of 113, failed: 9 ✔
[00/ad2908] process > etoki_align (null)          [100%] 1 of 1 ✔
Completed at: 28-Dec-2020 07:13:26
Duration    : 8h 45m 46s
CPU hours   : 42.0 (17.1% failed)
Succeeded   : 334
Ignored     : 10
Failed      : 10

# Restarted lyveset Dec 17, 2020 at 9:14pm CST
/tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/workSalm_HighQuality_IBM/c0/efd6e41588307612bc7e96e5219947
# [0] smalt.c:807 ERROR: wrong FASTQ/FASTA format
# launch_smalt.pl: main::mapReads: Died
ERR279139
ERR314382
ERR338163

launch_set.pl --numcpus 20 -ref Lyveset_results/reference/ref_genome.fasta Lyveset_results --noqsub --read_cleaner CGP --tmpdir Lyveset_temp/ --presets salmonella_enterica
# Erase more samples
ERR998620




```

## 100 genome subset - Salmonella - Geography MS

Started running December 27, 2020 @ 12:49AM CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_geography_MS/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_Salm_geography_MS_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/workSalm_geo_MS -resume -with-report Salm_Geo_MS_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
```



## 100 genome subset - Salmonella - random subset from all genomes


```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salmonella_all_genomes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_Salmonella_all_genomes_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/workSalm_all -resume -with-report Salm_all_genomes_tools.report -with-trace -with-timeline --species salmonella_enterica

```



-----

# Listeria
## 100 genome subset - Listeria - Host human associated
Started Nov-28  02:06 PM CST
Finished at 2020-12-06 13:22:42
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
Finished December 10, 2020 - 12:11AM CST

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_sampletype_envswab/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_sampletype_envswab_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_sampletype_envswab -resume -with-report List_sampletype_envswab_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes

Completed at: 06-Dec-2020 17:58:41
Duration    : 15h 53m 25s
CPU hours   : 65.6 (22.5% failed)
Succeeded   : 556
Ignored     : 1
Failed      : 1

#Lyveset error
# Restarted 2020-12-8 at 2:36pm CST
# Finished December 10, 2020 - 12:11AM CST

```


## 100 genome subset - Listeria - IBM high quality
Run on cn4201
Started Dec 6 2020 - 2:12pm CST
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_HighQuality_IBM/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_HighQuality_IBM_WGS_results --threads 7 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_HighQuality_IBM -resume -with-report Listeria_HighQuality_IBM_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes

Completed at: 07-Dec-2020 05:29:59
Duration    : 15h 20m 35s
CPU hours   : 64.0 (10.8% failed)
Succeeded   : 499
Ignored     : 1
Failed      : 1

# lyveset error again
# restarted Dec-9 9:22 am CST
# Issues with samples being incomplete:
-rw-r--r--.  1 edoster noyes046   20 Dec  6 15:35 ERR1100936.fastq.gz
-rw-r--r--.  1 edoster noyes046   20 Dec  6 15:40 ERR1100964.fastq.gz
# Finished Dec-10 9:27pm CST
```



## 100 genome subset - Listeria - Geography - New York
Started Dec-17 2020 @ 7:22pm CST
edoster@ln1001
tmux session 0
srun --time=24:00:00 --nodelist cn1107 -p noyes --pty bash

srun -N 1 --ntasks-per-node=2 --nodelist cn1107 -t 24:00:00 -p noyes --pty bash
```
# Restarted 4:40pm CST
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_geography_NY/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genome_Listeria_geography_NY_WGS_results --threads 7 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_geography_NY -resume -with-report Listeria_geography_NY_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes
 
Completed at: 26-Dec-2020 07:10:44
Duration    : 14h 21m 40s
CPU hours   : 53.0 (25.1% failed)
Succeeded   : 472
Ignored     : 1
Failed      : 1

# Lyveset failed
# Restarted at 10:30am CST

```


## 100 genome subset - Listeria - all genomes -random subset


```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Listeria_all_genomes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/100genomes_Listeria_all_genomes_WGS_results --threads 7 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_list_all -resume -with-report Listeria_all_genomes_WGS_tools.report -with-trace -with-timeline --species listeria_monocytogenes

```
