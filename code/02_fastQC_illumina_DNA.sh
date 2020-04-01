#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:15:00
#SBATCH -J durian_fastQC_pretrimmed_and_untrimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

#load needed modules
module load bioinfo-tools
module load FastQC/0.11.8

#run fastQC on the given trimmed data made by trimmomatic
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/illumina/*.fastq.gz \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/02_fastQC_illumina_DNA \
 -t 2
