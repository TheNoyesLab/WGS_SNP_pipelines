# The following file contains questions that are relevant to understanding how to use NCBI's pathogen database.



# Questions

1. The https://www.ncbi.nlm.nih.gov/pathogens website allows a user to browse all isolate genomes, but downloading the metadata is limited to 10k lines. How can we obtain the metadata for all genomes in the pathogen database?
  * Obtaining all of the metadata is a bit tricky and consists of downloading all of the metadata files in the SFTP site, which is divided into folders for "SNP groups, and then the file must be paresed for unique entries.
 ```
ftp ftp.ncbi.nlm.nih.gov
# Username: anonymous
# Password: Email


#Navigate to this directory to find all species:
cd /pathogen/Results

# View an example metadata file
less /Listeria/PDG000000001.1234/Metadata/PDG000000001.1234.metadata.tsv


```
  
  
2. How can we tell who submitted each genome in the pathogen database?
  * Answer from Ruth Timme: "The metadata file on the FTP site should contain all the salmonella isolates in the Pathogen Detection database. This includes all the GenomeTrakr contributions as well as PulseNet, Public Health England, and other submitters.  If you want to filter for GT-only isolates I can help you identify some flags, like the sra_center or bioproject_center that you can filter on for isolates submitted by GenomeTrakr.  We don’t draw a clear distinction in the database for the submitting networks since the data are all collected as part of the same surveillance effort, from the same SOP, QC thresholds, etc."
  
3. How do we know which genomes were submitted by GenomeTrakr? For example, which portion of Salmonella genomes were submitted by GenomeTrakr?
  * Answer from Ruth Timme: "I did a quick filter for sra_center = FDA, CFSAN, FDA,CFSAN or FDA/CFSAN and the numbers look about right for what we’ve submitted for the network (almost 40K isolates)".
