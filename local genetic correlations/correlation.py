#######################################
# to calculate local genetic correlations
#######################################

cd /data/scratch/bt23718/GWAS_project/SUPERGNOVA 

module load python

# calulate local genetic correlations with papulosqamous disorders and dermatitis (all samples)

python3 supergnova.py data/sumstats/pd/pd.sumstats.gz data/sumstats/de/de.sumstats.gz \
--N1 460961 \
--N2 460961 \
--bfile data/bfiles/eur_chr@_SNPmaf5 \
--partition data/partition/eur_chr@.bed \
--out all.tx

# calulate local genetic correlations with papulosqamous disorders and dermatitis (male samples)

python3 supergnova.py data/sumstats/pd/mpd.sumstats.gz data/sumstats/de/mde.sumstats.gz \
--N1 210807 \
--N2 210807 \
--bfile data/bfiles/eur_chr@_SNPmaf5 \
--partition data/partition/eur_chr@.bed \
--out females.txt

# calulate local genetic correlations with papulosqamous disorders and dermatitis (female samples)

python3 supergnova.py data/sumstats/pd/fpd.sumstats.gz data/sumstats/de/fde.sumstats.gz \
--N1 250154 \
--N2 250154 \
--bfile data/bfiles/eur_chr@_SNPmaf5 \
--partition data/partition/eur_chr@.bed \
--out females.txt
