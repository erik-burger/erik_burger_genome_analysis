# erik_burger_genome_analysis

This project is based on the paper _The draft genome of tropical fruit durian (Durio zibethinus)_ (aka group 5).  

The aim of this project is to assemble the genome of from the fruit Durian (Durio zibethinus) and then to annotate the genome. The transcriptome form different parts of the fruit will be assembled to study the differences in expression. If time is available the gene expression in the durian fruit will also be compared to the expression in other fruits.

This diagram has been created to display with an overview of the methods that will be used and how everything is connected in this project:  

![Workflow diagram](/images/Project_plan.png)  

The raw PacBio reads will be assembled using the program Canu which will also do quality control, correction and trimming to the data. In the end it will output a FASTA file with an assembled genome based only on the long reads along with other files reporting on the results of the quality control and other statistics. To be able to run the next assembly step we need a file with sequences aligned to our long reads assembly based on the short reads data. The raw illumine reads will first be run through fastQC to check the quality of the reads. Then the reads will be trimmed using Trimmomatic which will output a FASTQ file with the trimmed sequences. Then quality control will be run again on the trimmed sequences. Then the trimmed data will be aligned to the assembly made from the long reads using the program BWA. This will result in a BAM file with the aligned sequence. This BAM file together with the assembly from the long reads will be the input to the program Pilon which will create an improved assembly as an FASTA file. To be able to go on from here we need the assembled transcriptome. To this we have to control the quality and trim the RNA-seq data the same way as for the Illumina short read which will result in a FASTQ file containing trimmed RNA sequences. This sequences will then be aligned using the program Tophat which takes the trimmed RNA sequence together with the assembled genome as input. The output will be aligned RNA in a BAM file. This BAM file will then be run through the program trinity that will assemble the RNA and result in a FASTA file. This FASTA file together with the assembly of the DNA and some protein sequences from closely related species will be the input to the program MAKER2 that will annotate the genome. This will result in a GFF file with the genome annotated. The FASTA file with the assembled RNA will then also be used by the program HTseq to calculate the expression of the different RNA in a GFF file. The result from this analysis will then be run though the program DESeq2 to find statistically significant result. This will be done for multiple different transcriptomes and the result will be compared between them.

One bottleneck that can slow down the process of the project is if Canu is run late. Because this program will take ca 17 hour to run it is smart to do it early so that in the meantime other smaller analyses can be run.

## Time schedule 2020:

End date | Acitvity
-------- | --------
17/4 | Genome assembly _Canu, BWA and Pilon_
28/4 | Transcriptome assembly _Trinity_
5/5 | Annotation _Maker2_
8/5 | Expression analysis _Tophat and HTseq_

## Project Organization

In the root on github there are three folders related to this analysis, data, code, analysis. In the data folder the raw data and metadata will be stored in separate folders. In the code folder the code will be stored in folders with names that tells to what analysis the codes are related to. In the analysis folder the output files from each program/analysis are stored in folders with names that are related to that program or analysis.

