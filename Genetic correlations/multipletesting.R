#########################################
# Multiple testing correction 
#########################################

# Secure copy the result files from local machine (Windows path) to remote server

scp PD.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/pd
scp PDM.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/pd
scp PDF.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/pd
scp DE.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/de
scp DEF.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/de
scp DEM.csv bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/ctgvl/de

######################
#Bonferroni correction for papulosqamous disorders LD Score (all samples)
######################
#change directoy 
cd  /data/scratch/bt23718/GWAS_project/ctgvl/pd

module load R

# Load data
data <- read.csv("PD.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "PD_sig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

# Get the top 10 results based on adjusted p-values
top_ten <- significant_data[order(significant_data$p), ][1:10, ]

write.table(top_ten, file = "PD.10", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

######################
#Bonferroni correction for papulosqamous disorders LD Score (male samples)
######################

# Load data
data <- read.csv("PDM.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "PDM_sig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

######################
#Bonferroni correction for papulosqamous disorders LD Score (female samples)
######################

# Load data
data <- read.csv("PDF.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "PDF_sig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

######################
#Bonferroni correction for dermatitis eczema LD Score (all samples)
######################
#change directoy 
cd  /data/scratch/bt23718/GWAS_project/ctgvl/de 

module load R

# Load data
data <- read.csv("DE.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "DE_sig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

# Get the top 10 results based on adjusted p-values
top_ten <- significant_data[order(significant_data$p), ][1:10, ]

write.table(top_ten, file = "DE.10", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)


######################
#Bonferroni correction for dermatitis eczema LD Score (female samples)
######################

# Load data
data <- read.csv("DEF.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "DEF_sig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

# Get the top 10 results based on adjusted p-values
top_ten <- significant_data[order(significant_data$p), ][1:10, ]

write.table(top_ten, file = "DEF.10", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

######################
#Bonferroni correction for dermatitis eczema LD Score (male samples)
######################

#load data
data <- read.csv("DEM.csv", header=TRUE, stringsAsFactors=FALSE)

#rename the column
names(data)[names(data)=="X...p2"] <-"p2"

#remove all rows with NA values
data <- na.omit(data)

#adjust pvalue 
data$p <- p.adjust(data$p, method = "bonferroni")

df <- subset(data, select = -c(p2, Cohort, URL, Notes))

# Filter values with adjusted p-value < 0.05
significant_data <- df [df$p < 0.05, ]

write.table(significant_data, file = "DEM_nsig", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)
