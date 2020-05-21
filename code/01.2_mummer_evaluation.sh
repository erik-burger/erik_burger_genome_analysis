#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J canu_mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load MUMmer/4.0.0beta2

# Create mummeplot to analyse canu asembly by comparing it to the assembly made in the paper.
nucmer --maxmatch -l 100 -c 100 -p mummer_canu_assesment_unfiltered \
/home/erbu6020/erik_burger_genome_analysis/data/paper_data/Contig_06_paper_assembly.fasta \
/home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly/canu_durian_alignment.contigs.fasta 

delta-filter -i 80 -l 1000 mummer_canu_assesment_unfiltered.delta > mummer_canu_assesment.delta

mummerplot --png -p mummer_canu_assesment mummer_canu_assesment.delta --layout