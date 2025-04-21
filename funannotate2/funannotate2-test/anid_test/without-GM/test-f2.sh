#!/usr/bin/bash

#SBATCH --mem-per-cpu=16G  # adjust as needed
#SBATCH -c 12 # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/armaleo-data/funannotate2/scripts/logs/f2_test.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/armaleo-data/funannotate2/scripts/logs/f2_test.err
#SBATCH --partition=common

################################################################################################
############                        TEST FUNANNOTATE2                            ############
################################################################################################

# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

cd /hpc/group/bio1/ewhisnant/armaleo-data/funannotate2

mkdir -p test-genome

cd test-genome

# Download a test genome

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/011/425/GCF_000011425.1_ASM1142v1/GCF_000011425.1_ASM1142v1_genomic.fna.gz

cd ..

echo "Testing funannotate2 on A. nidualans genome"
echo "$date"

funannotate2 train -f test-genome/GCF_000011425.1_ASM1142v1_genomic.fna.gz --cpus 12  -s "Aspergillus nidulans" --strain FGSCA4 -o anid_f2

funannotate2 predict -i anid_f2/ --cpus 12

funannotate2 annotate -i anid_f2/ --cpus 12

conda deactivate