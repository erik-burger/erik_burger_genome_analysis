#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J pilon_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load Pilon/1.22
module load samtools/1.10

samtools index /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina_sorted.bam

java -Xmx16G -jar $PILON_HOME/pilon.jar \
--genome /home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly/canu_durian_alignment.contigs.fasta \
--frags /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina_sorted.bam \
--output pilon_assembly \
--outdir /home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/
