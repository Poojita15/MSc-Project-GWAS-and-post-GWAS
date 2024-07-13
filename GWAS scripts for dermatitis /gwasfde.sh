""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#GCTA Analysis Script for GWAS -- female patients with dermatitis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#!/bin/bash
#$ -pe smp 5                    # Request 5 CPU cores
#$ -l h_vmem=10G                # Request 10 GB of RAM per core
#$ -cwd                         # Run the job from the current working directory
#$ -l h_rt=72:0:0               # Request 72 hours of runtime
#$ -N allde                     # Name the job "allde"
#$ -t 1-22                      # Array job with tasks from 1 to 22 (for chromosome 1 to 22)
#$ -j y                         # Merge standard error with standard output

# Run GCTA for chromosomes 1-22 using fastGWA-mlm-binary model

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --fastGWA-mlm-binary \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23718/GWAS_project/dermatitis_eczema/der_ecz_phe.txt \
--out femalesde/femalesde_all_${SGE_TASK_ID} \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--qcovar /data/scratch/bt23718/GWAS_project/dermatitis_eczema/agerectuit.txt \
--remove /data/scratch/bt23718/GWAS_project/dermatitis_eczema/males.txt \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen \
--thread-num ${NSLOTS}

# Run GCTA to create a model for chromosome X

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --fastGWA-mlm-binary \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23718/GWAS_project/dermatitis_eczema/der_ecz_phe.txt \
--out femalesde/femalesde_all_x_model \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--remove /data/scratch/bt23718/GWAS_project/dermatitis_eczema/males.txt \
--qcovar /data/scratch/bt23718/GWAS_project/dermatitis_eczema/agerectuit.txt \
--model-only \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c22_b0_v3.bgen \
--keep /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--thread-num ${NSLOTS} 

# applying fitted model to the X chromosome data

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--load-model femalesde/femalesde_all_x_model.fastGWA \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--out femalesde/females_all_23 \
--thread-num ${NSLOTS} 
