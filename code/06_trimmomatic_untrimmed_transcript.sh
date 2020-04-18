#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00
#SBATCH -J trimmomatic_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load trimmomatic/0.36

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -threads 2 -trimlog trimmomatic_log \
-basein /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/untimmed/*fastq.gz \
-baseout /home/erbu6020/erik_burger_genome_analysis/analyses/06_trimmomatic_untrimmed_transcript/SRR6040095_scaffold_06.fq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36