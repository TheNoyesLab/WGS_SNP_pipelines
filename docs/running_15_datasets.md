# Overview

General steps to acquire a dataset for analysis

On a browser, on your personal computer:
1. Collect metadata for isolates in question. We specifically need the "Run" ID for each isolate.
2. We use the "Isolate browser" (https://www.ncbi.nlm.nih.gov/pathogens/isolates/) to find correct set of isolates.
    * Here's an example of an entrez query we can use to select all Listeria isolates associated with a human a host. Notice the case-sensitive values for the host variable.

``` taxgroup_name:"Listeria monocytogenes" AND (host:"Homo sapiens" OR host:"homo sapiens") ```

3. Expand the metadata file using "Choose columns" button to inlude all possible metadata variables.
4. Click on "Download" to get the metadata file
5. Use excel or an AWK command to only get the values from the "Run" column, remove the column name, and create a text file with just these values. This is often significantly less isolates than included in your metadata sheet.

## Datasets - updated 2020-11-27

* Escherichia coli and Shigella - 138,244 genomes
  * Host (573 unique host values) - bovine associated (3802) genomes - 757 SRA values
    * ``` taxgroup_name:"E.coli and Shigella" AND (host:"Bos taurus" OR host:"Bos taurus taurus" OR host:"cattle" OR host:"beef cattle" OR host:"Bovine" OR host:"Cattle" OR host:"cow" OR host:"cows" OR host:"bovine" OR host:"Bos primigenius") ``` 
    * variable ```<empty>``` - 78196 genomes
* Salmonella enterica - 323,597 total genomes
  * Host (307 variables) - Poultry associated - 916 genomes - 510 SRA
    * ``` taxgroup_name:"Salmonella enterica"  AND ( host:"Gallus gallus" OR host:"chicken"OR host:"Chicken"OR host:"broiler chicken" OR host:"Gallus gallus domesticus" OR host:"Poultry" OR host:"poultry" OR host:"chicken") ```
    * variable ```<empty>``` 242 781 genomes
    
* Listeria monocytogenes - 40,351 total genomes
  * Host (75 variables) - human associated - 6,670 genomes - 5,966 SRA
    * ``` taxgroup_name:"Listeria monocytogenes" AND (host:"Homo sapiens" OR host:"homo sapiens") ```
    * variable ```<empty>``` 30,961 genomes

  
 

# Outbreak 

## Listeria NY + outbreak
### kSNP
/tempalloc/noyes042/WGS_project/work_ny_outbreak_list/a7/8963a9f49da039eb7b9d7d0786d48f

### Lyveset
/tempalloc/noyes042/WGS_project/work_ny_outbreak_list/b9/40e300f7da48aad4e2c82fdd3c9cd4
launch_set.pl:  Finished at 2020-08-28 11:05:42
launch_set.pl:  Duration: 1188 minutes, 5 seconds

### cfsan
/tempalloc/noyes042/WGS_project/work_ny_outbreak_list/7d/46ddda65c6fd897f78b6afab06f96e
2020-08-27 18:13:30 cfsan_snp_pipeline combine_metrics finished
Elapsed time = 10366.468556404114
2020-08-27 18:13:30 cfsan_snp_pipeline run finished


## E coli romaine outbreak genomes
```
screen -x run_Ecoli

nextflow run final_no_etoki_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_romaine_outbreak/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/E_coli_romaine_oubtbreak_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ecoli_outbreak -resume -with-report Ecoli_outbreak_WGS_tools.report -with-trace -with-timeline


nextflow run final_only_etoki_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_romaine_outbreak/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/E_coli_romaine_oubtbreak_etoki_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ecoli_etoki_outbreak -resume -with-report Ecoli_outbreak_etoki_WGS_tools.report -with-trace -with-timeline


```
* kSNP3
  * Starting kSNP - Fri Aug 21 20:47:40 CDT 2020
  * Finished running kSNP - Sat Aug 22 06:28:49 CDT 2020 Elapsed time for kSNP in hours: 9.6858333333333
* Cfsan-snp
  * re-started 9/22/2020 at 8:13pm CST
  * 2020-08-23 15:57:06 cfsan_snp_pipeline run finished
* lyve-set
  * launch_set.pl:  Finished at 2020-08-24 05:31:36
  * launch_set.pl:  Duration: 1985 minutes, 42 seconds
* Enterobase

Completed at: 25-Aug-2020 07:16:28
Duration    : 14h 7m 57s
CPU hours   : 66.9 (17.2% cached, 0.4% failed)
Succeeded   : 243
Cached      : 243
Ignored     : 1

-----
# Host 


## 

### 100 genome subset - E coli - Host bovine associated
Started Nov-27 17:40:30
```
Nov-27 17:40:30.349 [main] DEBUG nextflow.cli.Launcher - $> nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Ecoli_host_cattle/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/E_coli_Host_bovine_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_ecoli_host -resume -with-report Ecoli_host_WGS_tools.report -with-trace -with-timeline --species escherichia_coli



```

## 100 genome subset - Host poultry associated
Started Nov-27 17:40:30
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/FMPRE_clean/Host_genomes/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/FMPRE_clean/Raw_datasets/100_genome_datasets/100genomes_Salm_host_poultry/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/Salm_Host_Poultry_WGS_results --threads 20 -w /tempalloc/noyes042/FMPRE_clean/ALL_results/temp_results/work_salm_poultry_host -resume -with-report Poultry_host_WGS_tools.report -with-trace -with-timeline --species salmonella_enterica
```




-----

# Geography

## E coli - South Dakota - 
November 6, 2020 @ 10:50am - Started re-running with Ecoli outbreak genomes included
/tempalloc/noyes042/WGS_project/run_Ecoli_WGS_SNP_pipelines
* completed:
  * lyveset
  * enterobase
  * kSNP3
  

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGSroject/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_Ecoli_SD/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/E_coli_SD_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ecoli_SD -resume -with-report Ecoli_SD_WGS_tools.report -with-trace -with-timeline
N E X T F L O W  ~  version 20.07.1
Launching `main_combined_pipeline.nf` [mighty_leavitt] - revision: 1fbb31dc02
executor >  local (1004)
[ad/f8e662] process > RunFastqConvert (ecolioutbreakSRR3371990) [100%] 333 of 333 ✔
[fc/3eabb7] process > RunMakeList (null)                        [100%] 1 of 1 ✔
[b8/a22934] process > RunCFSAN                                  [100%] 1 of 1, failed: 1 ✔
[36/c88f9d] process > RunKSNP3 (null)                           [100%] 1 of 1 ✔
[79/6534ce] process > RunLYVESET (null)                         [100%] 1 of 1, failed: 1 ✔
[7a/1f5c25] process > etoki_FastqQC (ecolioutbreakSRR3371990)   [100%] 333 of 333 ✔
[89/e08e1a] process > etoki_assemble (ecolioutbreakSRR3371990)  [100%] 333 of 333 ✔
[3b/d8b6da] process > etoki_align (null)                        [100%] 1 of 1 ✔
Waiting files transfer to complete (10 files)
Completed at: 09-Nov-2020 18:03:42
Duration    : 3d 7h 13m 27s
CPU hours   : 361.9 (8.2% failed)
Succeeded   : 1'002
Ignored     : 2
Failed      : 2



# Run lyveset
# Started 2020-15-11 @11:08pm
# 106175.run_ecoli_lyve
/tempalloc/noyes042/WGS_project/work_ecoli_SD/79/6534cec04fc1302cb843404cdcfb57
#launch_set.pl:  Finished at 2020-11-18 00:39:57
# launch_set.pl:  Duration: 2913 minutes, 25 seconds


# Run CFSAN
# Started 2020-15-11 @11pm
# 102110.run_ecoli_cfsan
/tempalloc/noyes042/WGS_project/work_ecoli_SD/b8/a229343a8c9969a968f0aaf92225c7



```







## Listeria - New York - 56

* Re-running with outbreak genomes
* Started: 12:48pm 2020-11-20
* ksnp and enterobase done - 11/27/2020

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_NY_L_monocytogenes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/L_monocytogenes_NewYork_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ny_list --species listeria_monocytogenes -with-report List_NY_WGS_tools.report -with-trace -with-timeline

```
/tempalloc/noyes042/WGS_project/work_ecoli_SD/b8/a229343a8c9969a968f0aaf92225c7
 
java -Xmx2000m -jar /panfs/roc/msisoft/picard/2.18.16/picard.jar MarkDuplicates INPUT=CFSAN_snp_results/samples/SRR8095943/reads.sorted.bam OUTPUT=CFSAN_snp_results/samples/SRR8095943/reads.sorted.deduped.bam METRICS_FILE=CFSAN_snp_results/samples/SRR8095943/duplicate_reads_metrics.txt VERBOSITY=WARNING

 
 ```
https://github.com/samtools/htsjdk/issues/677

cfsan_snp_pipeline map_reads --threads 30 List_Cali_CFSAN_snp_results/reference/ref_L_monocytogenes_NC_003210.fasta List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_1.fastq.gz List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_2.fastq.gz

java  -jar /home/noyes046/edoster/.conda/envs/WGS_tools/share/picard-2.21.6-0/picard.jar MarkDuplicates INPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.bam OUTPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.deduped.bam METRICS_FILE=List_Cali_CFSAN_snp_results/samples/SRR9617633/duplicate_reads_metrics.txt VALIDATION_STRINGENCY=LENIENT
 
 ```
  
## Salmonella - Mississippi - 697
 
Restarting with outbreak genomes
Started November 6, 2020 @ 11:45am.

* Downloading files on July 20, 2020.
* Results: /home/noyes046/shared/projects/WGS_project/Salmonella_Mississippi_WGS_results
* Enterobase completed in 3d 23h 45m 17s
* ksnp3: Elapsed time for kSNP in hours: 176.629166666667




```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_Salm_MS/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/S_enterica_MS_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_salm_ms -resume -with-report Salm_MS_WGS_tools_20200721.report -with-trace -with-timeline
N E X T F L O W  ~  version 19.04.1
Launching `main_combined_pipeline.nf` [nauseous_liskov] - revision: b2c354e7d6
[warm up] executor > local
executor >  local (2075)
[9e/2ab385] process > RunFastqConvert [100%] 690 of 690 ✔
[67/3c8769] process > etoki_FastqQC   [100%] 690 of 690 ✔
[db/8de78e] process > etoki_assemble  [100%] 690 of 690 ✔
[20/dc46ec] process > RunCFSAN        [100%] 1 of 1, failed: 1 ✔
[9a/6a7ff3] process > RunMakeList     [100%] 1 of 1 ✔
[5d/c0e137] process > RunKSNP3        [100%] 1 of 1 ✔
[d4/23464e] process > RunLYVESET      [100%] 1 of 1, failed: 1 ✔
[f2/692dfb] process > etoki_align     [100%] 1 of 1 ✔
[d4/23464e] NOTE: Process `RunLYVESET (null)` terminated with an error exit status (25) -- Error is ignored
Completed at: 25-Jul-2020 01:42:10
Duration    : 3d 23h 45m 17s
CPU hours   : 295.2 (31.2% failed)
Succeeded   : 2'073
Ignored     : 2
```


CFSAN
screen -x run_sal_ms_ksnp
/tempalloc/noyes042/WGS_project/work_salm_ms/20/dc46ec80e5583548af430bec740554
2020-08-15 19:13:05 cfsan_snp_pipeline map_reads finished
(cfsan_snp) edoster@cn4201 [/tempalloc/noyes042/WGS_project/work_salm_ms/20/dc46ec80e5583548af430bec740554/CFSAN_snp_results] % du --max-depth=1 -h
44M     ./logs-20200813.005847
18M     ./reference
1.7T    ./samples
44M     ./logs-20200813.175830
1.7T    .



RunLYVESET
screen -x run_sal_ms_lyve
/tempalloc/noyes042/WGS_project/work_salm_ms/d4/23464e3dfd8479110f990a7a1cd3aa
* after many failed starts, lyveset reports:launch_set.pl:  Finished at 2020-08-23 13:43:57 launch_set.pl:  Duration: 6610 minutes, 11 seconds





# High quality
11/27/2020
kSNP still running
Lyveset error with specific sample

## Listeria - high-quality - 6539 + Listeria outbreak genomes = 6622
* started running September 13, 2020 @ 9:40pm

```
Sep-13 22:42:00.443 [main] DEBUG nextflow.cli.Launcher - $> nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_List_high_quality/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/L_monocytogenes_IBM_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ibm_list -resume -with-report List_IBM_WGS_tools.report -with-trace -with-timeline

# Enterobase was only one to finish without errors
# Lyveset and CFSAN error
~> TaskHandler[id: 14960; name: RunLYVESET (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_ibm_list/21/60f214886c89135b054becd03d9d09]


##CFSAN
/tempalloc/noyes042/WGS_project/work_ibm_list/23/1cb94e8db85bf17db2c839160fc2ce
edoster@cn1107 [/tempalloc/noyes042/WGS_project/work_ibm_list/23/1cb94e8db85bf17db2c839160fc2ce/CFSAN_snp_results] % du --max-depth=1 -h
144K    ./logs-20200916.033051
15M     ./reference
16T     ./samples
144K    ./logs-20200921.124929
1.1G    ./logs-20200929.211745
16T     .
# Not sure, but this could be the end ofcfsan
# 2020-10-06 22:27:39 cfsan_snp_pipeline map_reads finished


## kSNP3
/tempalloc/noyes042/WGS_project/work_ibm_list/88/7618b34bbba9d4fe7d831bd9a291bc
# Restarted Mon Sep 21 12:52:27 CDT 2020
# Got stuck on "step 3" so restarted on Thu Nov 26 15:46:44 CST 2020



# Lyvest
# Restarting Sep 29, 2020 at 9:23pm , but getting strange error about the wrong FASTQ/GASTA
# Still freezing up, re-started 11/26/2020 @3:10pm after erasing all temporary files


```



