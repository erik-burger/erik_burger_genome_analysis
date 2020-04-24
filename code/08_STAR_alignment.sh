#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J STAR_alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load star/2.7.2b

# Create index files
star --runThreadN 4 --runMode genomeGenerate --genomeSAindexNbases 13 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--genomeFastaFiles /home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/pilon_assembly.fasta \

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040092/
# SRR6040092
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040093/
# SRR6040093
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040093_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040093_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040094/
# SRR6040094
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040095/
# SRR6040095
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/analyses/06_trimmomatic_untrimmed_transcript/SRR6040095_scaffold_06_forward_paired.fq.gz \
/home/erbu6020/erik_burger_genome_analysis/analyses/06_trimmomatic_untrimmed_transcript/SRR6040095_scaffold_06_reverse_paired.fq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040096/
# SRR6040096
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040096_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040096_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6040097/
# SRR6040097
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6156066/
# SRR6156066
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6156067/
# SRR6156067
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_06.2.fastq.gz

cd /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/SRR6156069/
# SRR6156069
star --runThreadN 4 \
--genomeDir /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/indexed_genome \
--readFilesIn /home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_06.1.fastq.gz \
/home/erbu6020/erik_burger_genome_analysis/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_06.2.fastq.gz