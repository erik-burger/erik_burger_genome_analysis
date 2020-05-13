#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 18:00:00
#SBATCH -J Maker_step_8
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
modlue load GeneMark/4.57-es

gmes_petap.pl -ES -cores 2 -sequence /home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/pilon_assembly.fasta