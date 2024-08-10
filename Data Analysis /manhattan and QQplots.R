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

data <- read.table("allpd.fastGWA", header=TRUE, stringsAsFactors=FALSE)

manhattan(data, main = "Manhattan Plot (Dermatitis)", 
          ylim = c(0, 10), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = T, 
          genomewideline = T)

qq(data$P, main = "Q-Q plot of Dermatitis GWAS", 
   xlim = c(0, 7), 
   ylim = c(0,12), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)
