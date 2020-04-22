#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J multi_qc_DNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load MultiQC/1.8

multiqc -n DNA_multiqc.html \
-o /home/erbu6020/erik_burger_genome_analysis/analyses/02_fastQC_illumina_DNA \
/home/erbu6020/erik_burger_genome_analysis/analyses/02_fastQC_illumina_DNA