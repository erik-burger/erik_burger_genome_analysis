#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J Augustus_step_6
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

optimize_augustus.pl --species=durian augustus.gbk.train --cpus=4