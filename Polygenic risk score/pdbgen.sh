#!/bin/bash
#$ -pe smp 12
#$ -l h_vmem=20G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N pdbgen
#$ -t 1-22
#$ -j y

module load  plink/2.0-20220603

# Train samples (1-22 chromosomes)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
       --keep /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/trial_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/pd/trial/trialpd_chr${SGE_TASK_ID} \
       --thread-num ${NSLOTS}

#Test samples (1-22 chromosomes)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
       --keep /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/validation_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/pd/validation/valpd_chr${SGE_TASK_ID} \
       --thread-num ${NSLOTS}.

# Train samples set (chromosome X)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
       --keep /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/trial_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/pd/trial/trialpd_chr23 \
       --thread-num ${NSLOTS}

#Test samples set (chromosme X)
plink2 --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen ref-first \
       --sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
       --keep /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/validation_set.txt \
       --maf 0.05 \
       --geno 0.1 \
       --mind 0.1 \
       --make-pgen \
       --out /data/scratch/bt23718/GWAS_project/bgen/pd/validation/valpd_chr23 \
       --thread-num ${NSLOTS}
