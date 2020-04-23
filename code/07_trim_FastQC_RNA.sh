#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J trim_FastQC_trans
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load FastQC/0.11.8

# SRR6040095 (sequence that was trimmed by me)
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/analyses/06_trimmomatic_untrimmed_transcript/*.fq.gz \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040095 \
 -t 2

# SRR6040092
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040092 \
 -t 2

# SRR6040093
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040093_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040093 \
 -t 2

# SRR6040094
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040094 \
 -t 2

# SRR6040096
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040096_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040096 \
 -t 2

# SRR6040097
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6040097 \
 -t 2

# SRR6156066
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6156066 \
 -t 2

# SRR6156067
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6156067 \
 -t 2

# SRR6156069
fastqc \
 /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_06.* \
 -o /home/erbu6020/erik_burger_genome_analysis/analyses/07_trim_FastQC_RNA/SRR6156069 \
 -t 2