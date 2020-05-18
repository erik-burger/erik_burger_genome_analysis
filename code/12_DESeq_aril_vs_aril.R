library("DESeq2")
#### Create Tables ####
#Read n the data
# Musang King Aril
SRR6040094 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040094_count.txt")
SRR6040095 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040095_count.txt")
SRR6040097 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6040097_count.txt")
# Monthong
SRR6156066 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6156066_count.txt")
SRR6156067 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6156067_count.txt")
SRR6156069 = read.table(file="../analyses/11_Htseq_expr_analysis/SRR6156069_count.txt")

#Create the combined tabel of the data
# Musang King Aril
full_table <- SRR6040094[2]
names(full_table)[1] <- "SRR6040094"
full_table$SRR6040095 <- SRR6040095[,2]
full_table$SRR6040097 <- SRR6040097[,2]
# Musang King Aril
full_table$SRR6156066 <- SRR6156066[,2]
full_table$SRR6156067 <- SRR6156067[,2]
full_table$SRR6156069 <- SRR6156069[,2]
rownames(full_table) <-SRR6040094[,1]

# Remove last rows that contained non gene information
full_table<-full_table[1:(nrow(full_table)-5),]

# Create metadata table
run_ID =c('SRR6040094', 'SRR6040095', 'SRR6040097', 'SRR6156066', 'SRR6156067', 'SRR6156069')
Sample_ID = c('SRS2515723', 'SRS2515723', 'SRS2515723', 'SRS2580069', 'SRS2580069', 'SRS2580069')
colData = data.frame(run_ID, Sample_ID)

#### Deseq2 ####

#creating the count table with the sample ID as a differetiator
ddsFullCountTable <- DESeqDataSetFromMatrix(
  countData = full_table,
  colData = colData,
  design = ~Sample_ID)
ddsFullCountTable

# Collapse the replicates (this was not used since Deseq2 can not unse 1 to 1 inputs)
ddsCollapsed <- collapseReplicates( ddsFullCountTable,
                                    groupby = ddsFullCountTable$Sample_ID,
                                    )

# Calcualte the change.
ddsFullCountTable <- DESeq(ddsFullCountTable)

# Obtain the results
res <- results(ddsFullCountTable)
mcols(res, use.names=TRUE)

# Plot the MA plot 
plotMA( res, ylim = c(-10, 10) )

#Plot a histogram of the obtained p-values
hist( res$pvalue, breaks=20, col="grey" )

#Rlog transforms the data
rld <- rlog( ddsFullCountTable)
head( assay(rld) )


#scatterplot comparison between run SRR6040094 and SRR6040095
par( mfrow = c( 1, 2) )
plot( log2( 1+counts(ddsFullCountTable, normalized=TRUE)[, 1:2] ), col="#00000020", pch=20, cex=0.3 )
plot( assay(rld)[, 1:2], col="#00000020", pch=20, cex=0.3 )


#PCA comparing the two samples
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c( "Sample_ID")) )
