#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J canu_mummer
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

multiqc -n DNA_multiqc.html \
-o /home/erbu6020/erik_burger_genome_analysis/analyses/02_fastQC_illumina_DNA \
/home/erbu6020/erik_burger_genome_analysis/analyses/02_fastQC_illumina_DNA