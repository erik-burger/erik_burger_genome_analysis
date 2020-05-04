# Maker2
This is not a bash script like the previous code files but at wokflow of which command where run in what directories and what files whare changed. Folowing this  pipeline https://reslp.github.io/blog/My-MAKER-Pipeline/  

load modules:  
```
$ module load bioinfo-tools
$ module load maker/3.01.1-beta
$ module load snap/2013-11-29 
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
snaphmm = /home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/my_genome.hmm

est= 
protein=

est2genome=0
protein2genome=0
```
 

Run maker using the batch script 10_Maker2_step_3.sh


salloc -A g2020008 -p core -n 2 -t 00:30:00

cp -r pilon_assembly.maker.output_ROUND1 pilon_assembly.maker.output

/home/erbu6020/erik_burger_genome_analysis/analyses/10_Maker2_annotation/pilon_assembly.maker.output/SNAP_round_1/my_genome.hmm