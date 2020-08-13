# Overview of process for installing WGS tools

## CFSAN SNP

```
##################
conda install -c bioconda snp-pipeline
#https://snp-pipeline.readthedocs.io/en/latest/usage.html#step-by-step-workflows


# Dependencies
Make sure you have the following tools in your path
  * samtools v1.9


# On server, or singularity container, you have to specify the following CLASSPATHs
export CLASSPATH=/s/angus/index/common/tools/VarScan.jar:$CLASSPATH
export CLASSPATH=/s/angus/index/common/tools/picard.jar:$CLASSPATH
https://software.broadinstitute.org/gatk/download/archive
export CLASSPATH=/s/angus/index/common/tools/GenomeAnalysisTK.jar:$CLASSPATH

# The sampleList consists of just SRR values, and actually download one per line
mkdir samples
< cfsan_sample_list_15genomes xargs -I % sh -c 'mkdir samples/%; fastq.gz-dump --gzip --origfmt --split-files --outdir samples/% %;'





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

```

Lyve-SET installation on UMN's servers

```
# Load the correct perl module (the default does not support perl module installation)
module load perl/modules.centos7.5.26.1

# On MSI, had to be done from shell
perl -MCPAN -e shell
install XML::DOM::XPath
install Bio::FeatureIO

# Installation of perl modules
perl -MCPAN -Mlocal::lib -e 'CPAN::install(File::Slurp)'
perl -MCPAN -Mlocal::lib -e 'CPAN::install(URI::Escape)'
perl -MCPAN -Mlocal::lib -e 'CPAN::install(Bio::DB::EUtilities)'

# Download lyve SET
wget https://github.com/lskatz/lyve-SET/archive/v2.0.1.zip
unzip v2.0.1.zip
cd lyve-SET-2.0.1
make install-config
make install-perlModules
make install-smalt
make install-CGP
make install-SGELK
make install-vcftools
make install-samtools
make install-varscan
make install-snpEff
make install-bcftools
make install-raxml
make install-snap
make env

## Very important to make these two changes:
# Error with location of "varscan.sh"
cp /home/noyes046/edoster/.conda/envs/lyve_set_conda/bin/varscan /home/noyes046/edoster/.conda/envs/lyve_set_conda/bin/varscan.sh
# error with location of /panfs/roc/groups/11/noyes046/edoster/.conda/envs/lyve_set_conda/bin/VarScan.jar
cp /home/noyes046/edoster/.conda/envs/lyve_set_conda/share/varscan-2.4.4-0/VarScan.jar /home/noyes046/edoster/.conda/envs/lyve_set_conda/bin/VarScan.jar



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

