########################
# remove all NA values from summary statistics obtained by runnin munge_sumstats.py
########################

cd /data/scratch/bt23718/GWAS_project/ldsc/data/pd/

module load R

# for all samples with papulosqamous disorders

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/pd/allpd.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)

#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]

write.table(filtered_data, file="pd.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)

# for female samples with papulosqamous disorders

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/pd/femalespd.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)
#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]
write.table(filtered_data, file="fpd.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)

# for male samples with papulosqamous disorders

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/pd/malespd.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)
#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]
write.table(filtered_data, file="mpd.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)

cd /data/scratch/bt23718/GWAS_project/ldsc/data/pd/

#for male samples with dermatitis and eczema

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/de/allde.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)
#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]
write.table(filtered_data, file="de.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)

#for female samples with dermatitis and eczema

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/de/fde.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)
#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]
write.table(filtered_data, file="def.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)

#for male samples with dermatitis and eczema

data <- "/data/scratch/bt23718/GWAS_project/ldsc/data/de/malesde.sumstats"
data<- read.table(data, header=TRUE, sep="\t", stringsAsFactors=FALSE)
#remove all rows with NA values
filtered_data <- data[complete.cases(data[, -1]), ]
write.table(filtered_data, file="mde.sumstats", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
