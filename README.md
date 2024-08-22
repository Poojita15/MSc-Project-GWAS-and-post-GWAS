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

STEP1: Retrieve data for GWAS

To perform GWAS, begin by retrieving the necessary data from the main files. You can do this by executing the Retrieve_data.R script. This script will extract and organize the data required for subsequent analyses.

STEP2: Perform GWAS analysis 

To perform GWAS for papulosquamous disorders, run: gwaspd.sh, gwasmpd.sh, gwasfpd.sh

To perform GWAS for dermatitis, run: gwasde.sh, gwasfde.sh, gwasmde.sh

STEP3: To visualise data using Manhattan plots and QQ plots execute: manhattan and QQ plots.R

STEP 4: Gene-Based Test Using GCTA Software

Before running the gene-based test, format the input files as required, run fastBAT.sh. 

Then, execute: de.sh, pd.sh

STEP 5: Heritability and LD Intercept

Install LDSC: Follow the installation instructions provided on the LDSC GitHub repository.

Format the summary statistics using 'munge_sumstats.py' from the LDSC package, then run: LD.sh

STEP 6: Local Genetic correlations 

Insall SUPERGNOVA: Follow the installation instructions provided on the SUPERGNOVA GitHub repository.

Use the summary statistics formatted by munge_sumstats.py, and then execute the script: correlation.py

STEP 7: Polygenic Risk Scores

Install GenoPred: Follow the installation instructions provided on the GenoPred GitHub repository.

Download GWAS Summary Statistics: Obtain the GWAS summary statistics for dermatitis (R10_L12_DERMATITISECZEMA) and psoriasis (R10_L12_PSORIASIS) from the FinnGen database.

Split the target data: Execute splitdata.sh

Prepare Genotype Data: Use PLINK2 to process individual-level genotype data for the target samples with the scripts: debgen.sh and pdbgen.sh.

Prepare Configuration Files: Create the following files: config.yaml, gwas_list.txt, target_list.txt

Run GenoPred Pipeline: Once the configuration is set up, execute the pipeline using the target_pgs method. Execute the command.sh script. This method calculates polygenic scores across all target datasets with a single command. 

Predict Disease State: After obtaining the Polygenic Risk Scores (PRS), use the regression.R script to perform logistic regression and predict the disease state.







