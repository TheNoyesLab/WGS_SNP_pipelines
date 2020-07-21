




# Geography

## Listeria - New York - 56

* Need to copy "/tempalloc/noyes042/WGS_project/L_monocytogenes_NewYork_WGS_results" over to Noelle's server

* Lyveset
  * screen -x 3_lyveset
* kSNP
  * screen -x 3_WGS
* cfsansnp
  * completed July 13, 2020
* enterobase
  * completed July 13, 2020

## Listeria - California - 2173 genomes

```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_Cali_L_monocytogenes/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/L_monocytogenes_California_WGS_results --threads 30 -w /tempalloc/noyes042/WGS_project/work_list -resume -with-report List_Cali_WGS_tools.report -with-trace -with-timeline
N E X T F L O W  ~  version 19.04.1
Launching `main_combined_pipeline.nf` [cheesy_morse] - revision: 680cf4dae0
[warm up] executor > local
executor >  local (1)
[03/ed87f1] process > etoki_FastqQC   [100%] 2173 of 2173, cached: 2173 ✔
[25/c72ef6] process > RunFastqConvert [100%] 2173 of 2173, cached: 2173 ✔
[0c/d1d57d] process > etoki_assemble  [100%] 2173 of 2173, cached: 2173 ✔
[63/9c4eea] process > etoki_align     [100%] 1 of 1, cached: 1 ✔
[81/9297b8] process > RunMakeList     [100%] 1 of 1, cached: 1 ✔
[db/43060c] process > RunKSNP3        [100%] 1 of 1, cached: 1 ✔
[f9/00a5c4] process > RunLYVESET      [100%] 1 of 1, failed: 1 ✔
[f9/00a5c4] NOTE: Process `RunLYVESET (null)` terminated with an error exit status (25) -- Error is ignored
Completed at: 17-Jul-2020 19:12:09
Duration    : 12d 22h 14m 39s
CPU hours   : 1'010.8 (69.3% cached, 30.7% failed)
Succeeded   : 0
Cached      : 6'522
Ignored     : 1
```

* Only the enterobase pipeline finished normally
* Lyveset
  * Running July 20, 2020 on run_lyve
  * /tempalloc/noyes042/WGS_project/work_list/f9/00a5c4f289726993b6027a7a602fbb
* kSNP3
  * screen -x run_WGS2
  * /tempalloc/noyes042/WGS_project/work_cali_ksnp_lyve/13/a7d7f9fe21e19977b66ce1a8742a86
* cfsansnp
  * screen -x WGS2_cfsan
 
 
 ```
https://github.com/samtools/htsjdk/issues/677

cfsan_snp_pipeline map_reads --threads 30 List_Cali_CFSAN_snp_results/reference/ref_L_monocytogenes_NC_003210.fasta List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_1.fastq.gz List_Cali_CFSAN_snp_results/samples/SRR9951124/SRR9951124_2.fastq.gz

java  -jar /home/noyes046/edoster/.conda/envs/WGS_tools/share/picard-2.21.6-0/picard.jar MarkDuplicates INPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.bam OUTPUT=List_Cali_CFSAN_snp_results/samples/SRR9617633/reads.sorted.deduped.bam METRICS_FILE=List_Cali_CFSAN_snp_results/samples/SRR9617633/duplicate_reads_metrics.txt VALIDATION_STRINGENCY=LENIENT
 
 ```
  
  
## Salmonella - Mississippi - 697
  
* Downloading files on July 20, 2020.
* Running screen -x run_Salm
```
nextflow run main_combined_pipeline.nf --reference_genome /tempalloc/noyes042/WGS_project/Senterica_LT2_ref_genome.fasta --reads '/tempalloc/noyes042/WGS_project/genomes_Salm_MS/*_{1,2}.fastq.gz' -profile singularity --output /tempalloc/noyes042/WGS_project/S_enterica_MS_WGS_results --threads 20 -w /tempalloc/noyes042/WGS_project/work_salm_ms -resume -with-report Salm_MS_WGS_tools_20200721.report -with-trace -with-timeline
```

# High quality

## Listeria - high-quality - 6539
* already downloaded 
