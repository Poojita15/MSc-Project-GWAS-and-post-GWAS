#####################################
# R Script for Data Extraction and Preparation
#####################################

# Purpose:
# This script loads datasets, extracts specific columns, performs data manipulation,
# and prepares various data files for further analysis.

# Note:
# - Ensure all required R objects (Robj files) are available in the specified paths.
# - Modify file paths as necessary to match your local environment.
# - This script assumes the use of R and requires access to relevant datasets.

module load R 

#####################################
# create covariate files for GWAS analysis 
#####################################

# Load and extract 'gsex' and 'agerectuit' columns from 'dset'
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/dset_18052023.Robj")
gsex <- dset[, c("gsex")]
agerectuit <- dset[, c("agerectuit")]

# Load the principal component scores dataset 'pcs'
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/pcs.Robj")

# Extract 'FID' and 'IID' columns from and first 10 principal components ('pc1' to 'pc10') from 'pcs'
df <- pcs[, c("FID", "IID")]
pcs10 <- pcs[, c("pc1", "pc2", "pc3", "pc4", "pc5", "pc6", "pc7", "pc8", "pc9", "pc10")]

# Combine 'df' with 'gsex' to create 'gsex_df'
gsex_df <- cbind(df, gsex)

# Combine 'df', 'agerectuit', and first 10 principal components to create 'agerectuit_df'
agerectuit_df <- cbind(df, agerectuit, pcs10)

# Write dataframes to a tab-delimited file
write.table(agerectuit_df, 
            file = "agerectuit.txt", 
            sep = "\t", 
            quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)
write.table(gsex_df, 
            file = "gsex.txt", 
            sep = "\t", 
            quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)

#####################################
# create phenotypic files for GWAS analysis 
#####################################

# Load the dataset containing ICD-10 codes 'icd10.2'
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/icd10_2_18052023.Robj")

# Extract ICD-10 codes relevant to papulosquamous disorders
pd <- c(264, 904, 966, 696, 938)
pap_dis <- icd10.2[, pd]

# Combine 'df' with papulosquamous disorder ICD-10 codes to create 'pap_dis_df'
pap_dis_df <- cbind(df, pap_dis)

# Write dataframe to a tab-delimited file
write.table(pap_dis_df, 
            file = "papulosquamous_disorders.txt", 
            sep = "\t", 
            quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)

# Extract ICD-10 codes relevant to dermatitis and eczema disorders
de <- c(939, 842, 1067, 783, 847, 894, 980, 461, 808, 776, 459)
der_ecz <- icd10.2[, de]

# Combine 'df' with dermatitis and eczema ICD-10 codes to create 'der_eczema_df'
der_eczema_df <- cbind(df, der_ecz)

# Write dataframes to a to a tab-delimited file
write.table(der_eczema_df, 
            file = "der_eczema.txt", 
            sep = "\t", 
            quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)

#####################################
# Create seperate dataframes for females and males for sex-stratified GWAS analysis
#####################################

gsex_df1 <- cbind(df, gsex)
male_df <- subset(gsex_df1, gsex == "Male", select = c("FID", "IID"))
female_df <- subset(gsex_df1, gsex == "Female", select = c("FID", "IID"))

# Write dataframes to a to a tab-delimited file
write.table(female_df, 
            file = "females.txt", 
            sep = "\t", quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)
write.table(male_df, 
            file = "males.txt", 
            sep = "\t", 
            quote = FALSE, 
            row.names = FALSE, 
            col.names = TRUE)

######################################

