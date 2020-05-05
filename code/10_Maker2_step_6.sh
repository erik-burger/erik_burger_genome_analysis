#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Augustus_step_6
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load augustus/3.3.3

optimize_augustus.pl --species=durian augustus.gbk.train --cpus=2 \ 
--AUGUSTUS_CONFIG_PATH= /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config