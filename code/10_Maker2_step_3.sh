#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J Maker_step_3
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation

module load bioinfo-tools
module load maker/3.01.1-beta

maker