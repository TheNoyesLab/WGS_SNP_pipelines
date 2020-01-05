#!/usr/bin/env nextflow

/*
vim: syntax=groovy
-*- mode: groovy;-*-
*/

if (params.help ) {
    return help()
}
if( params.reference_genome ) {
    reference_genome = file(params.reference_genome)
    if( !reference_genome.exists() ) return host_error(reference_genome)
}
if( params.amr ) {
    amr = file(params.amr)
    if( !amr.exists() ) return amr_error(amr)
}
if( params.adapters ) {
    adapters = file(params.adapters)
    if( !adapters.exists() ) return adapter_error(adapters)
}
if( params.annotation ) {
    annotation = file(params.annotation)
    if( !annotation.exists() ) return annotation_error(annotation)
}

if(params.kraken_db) {
    kraken_db = file(params.kraken_db)
}

threads = params.threads
output = params.output

threshold = params.threshold

min = params.min
max = params.max
skip = params.skip
samples = params.samples

leading = params.leading
trailing = params.trailing
slidingwindow = params.slidingwindow
minlen = params.minlen

Channel
    .fromFilePairs( params.reads, flat: true )
    .ifEmpty { exit 1, "Read pair files could not be found: ${params.reads}" }
    .set { reads }


process RunFastqConvert {
    tag {sample_id}

    publishDir "${params.output}/Interleaved_fasta", mode: "symlink"

    input:
      set sample_id, file(forward), file(reverse) from reads

    output:
      file("interleaved_reads/${sample_id}.fasta") into (interleaved_fasta)
      file("interleaved_reads/ksnp3_genome_list.tsv") into genome_list

    """
    shuffleSplitReads.pl --numcpus 8 -o interleaved_reads/ *_{1,2}.fastq.gz
    cd interleaved_reads/
    zcat ${sample_id}.fastq.gz | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > ${sample_id}.fasta
    echo '${params.output}/Interleaved_fasta/${sample_id}.fasta\t${sample_id}\n' > ksnp3_genome_list.tsv
    """
}

genome_list.toSortedList().set { combined_genome_path }

process RunMakeList {
    tag { sample_id }

    input:
      file combined_genome_path

    output:
      file "fasta_genome_location.tsv" into (full_genome_list)

    """
    cat $combined_genome_list > fasta_genome_location.tsv
    
    """
}


process RunKSNP3 {
    tag { sample_id }

    publishDir "${params.output}/kSNP3_results", mode: "copy"

    input:
      file full_genome_list

    output:
      file "Lyveset_results/*" into (lyveset_results)

    """
    kSNP3 -in $full_genome_list -CPU ${threads} -NJ -ML -k 13 -outdir kSNP3_results -annotate annotated_genomes | tee kSNP3RunLogfile

    """
}






def nextflow_version_error() {
    println ""
    println "This workflow requires Nextflow version 0.25 or greater -- You are running version $nextflow.version"
    println "Run ./nextflow self-update to update Nextflow to the latest available version."
    println ""
    return 1
}

def adapter_error(def input) {
    println ""
    println "[params.adapters] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def amr_error(def input) {
    println ""
    println "[params.amr] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def annotation_error(def input) {
    println ""
    println "[params.annotation] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def fastq_error(def input) {
    println ""
    println "[params.reads] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def host_error(def input) {
    println ""
    println "[params.host] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def index_error(def input) {
    println ""
    println "[params.host_index] fail to open: '" + input + "' : No such file or directory"
    println ""
    return 1
}

def help() {
    println ""
    println "Program: AmrPlusPlus"
    println "Documentation: https://github.com/colostatemeg/amrplusplus/blob/master/README.md"
    println "Contact: Christopher Dean <cdean11@colostate.edu>"
    println ""
    println "Usage:    nextflow run main.nf [options]"
    println ""
    println "Input/output options:"
    println ""
    println "    --reads         STR      path to FASTQ formatted input sequences"
    println "    --adapters      STR      path to FASTA formatted adapter sequences"
    println "    --host          STR      path to FASTA formatted host genome"
    println "    --host_index    STR      path to BWA generated index files"
    println "    --amr           STR      path to AMR resistance database"
    println "    --annotation    STR      path to AMR annotation file"
    println "    --output        STR      directory to write process outputs to"
    println "    --KRAKENDB      STR      path to kraken database"
    println ""
    println "Trimming options:"
    println ""
    println "    --leading       INT      cut bases off the start of a read, if below a threshold quality"
    println "    --minlen        INT      drop the read if it is below a specified length"
    println "    --slidingwindow INT      perform sw trimming, cutting once the average quality within the window falls below a threshold"
    println "    --trailing      INT      cut bases off the end of a read, if below a threshold quality"
    println ""
    println "Algorithm options:"
    println ""
    println "    --threads       INT      number of threads to use for each process"
    println "    --threshold     INT      gene fraction threshold"
    println "    --min           INT      starting sample level"
    println "    --max           INT      ending sample level"
    println "    --samples       INT      number of sampling iterations to perform"
    println "    --skip          INT      number of levels to skip"
    println ""
    println "Help options:"
    println ""
    println "    --help                   display this message"
    println ""
    return 1
}
