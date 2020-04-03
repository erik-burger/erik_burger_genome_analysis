#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J bwa_alignment_illumina_to_pacbio
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se


module load bioinfo-tools
module load bwa/0.7.17

#bwa alignment that is piped to samtools to give a BAM output file instead of a SAM.
bwa mem -t 2  /home/erbu6020/erik_burger_genome_analysis/analyses/01_canu_pacbio_assembly/canu_durian_alignment.contigs.fasta \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/illumina/SRR6058604_scaffold_06.1P.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/illumina/SRR6058604_scaffold_06.2P.fastq.gz \
> /home/erbu6020/erik_burger_genome_analysis/analyses/03_bwa_illumina_alignment_with_pacbio/bwa_alignment_illumina.sam