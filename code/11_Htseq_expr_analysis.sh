#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH -J Htseq_11
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load htseq/0.9.1


# SRR6040092
htseq-count -m union -f bam -i expressed_sequence_match /home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/Aligned_SRR6040092.bam /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/pilon_assembly.all.gff

