#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J tophat_alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load tophat/2.1.1

tophat -p 2 -o /home/erbu6020/erik_burger_genome_analysis/analyses/08_tophat_alignment \
/home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/pilon_assembly.fasta \
/home/erbu6020/erik_burger_genome_analysis/analyses/06_trimmomatic_untrimmed_transcript/*paired.fq.gz\
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/*.fastq.gz