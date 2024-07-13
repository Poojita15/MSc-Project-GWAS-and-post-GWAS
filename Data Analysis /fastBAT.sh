############################################
#Combine files for gene based analysis (fastBAT)
############################################

############################################
#Process papulosquamous disorders data for all, female and male samples
############################################

#!/bin/bash

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' allpd_all_${i}.fastGWA > allpd_all_${i}.fastBAT
done

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' femalespd_all_${i}.fastGWA > femalespd_all_${i}.fastBAT
done

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' malespd_all_${i}.fastGWA > malespd_all_${i}.fastBAT
done

############################################
#Process dermatitis and eczema data for all, female and male samples
############################################

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' allde_all_${i}.fastGWA > allde_all_${i}.fastBAT
done

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' malesde_all_${i}.fastGWA > malesde_all_${i}.fastBAT
done

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' femalesde_all_${i}.fastGWA > femalesde_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBATf.sh

# Run the script
./fastBATf.sh

# Move the processed files to the specified directory
mv allpd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/allp
mv femalespd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/fp
mv malespd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/mp
mv allde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/de
mv malesde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/mde
mv femalesde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/fde
