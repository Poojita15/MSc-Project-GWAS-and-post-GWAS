#!/bin/bash
#$ -pe smp 5
#$ -l h_vmem=10G
##$ -l highmem
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N allpd
#$ -t 1-22
#$ -j y

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --fastGWA-mlm-binary \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/pap_dis.txt \
--out allpd/allpd_all_${SGE_TASK_ID} \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--covar /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/gsex.txt \
--qcovar /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/agerectuit.txt \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen \
--thread-num ${NSLOTS}

# For X chromosome (all)
/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --fastGWA-mlm-binary \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/pap_dis.txt \
--out allpd/allpd_all_x_model \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--covar /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/gsex.txt \
--qcovar /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/agerectuit.txt \
--model-only \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c22_b0_v3.bgen \
--keep /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--thread-num ${NSLOTS}

# applying a previously fitted model to the X chromosome data
/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--load-model allpd/allpd_all_x_model.fastGWA \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--out allpd/allpd_all_23 \
--thread-num ${NSLOTS}
