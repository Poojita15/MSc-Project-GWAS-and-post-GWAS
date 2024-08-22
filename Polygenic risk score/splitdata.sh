###############################
#Splitting the data into training and testing sets for polygenic risk score prediction
################################

####################
#Split dermatitis data 
#####################

# Define the input file
input_file="/data/scratch/bt3718/GWAS_project/dermatitis_eczema/der_ecz_phe.txt"

# Define the number of lines in the input file (excluding the header)
num_lines=$(($(wc -l < "$input_file") - 1))

# Define the split ratio (e.g., 70% for trial set, 30% for validation set)
split_ratio=0.7
num_trial=$(printf "%.0f" $(echo "$num_lines * $split_ratio" | bc))
num_validation=$(($num_lines - $num_trial))

# Shuffle the data (excluding the header)
header=$(head -n 1 "$input_file")
shuf "$input_file" | sed '1d' > shuffled_data.csv

# Split the shuffled data into trial and validation sets
(head -n "$num_trial"; tail -n +$(($num_trial + 1))) < shuffled_data.csv > trial_set.csv
tail -n "$num_validation" shuffled_data.csv > validation_set.csv

# Add the header back to both files
{ echo "$header"; cat trial_set.csv; } > tmp && mv tmp trial_set.csv
{ echo "$header"; cat validation_set.csv; } > tmp && mv tmp validation_set.csv

# Clean up
rm shuffled_data.csv

###################
#split psoriasis data 
###################


# Define the input file
input_file="/data/scratch/bt3718/GWAS_project/papulosquamous_disorders/pap_dis.txt"

# Define the number of lines in the input file (excluding the header)
num_lines=$(($(wc -l < "$input_file") - 1))

# Define the split ratio (e.g., 70% for trial set, 30% for validation set)
split_ratio=0.7
num_trial=$(printf "%.0f" $(echo "$num_lines * $split_ratio" | bc))
num_validation=$(($num_lines - $num_trial))

# Shuffle the data (excluding the header)
header=$(head -n 1 "$input_file")
shuf "$input_file" | sed '1d' > shuffled_data.csv

# Split the shuffled data into trial and validation sets
(head -n "$num_trial"; tail -n +$(($num_trial + 1))) < shuffled_data.csv > trial_set.csv
tail -n "$num_validation" shuffled_data.csv > validation_set.csv

# Add the header back to both files
{ echo "$header"; cat trial_set.csv; } > tmp && mv tmp trial_set.csv
{ echo "$header"; cat validation_set.csv; } > tmp && mv tmp validation_set.csv

# Clean up
rm shuffled_data.csv
