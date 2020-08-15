# Overview

Unfortunately, running the full nextflow pipeline still has issues for each 

Anaconda environments
```
AmrPlusPlus_env          /home/noyes046/edoster/.conda/envs/AmrPlusPlus_env
WGS_tools                /home/noyes046/edoster/.conda/envs/WGS_tools
catch                    /home/noyes046/edoster/.conda/envs/catch
cfsan_snp                /home/noyes046/edoster/.conda/envs/cfsan_snp
compute                  /home/noyes046/edoster/.conda/envs/compute
ksnp3_env                /home/noyes046/edoster/.conda/envs/ksnp3_env
lyve_set_conda           /home/noyes046/edoster/.conda/envs/lyve_set_conda
```


# Geography

## E coli - South Dakota - 
screen -x run_Ecoli
/tempalloc/noyes042/WGS_project/run_Ecoli_WGS_SNP_pipelines

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_Ecoli_NC_000913.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_Ecoli_SD/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/E_coli_SD_WGS_results --threads 30 -w /tempalloc/noyes042/WGS_project/work_ecoli_SD -resume -with-report Ecoli_SD_WGS_tools.report -with-trace -with-timeline


# Failed after 1 day, started each pipeline below at 10pm

# RunCFSAN
screen -x run_ecoli_cfsan
/tempalloc/noyes042/WGS_project/work_ecoli_SD/75/65ae63e8499faa9b7246ffc028e578

# Lyve set
# RunLYVESET (null); status: RUNNING; exit: -; error: -; workDir:
screen -x run_ecoli_lyve
/tempalloc/noyes042/WGS_project/work_ecoli_SD/18/8f1dd5cada35dfaf6706aa356d4842

# kSNP3 
/tempalloc/noyes042/WGS_project/work_ecoli_SD/5e/68619add4d52fe6eccebe4188cfec4


```




## Listeria - New York - 56

* All pipelines completed and results were copied over to /home/noyes046/shared/projects/WGS_project/List_NY_WGS_results/

```

nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_NY_L_monocytogenes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/L_monocytogenes_NewYork_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ny_list -resume -with-report List_NY_WGS_tools.report -with-trace -with-timeline

~> TaskHandler[id: 110; name: RunLYVESET (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_ny_list/e3/b8f8b722b12e5b100a34c6ea27f1b2]
~> TaskHandler[id: 109; name: RunCFSAN; status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_ny_list/a2/9ab363096d39db6fea5fdd16fefded]
~> TaskHandler[id: 111; name: RunKSNP3 (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_ny_list/55/85fb31df01ba6d0c688b0e612bc3d5]
~> TaskHandler[id: 155; name: etoki_align (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_ny_list/5e/2a63eda264d37b79bc31728903b0bd]


```

* Lyveset
  * screen -x run_list_NY_lyve
  * Aug 5, 2020 - 7:08pm
* kSNP
  * Most output was done by August 8, but NJ tree step kept getting stuck
  * copied over results August 11, 2020
  Thu Aug 13 17:02:32 CDT 2020
Elapsed time for kSNP in hours: 2.51305555555556

* cfsansnp
  * completed July 13, 2020
* enterobase
  * completed July 13, 2020

 
 
 ```
https://github.com/samtools/htsjdk/issues/677

cfsan_snp_pipeline map_reads --threads 30 List_Cali_CFSAN_snp_results/reference/ref_L_monocytogenes_NC_003210.fasta List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_1.fastq.gz List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_2.fastq.gz

java  -jar /home/noyes046/edoster/.conda/envs/WGS_tools/share/picard-2.21.6-0/picard.jar MarkDuplicates INPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.bam OUTPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.deduped.bam METRICS_FILE=List_Cali_CFSAN_snp_results/samples/SRR9617633/duplicate_reads_metrics.txt VALIDATION_STRINGENCY=LENIENT
 
 ```
  
## Salmonella - Mississippi - 697
  
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

RunLYVESET
screen -x run_sal_ms_lyve
/tempalloc/noyes042/WGS_project/work_salm_ms/d4/23464e3dfd8479110f990a7a1cd3aa


~> TaskHandler[id: 1212; name: RunKSNP3 (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_salm_ms/5d/c0e137d5a55044636dd6e992d2634b]



~> TaskHandler[id: 1209; name: RunLYVESET (null); status: RUNNING; exit: -; error: -; workDir: /tempalloc/noyes042/WGS_project/work_salm_ms/d4/23464e3dfd8479110f990a7a1cd3aa]





# High quality

## Listeria - high-quality - 6539
* started running August 12, 2020 @ 12am

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_List_high_quality/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/L_monocytogenes_IBM_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_ibm_list -resume -with-report List_IBM_WGS_tools.report -with-trace -with-timeline
```
