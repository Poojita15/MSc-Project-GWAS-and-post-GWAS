############################################
# Combine files for genetic correltion analysis
############################################

# Concatenate individual chromosome result files for papulosquamous disorders into combined files

cat allpd_all_{1..23}.fastGWA > combinedpd.fastGWA
cat femalespd_all_{1..23}.fastGWA > combinedfpd.fastGWA
cat malespd_all_{1..23}.fastGWA > combinedmpd.fastGWA

# Reformat combined fastGWA files for males, females, and all samples

awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' pd_m_combined.fastGWA > malespd.fastGWA
awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' pd_f_combined.fastGWA > femalespd.fastGWA
awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' pd_all_combined.fastGWA >  allpd.fastGWA

# Secure copy the result files from remote server to local machine (Windows path)

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd/allpd.fastGWA.gz C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd/femalespd.fastGWA.gz C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd/malespd.fastGWA.gz C:\Users\karch\Downloads/

# Concatenate individual chromosome result files for dermatitis and eczema into combined files

cat allde_all_{1..23}.fastGWA > combinedde.fastGWA
cat femalesde_all_{1..23}.fastGWA > combinedfde.fastGWA
cat malesde_all_{1..23}.fastGWA > combinedmde.fastGWA

# Reformat combined fastGWA files for males, females, and all samples

awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' de_m_combined.fastGWA > malesde.fastGWA
awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' de_f_combined.fastGWA > femalesde.fastGWA
awk 'BEGIN {FS=OFS="\t"} NR==1 {print "CHR", "BP", "SNP", "A1", "A2", "FREQ", "BETA", "SE", "P", "N"; next} {print $1, $3, $2, $4, $5, $7, $11, $12, $13, $6}' de_all_combined.fastGWA > allde.fastGWA 

# Secure copy the result files from remote server to local machine (Windows path)

scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde/allde.fastGWA.gz C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde/femalesde.fastGWA.gz C:\Users\karch\Downloads/
scp bt23718@login.hpc.qmul.ac.uk:/data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde/malesde.fastGWA.gz C:\Users\karch\Downloads/



