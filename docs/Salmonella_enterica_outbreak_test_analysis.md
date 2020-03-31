

# Running test on 37 *Salmonella enterica* genomes associated with an outbreak

## Lyveset command 

```
set_manage.pl --create Lyveset_results
mv SRR1525568.fastq.gz SRR1139534.fastq.gz SRR1636582.fastq.gz SRR2966870.fastq.gz SRR1732310.fastq.gz SRR1724669.fastq.gz SRR1525571.fastq.gz SRR1640102.fastq.gz SRR1686406.fastq.gz SRR1640105.fastq.gz SRR1634592.fastq.gz SRR1525570.fastq.gz SRR1634593.fastq.gz SRR3321806.fastq.gz SRR2043697.fastq.gz SRR1640101.fastq.gz SRR1951854.fastq.gz SRR1060677.fastq.gz SRR1525572.fastq.gz SRR1686411.fastq.gz SRR1525567.fastq.gz SRR1686413.fastq.gz SRR1580994.fastq.gz SRR1525569.fastq.gz SRR1525566.fastq.gz SRR1967343.fastq.gz SRR1060634.fastq.gz SRR1686407.fastq.gz SRR1580995.fastq.gz SRR3322100.fastq.gz SRR1686405.fastq.gz SRR1686410.fastq.gz SRR1640104.fastq.gz SRR1580996.fastq.gz Lyveset_results/reads/
mv Senterica_LT2_ref_genome.fasta Lyveset_results/reference/ref_genome.fasta
launch_set.pl --numcpus 3 -ref Lyveset_results/reference/ref_genome.fasta Lyveset_results --noqsub --read_cleaner CGP
rm -rf Lyveset_results/reads/
```
* Kept getting errors with singularity container and had to switch to docker container.
* launch_set.pl:  Duration: 349 minutes, 59 seconds



## kSNP3

```
kSNP3 -in fasta_genome_location.tsv -CPU 3 -NJ -ML -core -vcf -min_frac 0.5 -k 31 -outdir kSNP3_results -annotate annotated_genomes | tee kSNP3RunLogfile
rm -rf kSNP3_results/TemporaryFilesToDelete/
```
* Elapsed time for kSNP in hours: 2.46055555555556
