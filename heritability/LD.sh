#####################################
# to estimate Heritability, Genetic Correlation and the LD Score Regression Intercept
#####################################

cd /data/scratch/bt23718/GWAS_project/ldsc

module load anaconda3

conda activate ldsc

module unload anaconda3

#!/bin/bash

module load python/2.7.15

#estimate LD score regression intercept for dermatitis and papulosqamous disorders (all samples)

/data/scratch/bt23718/GWAS_project/ldsc/ldsc.py \
--rg /data/scratch/bt23718/GWAS_project/ldsc/data/de/allde.sumstats,/data/scratch/bt23718/GWAS_project/ldsc/data/pd/allpd.sumstats \
--ref-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--w-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--out /data/scratch/bt23718/GWAS_project/ldsc/allde_allpd 

#estimate LD score regression intercept for dermatitis and papulosqamous disorders (female samples)

/data/scratch/bt23718/GWAS_project/ldsc/ldsc.py \
--rg /data/scratch/bt23718/GWAS_project/ldsc/data/de/fde.sumstats,/data/scratch/bt23718/GWAS_project/ldsc/data/pd/femalespd.sumstats \
--ref-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--w-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--out /data/scratch/bt23718/GWAS_project/ldsc/fde_fpd

#estimate LD score regression intercept for dermatitis and papulosqamous disorders (male samples)

/data/scratch/bt23718/GWAS_project/ldsc/ldsc.py \
--rg /data/scratch/bt23718/GWAS_project/ldsc/data/de/malesde.sumstats,/data/scratch/bt23718/GWAS_project/ldsc/data/pd/malespd.sumstats \
--ref-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--w-ld-chr /data/SBBS-FreydinLab/tools/ldsc/eur_w_ld_chr/ \
--out /data/scratch/bt23718/GWAS_project/ldsc/mde_mpd

chmod +x LD.sh 

./LD.sh
