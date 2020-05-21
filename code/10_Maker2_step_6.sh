#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J Augustus_step_6
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

# Step 6 (see 10_MAKER2_annotation.md for more info)
module load bioinfo-tools
module load augustus/3.3.3

# Optimize the augustus model
optimize_augustus.pl --AUGUSTUS_CONFIG_PATH=/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config --species=durian augustus.gbk.train --cpus=4