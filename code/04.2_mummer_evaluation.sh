#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J pilon_mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load MUMmer/4.0.0beta2

# Create mummeplot to analyse pilon asembly by comparing it to the assembly made in the paper.
nucmer --maxmatch -l 100 -c 100 -p mummer_pilon_assesment_unfiltered \
/home/erbu6020/erik_burger_genome_analysis/data/paper_data/Contig_06_paper_assembly.fasta \
/home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/pilon_assembly.fasta

delta-filter -i 80 -l 1000 mummer_pilon_assesment_unfiltered.delta > mummer_pilon_assesment.delta

mummerplot --png -p mummer_pilon_assesment mummer_pilon_assesment.delta --layout