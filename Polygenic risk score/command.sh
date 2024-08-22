#!/bin/bash
#$ -pe smp 5
#$ -l h_vmem=10G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N det
#$ -j y

module load anaconda3
conda activate genopred

#command to run snakemake pipeline to calculate PRS using target_pgs method
snakemake -j5 --use-conda --configfile=input_files/det/config.yaml target_pgs
