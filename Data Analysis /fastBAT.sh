############################################
#Combine files for gene based analysis (fastBAT)
############################################

############################################
#Process papulosquamous disorders data for all samples
############################################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/allpd

nano fastBAT.sh 

#!/bin/bash

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' allpd_all_${i}.fastGWA > allpd_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBATf.sh

# Run the script
./fastBAT.sh

# Move the processed files to the specified directory
mv allpd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/allp

############################################
#Process papulosquamous disorders data for female samples
############################################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/femalespd

nano fastBATf.sh 

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' femalespd_all_${i}.fastGWA > femalespd_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBATf.sh

# Run the script
./fastBATf.sh

mv femalespd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/fp

############################################
#Process papulosquamous disorders data for male samples
############################################

cd /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/malespd

nano fastBATm.sh 

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' malespd_all_${i}.fastGWA > malespd_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBATm.sh

# Run the script
./fastBATm.sh

mv malespd_all_*.fastBAT /data/scratch/bt23718/GWAS_project/papulosquamous_disorders/fastBAT/stats/mp

############################################
#Process dermatitis and eczema data for all samples
############################################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/allde

nano fastBAT.sh

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' allde_all_${i}.fastGWA > allde_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBAT.sh

# Run the script
./fastBAT.sh

mv allde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/de

############################################
#Process dermatitis and eczema data for male samples
############################################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/malesde

nano fastBATm.sh

# Loop through files for chromosomes 1 to 23
for i in {1..23}
do
  # Use awk to process each file and reformat the output, saving to a new file
  awk 'BEGIN {FS=OFS="\t"} NR==1 {print "SNP", "A1", "A2", "freq", "BETA", "SE", "P", "N"; next} {print $2, $4, $5, $7, $11, $12, $13, $6 }' malesde_all_${i}.fastGWA > malesde_all_${i}.fastBAT
done

# Make the script executable
chmod +x fastBATm.sh

# Run the script
./fastBATm.sh

mv malesde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/mde

############################################
#Process dermatitis and eczema data for female samples
############################################

cd /data/scratch/bt23718/GWAS_project/dermatitis_eczema/femalesde

nano fastBATf.sh

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
mv femalesde_all_*.fastBAT /data/scratch/bt23718/GWAS_project/dermatitis_eczema/fastBAT/stats/fde
