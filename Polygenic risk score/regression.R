install.packages("data.table")
install.packages("pROC")
install.packages("ggplot2")

library(data.table)
library(pROC)
library(ggplot2)

#############
# Psoriasis PRS prediction on psoriasis samples
#############

# Load phenotype and covariate data
pheno_train_pd <- read.table("trial_set.txt", header = TRUE, stringsAsFactors = FALSE)
pheno_test_pd <- read.table("validation_set.txt", header = TRUE, stringsAsFactors = FALSE)
sex <- read.table("gsex.txt", header = TRUE, stringsAsFactors = FALSE)
age <- read.table("agerectuit.txt", header = TRUE, stringsAsFactors = FALSE)

# Merge data
train_data_pd <- merge(pheno_train_pd, sex, by = c("FID", "IID"), all = TRUE)
train_data_pd <- merge(train_data_pd, age, by = c("FID", "IID"), all = TRUE)
train_data_pd <- na.omit(train_data_pd)

test_data_pd <- merge(pheno_test_pd, sex, by = c("FID", "IID"), all = TRUE)
test_data_pd <- merge(test_data_pd, age, by = c("FID", "IID"), all = TRUE)
test_data_pd <- na.omit(test_data_pd)

# Load Polygenic Risk Scores
prstrial_pd <- read.table("/data/scratch/bt23718/GWAS_project/GenoPred/pipeline/output_files/psoriasis/test/Test_psoriasis/pgs/EUR/dbslmm/ALLDE/Test_psoriasis-ALLDE-EUR.profiles", header = TRUE, stringsAsFactors = FALSE)
prstest_pd <- read.table("/data/scratch/bt23718/GWAS_project/GenoPred/pipeline/output_files/psoriasis/val/Val_psoriasis/pgs/EUR/dbslmm/ALLDE/Val_psoriasis-ALLDE-EUR.profiles", header = TRUE, stringsAsFactors = FALSE)

# Merge PRS scores with training and test data
train_data_pd <- merge(train_data_pd, prstrial_pd, by = c("FID", "IID"), all = TRUE)
train_data_pd <- na.omit(train_data_pd)
test_data_pd <- merge(test_data_pd, prstest_pd, by = c("FID", "IID"), all = TRUE)
test_data_pd <- na.omit(test_data_pd)

# Convert categorical variables to factors
train_data_pd$gsex <- as.factor(train_data_pd$gsex)
train_data_pd$phe <- as.factor(train_data_pd$phe)
test_data_pd$gsex <- as.factor(test_data_pd$gsex)
test_data_pd$phe <- as.factor(test_data_pd$phe)

# Fit the logistic regression model
model_pd <- glm(phe ~ ALLDE_DBSLMM_1 + agerectuit + gsex + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                 data = train_data_pd, family = binomial)

# Make predictions on the test data
predictions_pd <- predict(model_pd, newdata = test_data_pd, type = "response")

# Calculate and display results
coefficients_pd <- summary(model_pd)$coefficients
odds_ratios_pd <- exp(coefficients_pd[, "Estimate"])
p_values_pd <- coefficients_pd[, "Pr(>|z|)"]
results_table_pd <- data.frame(Variable = rownames(coefficients_pd), Odds_Ratio = odds_ratios_pd, P_Value = p_values_pd)

roc_curve_pd <- roc(test_data_pd$phe, predictions_pd)
auc_value_pd <- auc(roc_curve_pd)

# Plot ROC curve
roc_plot_pd <- ggplot(data = data.frame(fpr = roc_curve_pd$specificities, tpr = roc_curve_pd$sensitivities), aes(x = 1 - fpr, y = tpr)) +
  geom_line(color = "blue", linewidth = 1) +  # Using linewidth instead of size
  geom_abline(linetype = "dashed", color = "red") +
  labs(title = paste("ROC Curve (AUC =", round(auc_value_pd, 2), ")"),
       x = "False Positive Rate (1 - Specificity)",
       y = "True Positive Rate (Sensitivity)") +
  theme_bw()

# Save ROC curve plot
ggsave("roc_curve_plot_pd.png", plot = roc_plot_pd, width = 8, height = 6, dpi = 300)

# Save results table
write.table(results_table_pd, file = "results_table_pd.txt", sep = "\t", row.names = FALSE, quote = FALSE)

#############
# Atopic dermatitis PRS prediction on dermatitis samples
#############

# Load phenotype and covariate data
pheno_train_ad <- read.table("/data/scratch/bt23718/GWAS_project/dermatitis_eczema/trial_set.txt", header = TRUE, stringsAsFactors = FALSE)
pheno_test_ad <- read.table("/data/scratch/bt23718/GWAS_project/dermatitis_eczema/validation_set.txt", header = TRUE, stringsAsFactors = FALSE)

# Merge data for training and test datasets
train_data_ad <- merge(pheno_train_ad, sex, by = c("FID", "IID"), all = TRUE)
train_data_ad <- merge(train_data_ad, age, by = c("FID", "IID"), all = TRUE)
train_data_ad <- na.omit(train_data_ad)

test_data_ad <- merge(pheno_test_ad, sex, by = c("FID", "IID"), all = TRUE)
test_data_ad <- merge(test_data_ad, age, by = c("FID", "IID"), all = TRUE)
test_data_ad <- na.omit(test_data_ad)

# Load Polygenic Risk Scores (PRS)
prstrial_ad <- read.table("/data/scratch/bt23718/GWAS_project/GenoPred/pipeline/output_files/dermatitis/test/Test_dermatitis/pgs/EUR/dbslmm/ALLPD/Test_Dermatitis-ALLPD-EUR.profiles", header = TRUE, stringsAsFactors = FALSE)
prstest_ad <- read.table("/data/scratch/bt23718/GWAS_project/GenoPred/pipeline/output_files/dermatitis/val/Test_dermatitis/pgs/EUR/dbslmm/ALLPD/Test_Dermatitis-ALLPD-EUR.profiles", header = TRUE, stringsAsFactors = FALSE)

# Merge PRS scores with training and test data
train_data_ad <- merge(train_data_ad, prstrial_ad, by = c("FID", "IID"), all = TRUE)
train_data_ad <- na.omit(train_data_ad)
test_data_ad <- merge(test_data_ad, prstest_ad, by = c("FID", "IID"), all = TRUE)
test_data_ad <- na.omit(test_data_ad)

# Convert categorical variables to factors
train_data_ad$gsex <- as.factor(train_data_ad$gsex)
train_data_ad$phe <- as.factor(train_data_ad$phe)
test_data_ad$gsex <- as.factor(test_data_ad$gsex)
test_data_ad$phe <- as.factor(test_data_ad$phe)

# Fit the logistic regression model
model_ad <- glm(phe ~ ALLPD_DBSLMM_1 + agerectuit + gsex + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                 data = train_data_ad, family = binomial)

# Make predictions on the test data
predictions_ad <- predict(model_ad, newdata = test_data_ad, type = "response")

# Calculate and display results
coefficients_ad <- summary(model_ad)$coefficients
odds_ratios_ad <- exp(coefficients_ad[, "Estimate"])
p_values_ad <- coefficients_ad[, "Pr(>|z|)"]
results_table_ad <- data.frame(Variable = rownames(coefficients_ad), Odds_Ratio = odds_ratios_ad, P_Value = p_values_ad)

roc_curve_ad <- roc(test_data_ad$phe, predictions_ad)
auc_value_ad <- auc(roc_curve_ad)

# Plot ROC curve
roc_plot_ad <- ggplot(data = data.frame(fpr = roc_curve_ad$specificities, tpr = roc_curve_ad$sensitivities), aes(x = 1 - fpr, y = tpr)) +
  geom_line(color = "blue", linewidth = 1) +  # Using linewidth instead of size
  geom_abline(linetype = "dashed", color = "red") +
  labs(title = paste("ROC Curve (AUC =", round(auc_value_ad, 2), ")"),
       x = "False Positive Rate (1 - Specificity)",
       y = "True Positive Rate (Sensitivity)") +
  theme_bw()

# Save ROC curve plot
ggsave("roc_curve_plot_ad.png", plot = roc_plot_ad, width = 8, height = 6, dpi = 300)

# Save results table
write.table(results_table_ad, file = "results_table_ad.txt", sep = "\t", row.names = FALSE, quote = FALSE)

##############
# Cross-trait analysis i.e., Psoriasis PRS and AD data
##############

# Load PRS and phenotype data for cross-trait analysis
# (Assuming `train_data_ctad` and `test_data_ctad` are already loaded)

# Merge PRS scores with training and test data
train_data_ctad <- merge(train_data_ad, prstrial_pd, by = c("FID", "IID"), all = TRUE)
train_data_ctad <- na.omit(train_data_ctad)
test_data_ctad <- merge(test_data_ad, prstest_pd, by = c("FID", "IID"), all = TRUE)
test_data_ctad <- na.omit(test_data_ctad)

# Convert categorical variables to factors
train_data_ctad$gsex <- as.factor(train_data_ctad$gsex)
train_data_ctad$phe <- as.factor(train_data_ctad$phe)
test_data_ctad$gsex <- as.factor(test_data_ctad$gsex)
test_data_ctad$phe <- as.factor(test_data_ctad$phe)

# Fit the logistic regression model
model_ctad <- glm(phe ~ ALLDE_DBSLMM_1 + agerectuit + gsex + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                   data = train_data_ctad, family = binomial)

# Make predictions on the test data
predictions_ctad <- predict(model_ctad, newdata = test_data_ctad, type = "response")

# Calculate and display results
coefficients_ctad <- summary(model_ctad)$coefficients
odds_ratios_ctad <- exp(coefficients_ctad[, "Estimate"])
p_values_ctad <- coefficients_ctad[, "Pr(>|z|)"]
results_table_ctad <- data.frame(Variable = rownames(coefficients_ctad), Odds_Ratio = odds_ratios_ctad, P_Value = p_values_ctad)

roc_curve_ctad <- roc(test_data_ctad$phe, predictions_ctad)
auc_value_ctad <- auc(roc_curve_ctad)

# Plot ROC curve
roc_plot_ctad <- ggplot(data = data.frame(fpr = roc_curve_ctad$specificities, tpr = roc_curve_ctad$sensitivities), aes(x = 1 - fpr, y = tpr)) +
  geom_line(color = "blue", linewidth = 1) +  # Using linewidth instead of size
  geom_abline(linetype = "dashed", color = "red") +
  labs(title = paste("ROC Curve (AUC =", round(auc_value_ctad, 2), ")"),
       x = "False Positive Rate (1 - Specificity)",
       y = "True Positive Rate (Sensitivity)") +
  theme_bw()

# Save ROC curve plot
ggsave("roc_curve_plot_ctad.png", plot = roc_plot_ctad, width = 8, height = 6, dpi = 300)

# Save results table
write.table(results_table_ctad, file = "results_table_ctad.txt", sep = "\t", row.names = FALSE, quote = FALSE)

##############
# Cross-trait analysis i.e., Dermatitis PRS on psoriasis data
##############

# Load PRS and phenotype data for cross-trait analysis
# (Assuming `train_data_ctpd` and `test_data_ctpd` are already loaded)

# Merge PRS scores with training and test data
train_data_ctpd <- merge(train_data_pd, prstrial_ad, by = c("FID", "IID"), all = TRUE)
train_data_ctpd <- na.omit(train_data_ctpd)
test_data_ctpd <- merge(test_data_pd, prstest_ad, by = c("FID", "IID"), all = TRUE)
test_data_ctpd <- na.omit(test_data_ctpd)

# Convert categorical variables to factors
train_data_ctpd$gsex <- as.factor(train_data_ctpd$gsex)
train_data_ctpd$phe <- as.factor(train_data_ctpd$phe)
test_data_ctpd$gsex <- as.factor(test_data_ctpd$gsex)
test_data_ctpd$phe <- as.factor(test_data_ctpd$phe)

# Fit the logistic regression model
model_ctpd <- glm(phe ~ ALLPD_DBSLMM_1 + agerectuit + gsex + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                   data = train_data_ctpd, family = binomial)

# Make predictions on the test data
predictions_ctpd <- predict(model_ctpd, newdata = test_data_ctpd, type = "response")

# Calculate and display results
coefficients_ctpd <- summary(model_ctpd)$coefficients
odds_ratios_ctpd <- exp(coefficients_ctpd[, "Estimate"])
p_values_ctpd <- coefficients_ctpd[, "Pr(>|z|)"]
results_table_ctpd <- data.frame(Variable = rownames(coefficients_ctpd), Odds_Ratio = odds_ratios_ctpd, P_Value = p_values_ctpd)

roc_curve_ctpd <- roc(test_data_ctpd$phe, predictions_ctpd)
auc_value_ctpd <- auc(roc_curve_ctpd)

# Plot ROC curve
roc_plot_ctpd <- ggplot(data = data.frame(fpr = roc_curve_ctpd$specificities, tpr = roc_curve_ctpd$sensitivities), aes(x = 1 - fpr, y = tpr)) +
  geom_line(color = "blue", linewidth = 1) +  # Using linewidth instead of size
  geom_abline(linetype = "dashed", color = "red") +
  labs(title = paste("ROC Curve (AUC =", round(auc_value_ctpd, 2), ")"),
       x = "False Positive Rate (1 - Specificity)",
       y = "True Positive Rate (Sensitivity)") +
  theme_bw()

# Save ROC curve plot
ggsave("roc_curve_plot_ctpd.png", plot = roc_plot_ctpd, width = 8, height = 6, dpi = 300)

# Save results table
write.table(results_table_ctpd, file = "results_table_ctpd.txt", sep = "\t", row.names = FALSE, quote = FALSE)
