#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J Maker_step_1
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se


module load bioinfo-tools
module load augustus/3.3.3
module load maker/3.01.1-beta
export AUGUSTUS_CONFIG_PATH="/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config"

maker