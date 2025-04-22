#!/usr/bin/bash

#SBATCH --mem-per-cpu=16G  # adjust as needed
#SBATCH -c 12 # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/armaleo-data/funannotate2/scripts/logs/f2_clagr3_test.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/armaleo-data/funannotate2/scripts/logs/f2_clagr3_test.err
#SBATCH --partition=common

################################################################################################
############                        TEST FUNANNOTATE2                            ############
################################################################################################

# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

cd /hpc/group/bio1/ewhisnant/armaleo-data/funannotate2

mkdir -p clagr3-test

cd clagr3-test

echo "Testing funannotate2 on Cladonia grayi genome"
echo "$date"

# Using a pre-masked genome from RepeatMasker
funannotate2 train \
    -f /hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/masked-assemblies/repeat-masker/Clagr3_AssemblyScaffolds_cleaned_RMtest.masked.fasta \
    --cpus 12  \
    -s "Cladonia grayi" \
    -o clagr3_f2

funannotate2 predict -i clagr3_f2/ --cpus 12

funannotate2 annotate -i clagr3_f2/ --cpus 12

conda deactivate