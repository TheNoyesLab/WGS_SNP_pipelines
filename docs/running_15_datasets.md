




# Geography



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
  * Running July 20, 2020 on list_lyve
  * /tempalloc/noyes042/WGS_project/work_list/f9/00a5c4f289726993b6027a7a602fbb
* kSNP3
* cfsansnp
 
 
 
 ```
 cfsan_snp_pipeline run -m soft -o List_Cali_CFSAN_snp_results -s run_cfsan_samples/ /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta -c bin/snppipeline.conf
 
cfsan_snp_pipeline run -m soft -o List_Cali_CFSAN_snp_results -s run_cfsan_samples/ /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta -c bin/snppipeline.conf

cfsan_snp_pipeline map_reads --threads 30 /tempalloc/noyes042/WGS_project/ref_L_monocytogenes_NC_003210.fasta run_cfsan_samples/
 
cfsan_snp_pipeline map_reads [-h] [-f] [-v 0..5] [--threads INT]
                                    [--version]
                                    referenceFile sampleFastqFile1
                                    [sampleFastqFile2]

 
 ```
  
  

