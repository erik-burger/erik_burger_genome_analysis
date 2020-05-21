#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J SAM_to_BAM
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load samtools/1.10

# Convert sam file to bam file
samtools view -Sb /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina.sam \
>  /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina.bam