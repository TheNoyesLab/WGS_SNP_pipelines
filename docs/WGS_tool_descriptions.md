* Command-line tools
  * [LYVE-SET](https://github.com/lskatz/lyve-SET)
    * https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5346554/
    * Overview:
      * Lyve-SET is a high quality SNP (hqSNP) pipeline, designed to remove lower-quality SNPs from its analysis and increase phylogenetic signal.
      * Lyve-SET has its origins in the original SET algorithm described in Katz et al. (2013).
        * Major changes in Lyve-SET compared to SET include:
          * integrated read cleaning and phage masking
          * the use of VarScan instead of FreeBayes for SNP calling
          * improved production of intermediate files in standard formats
          * the use of RAxML v8 to infer trees instead of PhyML (Guindon et al., 2010; Garrison and Marth, 2012; Koboldt et al., 2012; Stamatakis, 2014). The source code is available at https://github.com/lskatz/Lyve-SET (v1.1.4f, doi: 10.5281/zenodo.163647).
  * [CFSAN-SNP](https://github.com/CFSAN-Biostatistics/snp-pipeline)
    * https://www.ifsh.iit.edu/sites/ifsh/files/departments/James_Pettengill.pdf
  * [KSNP3](https://sourceforge.net/projects/ksnp/files/)
    * kSNP identifies the pan-genome SNPs in a set of genome sequences, and estimates phylogenetic trees based upon those SNPs. SNP discovery is based on k-mer analysis, and requires no multiple sequence alignment or the selection of a reference genome, so kSNP can take 100's of microbial genomes as input. A SNP locus is defined by an oligo of length k surrounding a central SNP allele. kSNP can analyze both complete (finished) genomes and unfinished genomes in assembled contigs or raw, unassembled reads. Finished and unfinished genomes can be analyzed together, and kSNP can automatically download Genbank files of the finished genomes and incorporate the information in those files into the SNP annotation
* GUI tools included in the study:
  * [ENTEROBASE](https://github.com/zheminzhou/EToKi)
  * [wgMLST/BioNumerics](https://www.applied-maths.com/applications/wgmlst)
    * Cost
      * The job options in the wgMLST client are as follows (if your genomes are already assembled then you will only need the assembly-based BLAST allele finder):
        * (We only typically allow the evaluation of a maximum of 2 organisms at a time)
        * De novo assembly (1 credit)
        * BLAST allele finder, on the assembled genome (3 credits)
        * Assembly-free allele finder, on the reads themselves (3 credits)
        * Reference mapping for cloud based wgSNP analysis, if interested (1 credit) 
        * We have given you 50 free credits for use during your evaluation, per project. Afterwards, credits are $1.25 per credit, or $8.75 per wgMLST sample from soup to nuts..
