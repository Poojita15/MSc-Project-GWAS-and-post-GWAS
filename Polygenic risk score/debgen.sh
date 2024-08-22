#!/bin/bash
#$ -pe smp 12
#$ -l h_vmem=20G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N debgen
#$ -t 1-22
#$ -j y

module load  plink/2.0-20220603

# Train samples processing (1-22 chromosomes)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
       --keep /data/scratch/bt23718/GWAS_project/dermatitis_eczema/trial_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/de/trial/trial_chr${SGE_TASK_ID} \
       --thread-num ${NSLOTS}

# Test samples processing (1-22 chromosomes)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
       --keep /data/scratch/bt23718/GWAS_project/dermatitis_eczema/validation_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/de/validation/valde_chr${SGE_TASK_ID} \
       --thread-num ${NSLOTS}

# Train samples (X-chromosome)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
       --keep /data/scratch/bt23718/GWAS_project/dermatitis_eczema/trial_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/de/trial/trial_chr23 \
       --thread-num ${NSLOTS}
       
#Test samples (X-chromosomes)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
       --keep /data/scratch/bt23718/GWAS_project/dermatitis_eczema/validation_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/de/validation/valde_chr23 \
       --thread-num ${NSLOTS}