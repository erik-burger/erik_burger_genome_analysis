#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 6:00:00
#SBATCH -J trinity_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load trinity/2.9.1
module load samtools/1.10

samtools view -Sb /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040092/Aligned.out.sam \
/home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/Aligned_SRR6040092.bam

samtools sort /home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/Aligned_SRR6040092.bam \
/home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/Aligned_sorted_SRR6040092.bam

Trinity --genome_guided_bam /home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/Aligned_sorted_SRR6040092.bam \
--genome_guided_max_intron 10000 --max_memory 10G --CPU 4 