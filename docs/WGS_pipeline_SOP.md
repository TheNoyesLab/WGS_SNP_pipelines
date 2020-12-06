# Tips for using the WGS pipelines on this repository


## General steps to acquire a dataset for analysis

On a browser, on your personal computer:
1. Collect metadata for isolates in question. We specifically need the "Run" ID for each isolate.
2. We use the "Isolate browser" (https://www.ncbi.nlm.nih.gov/pathogens/isolates/) to find correct set of isolates.
    * Here's an example of an entrez query we can use to select all Listeria isolates associated with a human a host. Notice the case-sensitive values for the host variable.

``` taxgroup_name:"Listeria monocytogenes" AND (host:"Homo sapiens" OR host:"homo sapiens") ```

3. Expand the metadata file using "Choose columns" button to inlude all possible metadata variables.
4. Click on "Download" to get the metadata file
5. Use excel or an AWK command to only get the values from the "Run" column, remove the column name, and create a text file with just these values. This is often significantly less isolates than included in your metadata sheet.
6. 

##  Steps for running the pipeline
