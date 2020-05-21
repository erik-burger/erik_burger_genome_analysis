#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH -J Htseq_11
#SBATCH --mail-type=ALL
#SBATCH --mail-user erik.burger@hotmail.se

module load bioinfo-tools
module load htseq/0.9.1

# removes nucleotides from gff file
sed -n '1,489609p' /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/pilon_assembly.all.gff > pilon_assembly_no_nuc.all.gff 

# Loop over all the runs and counts ther expression
for SRR in SRR6040092 SRR6040093 SRR6040094 SRR6040095 SRR6040096 SRR6040097 SRR6156066 SRR6156067 SRR6156069
do
htseq-count -m union -f sam -i ID /home/erbu6020/erik_burger_genome_analysis/analyses/08_STAR_alignment/${SRR}/Aligned.out.sam pilon_assembly_no_nuc.all.gff >> ${SRR}_count.txt
done
