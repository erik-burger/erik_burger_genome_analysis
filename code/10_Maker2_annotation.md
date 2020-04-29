This is not a bash script like the previous code files but at wokflow of which command where run in what directories and what files whare changed. Folowing this  pipeline https://reslp.github.io/blog/My-MAKER-Pipeline/  

load modules:  
```
$ module load bioinfo-tools
$ module load maker/2.31.10
```


Part 1  

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
```
Then maker ran with the given parameters: 
```
$ maker
```

