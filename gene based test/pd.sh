###############################################
#GCTA Analysis Script for gene based test all, male and female patients with dermatitis and eczema
###############################################

#!/bin/bash
#$ -pe smp 5                    # Request 5 CPU cores
#$ -l h_vmem=10G                # Request 10 GB of RAM per core
#$ -cwd                         # Run the job from the current working directory
#$ -l h_rt=72:0:0               # Request 72 hours of runtime
#$ -N degene                    # Name the job "degene"
#$ -t 1-23                      # Array job with tasks from 1 to 23 (for chromosome 1 to 22 and X)
#$ -j y                         # Merge standard error with standard output

#Run GCTA for fastBAT analysis (all samples)

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/allp/allpd_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out pd/pd_gene_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 

#Run GCTA for fastBAT analysis (female samples)

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/fp/femalespd_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out output/fpdo/fpd_gene_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 

#Run GCTA for fastBAT analysis (male samples)

/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta --bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/mp/malespd_all_${SGE_TASK_ID}.fastBAT \
--fastBAT-gene-list /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/gene_list.txt \
--out output/mpd/mpd_gene_${SGE_TASK_ID} \
--thread-num ${NSLOTS} 

#submit the job 
qsub pd.sh

