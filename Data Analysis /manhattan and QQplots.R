################################################
#Manhattan plots for all, males and females gwas summary statistis for papulosqamous disorders and dermatitis and eczema 
################################################

#######################
#Manhattan plots for all papulosqamous disorders 
#######################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd 

module load R
R 

install.packages("qqman")

library(qqman)

gwasResults <- read.table("allpd.fastGWA", header=TRUE, stringsAsFactors=FALSE)

