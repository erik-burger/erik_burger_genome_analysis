# Maker2
This is not a bash script like the previous code files but at wokflow of which command where run in what directories and what files whare changed. Folowing this  pipeline https://reslp.github.io/blog/My-MAKER-Pipeline/  

load modules:  
```
$ module load bioinfo-tools
$ module load maker/3.01.1-beta
$ module load snap/2013-11-29 
$ module load augustus/3.3.3
```


## STEP 1  

```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation

$ maker -CTL
```
In the file maker_opts.ctl some input and parameters were set as folowing:  
```
genome= /home/erbu6020/erik_burger_genome_analysis/analyses/04_pilon_assembly/pilon_assembly.fasta

est= /home/erbu6020/erik_burger_genome_analysis/analyses/09_trinity_assembly_SRR6040092/trinity_out_dir/Trinity-GG.fasta

protein=  /home/erbu6020/erik_burger_genome_analysis/data/Proteome_data/combined_proteome_reference.fasta

est2genome=1
protein2genome=1

cpus=4
```
Then maker ran with the given parameters using the bash script 10_Maker2_step_1.sh
```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_1.sh
```

copied the output to into the file pilon_assembly.maker.output_ROUND1: 

```
cp -r pilon_assembly.maker.output pilon_assembly.maker.output_ROUND1
```

## STEP 2 (training SNAP)

Exctract maker results

```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output

gff3_merge -d pilon_assembly_master_datastore_index.log
```

Generate necessary files for training SNAP
```
mkdir SNAP_round_1
cd SNAP_round_1
maker2zff ../pilon_assembly.all.gff
```

Validate the models to see if some are bad
```
fathom genome.ann genome.dna -validate > snap_validate_output.txt
```

Output: ``` 1391 genes, 1390 OK, 459 warnings, 1 errors ```

Find the error model:
```
cat snap_validate_output.txt | grep "error" 
```

Remove the error model:
```
grep -vwE "MODEL16" genome.ann > genome.ann2
```
Validate again:
```
fathom genome.ann2 genome.dna -validate
```
Output: ```1390 genes, 1390 OK, 458 warnings, 0 errors ```

Create remainig fines that are needed for SNAP: 
```
fathom genome.ann2 genome.dna -categorize 1000
fathom uni.ann uni.dna -export 1000 -plus
forge export.ann export.dna
```

Train SNAP with a hmm-assembler.  

```
hmm-assembler.pl my_genome . > my_genome.hmm
```

## STEP 3

Changed the maker_opts.ctl file:
```
snaphmm = /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_1/my_genome.hmm

est= 
protein=

est2genome=0
protein2genome=0
```
 

Run maker using the batch script 10_Maker2_step_3.sh

```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_3.sh
```

Create a copy
```
cp -r pilon_assembly.maker.output pilon_assembly.maker.output_ROUND2
```

## STEP 4

Repeat step 2


Extect maker result
```
gff3_merge -d pilon_assembly_master_datastore_index.log
```

Generate necessary files for training SNAP
```
mkdir SNAP_round_2
cd SNAP_round_2
maker2zff -n ../pilon_assembly.all.gff
```

Validate the models to see if some are bad
```
fathom genome.ann genome.dna -validate > snap_validate_output.txt
```
Output: ```2648 genes, 2647 OK, 1049 warnings, 1 errors```

Find faulty model
```
cat snap_validate_output.txt | grep "error" 
```

Remove faulty model
```
grep -vwE "MODEL6064" genome.ann > genome.ann2
```

VAlidate again
```
fathom genome.ann2 genome.dna -validate 
```
Output: ```2647 genes, 2647 OK, 1048 warnings, 0 errors```


Create remainig fines that are needed for SNAP: 
```
fathom genome.ann genome.dna -categorize 1000
fathom uni.ann uni.dna -export 1000 -plus 
forge export.ann export.dna
```

Train SNAP with hmm-assembler.  
```
hmm-assembler.pl my_genome . > my_genome.hmm
```

## STEP 5

Repeat step 3

Changed the maker_opts.ctl file:
```
snaphmm = /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_2/my_genome.hmm
```
 

Run maker using the batch script 10_Maker2_step_3.sh (since it is the same)

```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_3.sh
```

Create a copy
```
cp -r pilon_assembly.maker.output pilon_assembly.maker.output_ROUND3
```

## STEP 6 

Copy the code from https://github.com/hyphaltip/genome-scripts/blob/master/gene_prediction/zff2augustus_gbk.pl to be able to convert zff to gbk into the SNAP_round_2 folder

Creating needed gbk file
```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_2

perl zff2augustus_gbk.pl > augustus.gbk
```

Bookkeeping:
```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output

mkdir augustus

cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_2

mv augustus.gbk /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus.gbk
```
Split the data so that training can be enabled:
```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/

perl /sw/bioinfo/augustus/3.3.3/rackham/scripts/randomSplit.pl /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus.gbk 100
```

Created a local copy of augustus config directory:
```
source $AUGUSTUS_CONFIG_COPY
```

Created a new pecies and trained augustus:
```
perl /sw/bioinfo/augustus/3.3.3/rackham/scripts/new_species.pl --species=durian

etraining --species=durian augustus.gbk.train
augustus --species=durian augustus.gbk.test | tee first_training.out
```

Optimize the training by running the bash script 10_Maker2_step6.sh
```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_6.sh
```

```
etraining --AUGUSTUS_CONFIG_PATH=/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config --species=durian augustus.gbk.train
augustus --AUGUSTUS_CONFIG_PATH=/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/augustus/augustus_config --species=durian augustus.gbk.test | tee second_training.out
```

## Step 7

Changed the maker_opts.ctl file:
```
augustus_species=durian
keep_preds=1
```
Run maker
```
cd /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_7.sh
```

Create a copy
```
cp -r pilon_assembly.maker.output pilon_assembly.maker.output_ROUND4
```

## Step 8

Create a GeneMark predictor using the script 10_Maker2_step_8.sh

```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_8.sh
```

## Step 9

Changed the maker_opts.ctl file:
```
gmhmm=/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/geneMark/gmhmm.mod
```

run maker for the last time. (Can do this with the same code as in step 7)
```
sbatch /home/erbu6020/erik_burger_genome_analysis/code/10_Maker2_step_7.sh
```

## Continuation 
Ran the fasta_merge script in maker to create a fasta so that the genes discovered can be identified later on.

```
dc home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/

gff3_merge -d pilon_assembly_master_datastore_index.log
```



junk:
salloc -A g2020008 -p core -n 2 -t 00:30:00
salloc -A g2020008 -p core -n 2 -t 02:00:00 --reservation=g2020008_05

cp -r pilon_assembly.maker.output pilon_assembly.maker.output_ROUND4


/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_1/my_genome.hmm

