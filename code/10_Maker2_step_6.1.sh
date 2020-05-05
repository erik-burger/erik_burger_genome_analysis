#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Maker_step_6.1
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se


module load bioinfo-tools
module load maker/3.01.1-beta
module load augustus/3.3.3

etraining --species=durian augustus.gbk.train
augustus --species=durian augustus.gbk.test | tee first_training.out
