#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 21:15:00
#SBATCH -J durian_canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load canu/1.8

canu \
 -p canu_durian_alignment
 -d /home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly \
 genomeSize=26.6m \
 -pacbio-raw /home/erbu6020/erik_burger_genome_analysis/data/raw_data/pacbio/SRR6037732_scaffold_06.fq.gz