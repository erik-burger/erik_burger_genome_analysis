#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J sort_BAM
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load samtools/1.10

# Sorting the bam file
samtools sort /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina.bam \
> /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina_sorted.bam