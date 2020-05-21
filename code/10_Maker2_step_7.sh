#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J Maker_step_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

# Step 7 (see 10_MAKER2_annotation.md for more info)
# need to export the augustus config path to be able to use the species durian created by me

module load bioinfo-tools
module load augustus/3.3.3
module load maker/3.01.1-beta
export AUGUSTUS_CONFIG_PATH="/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config"

maker