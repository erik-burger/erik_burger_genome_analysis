# erik_burger_genome_analysis

This project is based on the paper _The draft genome of tropical fruit durian (Durio zibethinus)_ (aka group 5).  

The aim of this project is to assemble the genome of from the fruit Durian (Durio zibethinus) and then to annotate the genome. The transcriptome form different parts of the fruit will be assembled to study the differences in expression. If time is available the gene expression in the durian fruit will also be compared to the expression in other fruits.

This diagram has been created to display with an overview of the methods that will be used and how everything is connected in this project:  

![Workflow diagram](/images/Project_plan.png)  

Before the alignment of the short reads and the assembly of the RNA-seq the program fastQC will be run on those sequences to asses their quality. Some of the analyses will take longer time than others. For example the first assembly of the PacBio reads will take approximately 17 hours and if I decide to try to run the assembly with different parameters it would take a lot longer. Sine that is quite an essential analysis to progress in the project it can be seen as a bottleneck since it will be so time dependent. 

## Time schedule 2020:

End date | Acitvity
-------- | --------
17/4 | Genome assembly _Canu, BWA and Pilon_
28/4 | Transcriptome assembly _Trinity_
5/5 | Annotation _Maker2_
8/5 | Expression analysis _Tophat and HTseq_

## Project Organization

In the root on github there are three folders related to this analysis, data, code, analysis. In the data folder the raw data and metadata will be stored in separate folders. In the code folder the code will be stored in folders with names that tells to what analysis the codes are related to. In the analysis folder the output files from each program/analysis are stored in folders with names that are related to that program or analysis.
:shipit: