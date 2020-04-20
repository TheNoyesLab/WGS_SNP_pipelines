# Overview of process for installing WGS tools

## CFSAN SNP

```
##################
conda install -c bioconda snp-pipeline
#https://snp-pipeline.readthedocs.io/en/latest/usage.html#step-by-step-workflows

# Step 1, gather data
# Create sample directories and download sample data from SRA at NCBI. Note that
#   we use the fastq.gz-dump command from the NCBI SRA-toolkit to fetch sample
#   sequences. There are other ways to get the data, but the SRA-toolkit is
#   easy to install, and does a good job of downloading large files.


conda install -c bioconda smalt
conda install -c bioconda samtools
conda install -c bioconda picard
conda install -c bioconda gatk
conda install -c bioconda varscan
conda install -c bioconda tabix
conda install -c bioconda bcftools
conda install -c bioconda bowtie2

/s/angus/index/common/tools/miniconda3/envs/WGS_tools/bin/varscan

# On Angus
export CLASSPATH=/s/angus/index/common/tools/VarScan.jar:$CLASSPATH
export CLASSPATH=/s/angus/index/common/tools/picard.jar:$CLASSPATH
https://software.broadinstitute.org/gatk/download/archive
export CLASSPATH=/s/angus/index/common/tools/GenomeAnalysisTK.jar:$CLASSPATH

# The sampleList consists of just SRR values, and actually download one per line
mkdir samples
< cfsan_sample_list_15genomes xargs -I % sh -c 'mkdir samples/%; fastq.gz-dump --gzip --origfmt --split-files --outdir samples/% %;'


# On Computer
export CLASSPATH=/home/enriquedoster/Downloads/installed_software/VarScan.jar:$CLASSPATH
export CLASSPATH=/home/enriquedoster/Downloads/installed_software/picard.jar:$CLASSPATH
https://software.broadinstitute.org/gatk/download/archive
export CLASSPATH=/home/enriquedoster/Downloads/installed_software/GenomeAnalysisTK.jar:$CLASSPATH

# or move the files to the required sample directory
mkdir 63_samples
< cfsan_sample_list_63genomes xargs -I % sh -c 'mkdir 63_samples/%; cp ../150_genomes/150_interleaved/%.fastq.gz 63_samples/%/ ;'

## Run the pipelines
cfsan_snp_pipeline run -m soft -o outputDirectory -s 63_samples /media/AngusWorkspace/WGS_test/ref_NC_003197.fasta

```

 ## Lyve-set 
 
 ```
 #https://github.com/lskatz/lyve-SET
conda install -c hcc lyve-set
## Has to be java 8
conda install -c cyclus java-jdk
# need zsh shell
conda install -c conda-forge zsh

# log into perl shell, install tools
perl -MCPAN -e shell
install File::Slurp
install URI::Escape
install CPAN
install Sgtty
install Term::ReadKey

# https://github.com/lskatz/Schedule--SGELK
perl -MSchedule::SGELK -e '$sge=Schedule::SGELK->new(numnodes=>5); for(1..3){$sge->pleaseExecute("sleep 3");}$sge->wrapItUp();'
install Schedule::SGELK
PREFIX=~/perl5lib/ LIB=~/perl5lib/lib INSTALLMAN1DIR=~/perl5lib/man1 INSTALLMAN3DIR=~/perl5lib/man3
PERL5LIB=~/perl5lib/lib
export PERL5LIB





#https://github.com/lskatz/lyve-SET

set_manage.pl --create test_63_lyve_set
# paired end reads have to be shuffled into one file per sample
#shuffleSplitReads.pl --numcpus 8 -o ../150_interleaved *_{1,2}.fastq
# then moved into your project dir
#cp interleaved/*.fastq.gz test_lyve_set/reads/

cd test_63_lyve_set/reads/
ln -sv ../../150_genomes/150_interleaved/*fastq.gz .

cd test_lyve_set/reference/
#ln -sv /home/enriquedoster/Dropbox/Projects/WGS_analysis/June2019_Salmonella_metadata/salmonella_raw_metadata/ref_NC_003197.fasta .

#cp /home/enriquedoster/Dropbox/Projects/WGS_analysis/June2019_Salmonella_metadata/salmonella_raw_metadata/ref_NC_003197.fasta test_lyve_set/reference/ref_NC_003197.fasta
#cp /home/enriquedoster/Dropbox/Projects/WGS_analysis/June2019_Salmonella_metadata/salmonella_raw_metadata/NC_003197.gb test_lyve_set/reference/NC_003197.gbk
cp /home/enriquedoster/Dropbox/Projects/WGS_analysis/June2019_Salmonella_metadata/salmonella_raw_metadata/ref_NC_003197.fasta test_lyve_set/reference/NC_003197.fasta


ref_NC_003197.fasta

launch_set.pl --numcpus 12 -ref test_63_lyve_set/reference/ref_NC_003197.fasta test_63_lyve_set --noqsub
 ```


## Enterobase
* According to the enterobase documentation, you should be able to use a single command to download all software requirements (except Usearch). However, this doesn't work and I get errors for multiple tools.
```
   # Download EToKi github repository
    git clone https://github.com/zheminzhou/EToKi.git
    chmod +x /usr/local/EToKi/EToKi.py
    echo 'export PATH=$PATH:/usr/local/EToKi/' >> $SINGULARITY_ENVIRONMENT
    
    
    git clone https://github.com/EnriqueDoster/sing_biotools.git
    
    # Etoki installation
    python3 /usr/local/EToKi/EToKi.py configure --install --usearch /usr/local/sing_biotools/bin/usearch11.0.667_i86linux32
```

