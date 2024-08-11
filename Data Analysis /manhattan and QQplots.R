################################################
#Manhattan plots for all, males and females gwas summary statistis for papulosqamous disorders and dermatitis and eczema 
################################################

#######################
#Manhattan plots and QQ plots for all papulosqamous disorders GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd 

module load R
R 

install.packages("qqman")

library(qqman)

data <- read.table("allpd.fastGWA", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_psoriasis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Psoriasis - All)", 
          ylim = c(0, 100), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_psoriasis.png", width = 1200, height = 800)

qq(data$P, main = "Q-Q plot of Psoriasis (all GWAS)", 
   xlim = c(0, 6), 
   ylim = c(0,200), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd/QQ_plot_psoriasis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd/manhattan_plot_psoriasis.png C:\Users\karch\Downloads/

#######################
#Manhattan plots and QQ plots for female papulosqamous disorders GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd 

module load R

R 

library(qqman)

data <- read.table("femalespd.fastGWA.gz", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_fpsoriasis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Psoriasis - Females)", 
          ylim = c(0, 120), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_fpsoriasis.png", width = 1200, height = 800)


qq(data$P, main = "Q-Q plot of Psoriasis (Female GWAS)", 
   xlim = c(0, 6), 
   ylim = c(0,120), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()


scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd/QQ_plot_fpsoriasis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd/manhattan_plot_fpsoriasis.png C:\Users\karch\Downloads/

#######################
#Manhattan plots and QQ plots for male papulosqamous disorders GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd 

module load R

R 

library(qqman)


data <- read.table("malespd.fastGWA.gz", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_mpsoriasis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Psoriasis - Males)", 
          ylim = c(0, 100), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_mpsoriasis.png", width = 1200, height = 800)


qq(data$P, main = "Q-Q plot of Psoriasis (Male GWAS)", 
   xlim = c(0, 6), 
   ylim = c(0,100), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd/QQ_plot_mpsoriasis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd/manhattan_plot_mpsoriasis.png C:\Users\karch\Downloads/

#######################
#Manhattan plots and QQ plots for all dermatitis GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde

module load R

R 

library(qqman)

data <- read.table("allde.fastGWA", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_dermatitis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Dermatitis - All)", 
          ylim = c(0, 20), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_dermatitis.png", width = 1200, height = 800)

qq(data$P, main = "Q-Q plot of Dermatitis (All GWAS)", 
   xlim = c(0, 6), 
   ylim = c(0,12), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde/QQ_plot_dermatitis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde/manhattan_plot_dermatitis.png C:\Users\karch\Downloads/

#######################
#Manhattan plots and QQ plots for female dermatitis GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde

module load R

R 

library(qqman)

data <- read.table("femalesde.fastGWA.gz", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_fdermatitis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Dermatitis - Females)", 
          ylim = c(0, 12), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_fdermatitis.png", width = 1200, height = 800)


qq(data$P, main = "Q-Q plot of Dermatitis (Female GWAS)", 
   xlim = c(0, 8), 
   ylim = c(0,12), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde/QQ_plot_fdermatitis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde/manhattan_plot_fdermatitis.png C:\Users\karch\Downloads/

#######################
#Manhattan plots and QQ plots for male dermatitis GWAS
#######################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde

module load R

R 

library(qqman)

data <- read.table("malesde.fastGWA.gz", header=TRUE, stringsAsFactors=FALSE)

png("manhattan_plot_mdermatitis.png", width = 1200, height = 800)

manhattan(data, 
          main = "Manhattan Plot (Dermatitis - Males)", 
          ylim = c(0, 10), 
          cex = 0.6, 
          cex.axis = 0.9, 
          col = c("red", "blue"), 
          suggestiveline = TRUE, 
          genomewideline = TRUE)

# Close the PNG device
dev.off()

png("QQ_plot_mdermatitis.png", width = 1200, height = 800)


qq(data$P, main = "Q-Q plot of Dermatitis (Male GWAS)", 
   xlim = c(0, 8), 
   ylim = c(0,12), 
   pch = 18, 
   col = "blue4", 
   cex = 1.5, 
   las = 1)

dev.off()

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde/QQ_plot_mdermatitis.png C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde/manhattan_plot_mdermatitis.png C:\Users\karch\Downloads/

