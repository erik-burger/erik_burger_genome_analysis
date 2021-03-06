library("DESeq2")
# Musang King Aril
SRR6040094 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040094_count.txt")
SRR6040095 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040095_count.txt")
SRR6040097 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040097_count.txt")
# Musang King Leaf
SRR6040092 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040092_count.txt")

full_table <- SRR6040094[2]
names(full_table)[1] <- "SRR6040094"
full_table$SRR6040095 <- SRR6040095[,2]
full_table$SRR6040097 <- SRR6040097[,2]
full_table$SRR6040092 <- SRR6040092[,2]
rownames(full_table) <-SRR6040094[,1]

# Remove last rows that contained non gene information
full_table<-full_table[1:(nrow(full_table)-5),]

# Create metadata table
run_ID =c('SRR6040094', 'SRR6040095', 'SRR6040097', 'SRR6040092')
Sample_ID = c('SRS2515723', 'SRS2515723', 'SRS2515723', 'SRS2515726')
colData = data.frame(run_ID, Sample_ID)

ddsFullCountTable <- DESeqDataSetFromMatrix(
  countData = full_table,
  colData = colData,
  design = ~Sample_ID)
ddsFullCountTable

# Calcualte the change.
ddsFullCountTable <- DESeq(ddsFullCountTable)

# Obtain the results
res <- results(ddsFullCountTable)
mcols(res, use.names=TRUE)

# Plot the MA plot 
plotMA( res, ylim = c(-10, 10) )

#Plot a histogram of the obtained p-values
hist( res$pvalue, breaks=20, col="grey" )

#PCA comparing the two samples
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c( "Sample_ID")) )

# Remove results wit p-value over 0.05
reduced_res <- res[complete.cases(res$baseMean), ]
reduced_res <- reduced_res[complete.cases(reduced_res$pvalue), ]
reduced_res <- reduced_res[reduced_res$pvalue < 0.05,]

setwd('/Users/ErikBurger/Desktop/Genomanalys/erik_burger_genome_analysis/analyses/12_DESeq')
write.table(reduced_res, file='aril_vs_leaf.tsv',sep='\t',quote=FALSE)
setwd('/Users/ErikBurger/Desktop/Genomanalys/erik_burger_genome_analysis/code')