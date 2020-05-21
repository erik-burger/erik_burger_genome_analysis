# This code is made to assign each found gene to a DNA sequence and then output a cvs file containing
# THe sequence together with it's 2logfold change and it's pvalue and name.
import csv
from Bio import SeqIO
import re
# Open and read the tsv file from R, this path is changed based on which of the R files that were to be analyzend
# path "/Users/ErikBurger/Desktop/Genomanalys/erik_burger_genome_analysis/analyses/12_DESeq/aril_vs_leaf.tsv"
tsv_file = open("/Users/ErikBurger/Desktop/Genomanalys/"
                "erik_burger_genome_analysis/analyses/12_DESeq/aril_vs_aril.tsv")
read_tsv = csv.reader(tsv_file, delimiter="\t")

# Open and create the file to read to also changed based on input data
f = open('/Users/ErikBurger/Desktop/Genomanalys/erik_burger_genome_analysis/'
         'analyses/12_DESeq/results_aril_vs_aril.csv', 'a')
# Write top the column names
f.write("name, log2FoldChange, pvalue, sequence \n")
# For each gene in the tsv file from R a DNA match is found i the fasta file form maker this is done using regex.
for row in read_tsv:
    tig = re.search("(tig\d+)", row[0])
    gene_num = re.search("gene-\d+\.\d+-", row[0])
    if tig and gene_num:
        fasta_sequences = SeqIO.parse(open("/Users/ErikBurger/Desktop/"
                                           "pilon_assembly.all.maker.transcripts.fasta"),
                                      'fasta')
        for fasta in fasta_sequences:
            if str(fasta.id).find(tig.group(0)) > -1 and str(fasta.id).find(gene_num.group(0)) > -1:
                f.write(row[0] + ","+ row[2] + "," + row[5] + "," + str(fasta.seq) +"\n")

# The output files are then move into excel to be able to sort the data based on log2FoldChange



