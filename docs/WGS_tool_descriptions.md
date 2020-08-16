# Command line tools


## LYVE-set
* The CDC published Lyve-SET as an update to SET. 
* [LYVE-SET](https://github.com/lskatz/lyve-SET)
  * Docker hub website contains many useful docker containers:
    * https://hub.docker.com/r/staphb/lyveset
  * https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5346554/
    *  Lyve-SET requires as input a set of raw reads
    * phylogenetically related reference genome assembly
  * Overview:
    * Lyve-SET is a high quality SNP (hqSNP) pipeline, designed to remove lower-quality SNPs from its analysis and increase phylogenetic signal.
    * Lyve-SET has its origins in the original SET algorithm described in Katz et al. (2013).
      * Major changes in Lyve-SET compared to SET include:
        * integrated read cleaning and phage masking
        * the use of VarScan instead of FreeBayes for SNP calling
        * improved production of intermediate files in standard formats
        * the use of RAxML v8 to infer trees instead of PhyML (Guindon et al., 2010; Garrison and Marth, 2012; Koboldt et al., 2012; Stamatakis, 2014). The source code is available at https://github.com/lskatz/Lyve-SET (v1.1.4f, doi: 10.5281/zenodo.163647).
.
      * Lyve-SET has only been tested with Illumina reads and default settings are optimized for Illumina data, but it can accept FASTQ files from any platform
      * There are preset options to customize parameters of each Lyve-SET run for specific organisms (Table ​(Table2).2). For example, a 20x coverage cutoff is used for S. enterica while a 10x coverage cutoff is used for L. monocytogenes.
      * As opposed to most other SNP pipelines, Lyve-SET calls all invariant positions in addition to SNPs in order to perform a rigorous comparison. Therefore in positions where a percentage of genomes have a variant site, all genomes with variant and invariant nucleotide calls can be appropriately compared using various models of evolution. 
      * For example, Lyve-SET has the ability to mask “cliffs,” regions where sequencing coverage significantly increases or decreases in a short genomic range. A cliff can be indicative of a repeat region that causes aggregation of short sequencing reads during read mapping. 
      * Similarly, other user-defined regions in a BED-formatted file can be supplied to mask unwanted sequences from SNP calling. One example is that, although phages can be useful for typing in their own right (Chen and Knabel, 2008), phage sequences should be removed from a SNP analysis because they often display different rates of mutation than bacterial core genomes. If phages appear to contribute to phylogenetic noise in an investigation, Lyve-SET can provide phage sequence identification with a script set_findPhages.pl which is based on a BLAST search against the PHAST database (Zhou et al., 2011).
      * Another way for Lyve-SET to detect troublesome regions is to discard clustered SNPs. For most organisms, this option is preset to 5 bp, such that only one SNP per 5 bp passes the filter. Much like MLST, discarding clustered SNPs reduces noise introduced by horizontal gene transfer. This flanking distance hypothetically should approximate the average recombination cassette length (Vos and Didelot, 2009), but empirically we have found that having a low flanking distance, e.g., 5 bp, is sufficient. 

### Lyve-SET Output Files
  * [Detailed description of each output file](https://github.com/lskatz/lyve-SET/blob/master/docs/OUTPUT.md)
  * [Visualizing the output files](https://github.com/lskatz/lyve-SET/blob/master/docs/VIZ.md)
    * If available, we recommend using Geneious to visualize the tree.dnd file.

## CFSAN-snp
* The FDA uses a core genome SNP-based approach with CFSAN-snp.
* [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
  * https://www.ifsh.iit.edu/sites/ifsh/files/departments/James_Pettengill.pdf

### CFSAN workflow

No need to specify other flags other than the standard flags.

1. Gather data
2. Prep work
3. Prep the reference
4. Align samples to reference
5. Find sites having high-confidence SNPs
6. Identify regions with abnormal SNP density and remove SNPs in these regions
7. Combine the SNP positions across all samples into the SNP list file
8. Call the consensus base at SNP positions for each sample
9. Create the SNP matrix
10. Create the reference base sequence
11. Collect metrics for each sample
12. Tabulate the metrics for all samples
13. Merge the VCF files for all samples into a multiple-sample VCF file
14. Compute the SNP distances between samples

### CFSAN snp output files

By sample

* ``consensus.fasta`` : for each sample, the consensus base calls at the high-confidence positions where SNPs were detected in any of the samples. The corresponding consensus_preserved.fasta file is produced when snp filtering removes the abnormal snps.
* ``consensus.vcf`` : for each sample, the VCF file of SNPs called, as well as failed SNPs at the high-confidence positions where SNPs were detected in any of the samples. The corresponding consensus_preserved.vcf file is produced when snp filtering removes the abnormal snps.
* ``metrics`` : for each sample, contains the size of the sample, number of reads, alignment rate, pileup depth, and number of SNPs found.
metrics.tsv : a tab-separated table of metrics for all samples containing the size of the samples, number of reads, alignment rate, pileup depth, and number of SNPs found.

Final output
* ``snplist.txt`` : contains a list of the high-confidence SNP positions identified by the phase 1 SNP caller (VarScan) in at least one of the samples. These are the only positions where the consensus caller subsequently looks for SNPs in all samples. The consensus caller often finds SNPs at the same positions in other samples, and those additional SNPs are not listed in the snplist.txt file. While the snplist.txt file has an accurate list of SNP positions, it does not contain the final list of samples having SNPs at those positions. If you need the final set of SNPs per sample, you should not use the snplist.txt file. Instead, refer to the snpma.fasta file or the snpma.vcf file. The corresponding ``snplist_preserved.txt`` file is produced when snp filtering removes the abnormal snps.
* ``snpma.fasta`` : the SNP matrix containing the consensus base for each of the samples at the high-confidence positions where SNPs were identified in any of the samples. The matrix contains one row per sample and one column per SNP position. Non-SNP positions are not included in the matrix. The matrix is formatted as a fasta file, with each sequence (all of identical length) corresponding to the SNPs in the correspondingly named sequence. The corresponding snpma_preserved.fasta file is produced when snp filtering removes the abnormal snps.
* ``snp_distance_pairwise.tsv`` : contains the pairwise SNP distance between all pairs of samples. The file is tab-separated, with a header row and three columns identifing the two sequences and their distance. The corresponding snp_distance_pairwise_preserved.tsv file is produced when snp filtering removes the abnormal snps.
* ``snp_distance_matrix.tsv`` : contains a matrix of the SNP distances between all pairs of samples. The file is tab-separated, with a header row and rows and columns for all samples. The corresponding snp_distance_matrix_preserved.tsv file is produced when snp filtering removes the abnormal snps.
* ``snpma.vcf`` : contains the merged multi-sample VCF file identifying the positions and snps for all samples. The corresponding ``snpma_preserved.vcf`` file is produced when snp filtering removes the abnormal snps.
* ``referenceSNP.fasta`` : a fasta file containing the reference sequence bases at all the SNP locations. The corresponding referenceSNP_preserved.fasta file is produced when snp filtering removes the abnormal snps.









## kSNP3
* [kSNP3](https://sourceforge.net/projects/ksnp/files/)
  * kSNP identifies the pan-genome SNPs in a set of genome sequences, and estimates phylogenetic trees based upon those SNPs. SNP discovery is based on k-mer analysis, and requires no multiple sequence alignment or the selection of a reference genome, so kSNP can take 100's of microbial genomes as input. A SNP locus is defined by an oligo of length k surrounding a central SNP allele. kSNP can analyze both complete (finished) genomes and unfinished genomes in assembled contigs or raw, unassembled reads. Finished and unfinished genomes can be analyzed together, and kSNP can automatically download Genbank files of the finished genomes and incorporate the information in those files into the SNP annotation
* Personal opinion comments
  * Easy to install, but not available as an anaconda package. 
  * Does not provide any useful warnings if an error is caused.
  
  
## IBM functional approach
* This approach uses IBM's OMXWare software.
* IBM Research (co-investigator) has assembled and annotated over 166,000 high-quality
bacterial genomes. 
  * This annotation revealed over 46 million genes, over 33.5 million proteins, and over 138 million protein domains with associated functional codes (e.g., stress response, virulence, DNA replication, antimicrobial resistance, etc…) across more than 500 bacterial genera.
  * Following the addition of domains for each WGS dataset, we will create a vector representing within-protein domains and/or the frequency of their functional annotations for each WGS observation.
    * Domains are distinct and independent subsections of proteins; a single protein can contain multiple domains, and a single domain can be found in multiple proteins.
    * This approach, which replaces the nucleotide sequence with a “functional capacity vector”, not only provides a high level of dimensionality reduction (to aid in computational feasibility), but it also replaces the genotypic representation (raw sequence) with a phenotypic representation of the same data.
  * We will use this annotation scheme to create a domain vector for the highest quality WGS observations in our 15 test datasets, and then we will use this domain vector to compare sequences (and functions) across WGS observations.

-----
# GUI tools

## Enterobase
* [ENTEROBASE](https://github.com/zheminzhou/EToKi)

## BioNumerics
* PulseNet International has recommended a so-called whole-genome MLST approach (wgMLST) in which genomes are compared on a gene-by-gene basis.
* [wgMLST/BioNumerics](https://www.applied-maths.com/applications/wgmlst)
  * Cost
    * The job options in the wgMLST client are as follows (if your genomes are already assembled then you will only need the assembly-based BLAST allele finder):
      * (We only typically allow the evaluation of a maximum of 2 organisms at a time)
      * De novo assembly (1 credit)
      * BLAST allele finder, on the assembled genome (3 credits)
      * Assembly-free allele finder, on the reads themselves (3 credits)
      * Reference mapping for cloud based wgSNP analysis, if interested (1 credit) 
      * We have given you 50 free credits for use during your evaluation, per project. Afterwards, credits are $1.25 per credit, or $8.75 per wgMLST sample from soup to nuts..

-----
# Other tools
* NCBI utilizes a WGS “Pathogen Detection System” that seems to combine SNPs and k-mers, although it is unclear how these are used because the website states that “Details of the analysis system will be published at a future date 
  * www.ncbi.nlm.nih.gov/pathogens/about/.
