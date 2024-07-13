###############################
# reformation summary statistics using munge_sumstats.py 
###############################

#!/bin/bash

#reformation of dermatitis GWAS summmary statistics (female samples)

/data/scratch/bt23718/GWAS_project/ldscmunge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde/de_f_combined.fastGWA \
--N 250154 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/de/fde \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

#reformation of dermatitis GWAS summmary statistics (all samples)

/data/scratch/bt23718/GWAS_project/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde/de_all_combined.fastGWA \
--N 460961 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/de/allde \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

#reformation of dermatitis GWAS summmary statistics (male samples)

/data/scratch/bt23718/GWAS_project/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde/de_m_combined.fastGWA \
--N 210807 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/de/malesde \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

#reformation of papulosqamous disorders GWAS summmary statistics (male samples)

/data/scratch/bt23718/GWAS_project/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd/pd_m_combined.fastGWA \
--N 210807 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/pd/malespd \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

#reformation of papulosqamous disorders GWAS summmary statistics (female samples)

/data/scratch/bt23718/GWAS_project/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd/pd_f_combined.fastGWA \
--N 250154 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/pd/femalespd \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

#reformation of papulosqamous disorders GWAS summmary statistics (all samples)

/data/scratch/bt23718/GWAS_project/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd/pd_all_combined.fastGWA \
--N 460961 \
--out /data/scratch/bt23718/GWAS_project/ldsc/data/pd/allpd \
--merge-alleles /data/scratch/bt23718/GWAS_project/ldsc/w_hm3.snplist

chmod +x sumstats.sh 

./sumstats.sh 

