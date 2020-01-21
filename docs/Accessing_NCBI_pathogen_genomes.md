# Overview of accessing genomes on NCBI's pathogen database

Table of Contents
-----
* [NCBI Pathogen databases](#ncbi-pathogen-databases)
* [Challenges](#challenges)
* [Our Experience](#our-experience)



## NCBI Pathogen databases

Genomes part of NCBI's pathogen database can be found at an sftp site and through an isolate browser:
* SFTP site: ftp.ncbi.nlm.nih.gov/pathogen/
* Isolate browser: https://www.ncbi.nlm.nih.gov/pathogens/isolates#/search/

## Challenges
* Downloading a lot of genomes from the SFTP site is not possible because downloads are "timed-out".
* The isolate browser only allows you to download metadata files with 10k lines (genomes).
* The sftp site is organized into directories that represent "SNP" cluster groups.
  * Some genomes are present in multiple SNP cluster groups and the metadata files must be parsed to identify unique SRA values.
* NCBI "fastq-dump" is too slow for downloading genomes

## Our experience 

The location of the metadata files representing each SNP cluster group (as determined by GenomeTrakr submitting site) was identified within the large and complex NCBI Pathogen FTP server. Unix-based functions were then employed to download each metadata file individually; these files were then parsed to identify and download the fastq files (i.e., sequence data) for each relevant isolate.
Upon first download attempt, it was discovered that the download speeds were slower than expected. Therefore, an alternative download approach was identified and tested, which resulted in faster download speeds. Currently, all GenomeTrakr Salmonella sequences have been
successfully downloaded, and other pathogens are currently in downlaod.
