#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J quast_canu_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load quast

# Quast analyse the canu asembly by comparing it to the assembly from the paper
quast.py -R /home/erbu6020/erik_burger_genome_analysis/data/paper_data/Contig_06_paper_assembly.fasta \
-o /home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly \
/home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly/canu_durian_alignment.contigs.fasta