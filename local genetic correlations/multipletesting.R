#######################
#Bonferroni correction for local genetic correlations 
######################

# all samples  

data <- read.table("/data/scratch/bt23718/GWAS_project/SUPERGNOVA/output/all.txt", header=TRUE, stringsAsFactors=FALSE)
data <- na.omit(data)
data$p <- p.adjust(data$p, method = "bonferroni")
write.table(data, file = "all_pad", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)
significant_data <- data [data$p < 0.05, ]
write.table(data, file = "all_sigp", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

# female samples

data <- read.table("/data/scratch/bt23718/GWAS_project/SUPERGNOVA/output/females.txt", header=TRUE, stringsAsFactors=FALSE)
data <- na.omit(data)
data$p <- p.adjust(data$p, method = "bonferroni")
write.table(data, file = "f_pad", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)
significant_data <- data [data$p < 0.05, ]
write.table(data, file = "f_sigp", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

# male samples

data <- read.table("/data/scratch/bt23718/GWAS_project/SUPERGNOVA/output/males.txt", header=TRUE, stringsAsFactors=FALSE)
data <- na.omit(data)
data$p <- p.adjust(data$p, method = "bonferroni")
write.table(data, file = "m_pad", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)
significant_data <- data [data$p < 0.05, ]
