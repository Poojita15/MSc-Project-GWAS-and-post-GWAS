MSc-Project-GWAS-and-post-GWAS

A repository of files used in my six months group project: " Genentic basics of psoriasis and atopic dermatitis"

Important Note: The file paths in this project are configured for the original development environment. Before running the project, you must update these paths to match your system's configuration. Ensure that all file paths in the code are correctly directed to your directories.

Acknowledgments: The command-line tools used in this project were developed by others, and full credit goes to the respective authors.

For more information about the tools that i've used: 
GCTA- https://yanglab.westlake.edu.cn/software/gcta/#Overview 
LDSC - https://github.com/bulik/ldsc
SUPERGNOVA- https://github.com/qlu-lab/SUPERGNOVA
GenoPred- https://opain.github.io/GenoPred/
PLINK2- https://www.cog-genomics.org/plink/2.0/ 

To perform GWAS for papulosquamous disorders, run:

gwaspd.sh, gwasmpd.sh, gwasfpd.sh

To perform GWAS for dermatitis, run:

gwasde.sh, gwasfde.sh, gwasmde.sh

Step 2: Gene-Based Test Using GCTA Software

Before running the gene-based test, format the input files as required. Then, execute:

de.sh, pd.sh

Step 3: Heritability and LD Intercept

Format the summary statistics using 'munge_sumstats.py' from the LDSC package, then run:

LD.sh

Use the summary statistics formatted by munge_sumstats.py, and then execute the script:

correlation.py

Step 5: Polygenic Risk Scores











