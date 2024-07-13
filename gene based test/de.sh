#!/bin/bash
#$ -pe smp 5
#$ -l h_vmem=10G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N degene
#$ -t 1-23
#$ -j y

#Run GCTA for fastBAT analysis (all samples)
  
/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/de/allde_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out output/deo/de_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 

#Run GCTA for fastBAT analysis (female samples)

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/fde/femalesde_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out output/fdeo/fde_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 

#Run GCTA for fastBAT analysis (male samples)

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/mde/malesde_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out output/mdeo/mde_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 
