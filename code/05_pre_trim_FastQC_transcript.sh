#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:15:00
#SBATCH -J pre_trim_FastQC_trans
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load FastQC/0.11.8

fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/untimmed/*.fastq.gz \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/05_pre_trim_FastQC_transcript \
 -t 2