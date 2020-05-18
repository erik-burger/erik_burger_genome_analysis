#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J coverage_samtools
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load samtools/1.10

samtools flagstat Aligned.out.sam