#!/usr/bin/bash

#SBATCH --mem-per-cpu=32G   # Memory per CPU
#SBATCH -c 12               # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/comp-genomics/predictions/logs/clean_mask_pred_28256708_36.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/comp-genomics/predictions/logs/clean_mask_pred_28256708_36.err
#SBATCH --partition=common

################################################################################################
#############                   RUNNING FUNANNOTATE2 PIPELINE                       ############
################################################################################################

COMP_GENOMICS=/hpc/group/bio1/ewhisnant/comp-genomics                  # Base directory for outputs for comp-genomics
GENOMES=${COMP_GENOMICS}/filtered-genomes/lecanoromycetes              # Directory containing genome files
GFILE=${GENOMES}/incertae_sedis_incertae_sedis_NCBI_GCA_964254515.1.fa                                                     # Create the index for the array job
BASENAME=$(basename "${GFILE}" .fa)                                    # Extract the base name of the genome file
MASKED_DIR=${COMP_GENOMICS}/masked-genomes/lecanoromycetes/${BASENAME} # Directory for masked genomes

OUTPUT=/hpc/group/bio1/ewhisnant/comp-genomics/funannotate2-out/lecanoromycetes

# Create directories for sorted, masked, and predicted genomes
mkdir -p ${MASKED_DIR}
mkdir -p ${SORTED_DIR}

SORTED_ASSEMBLY=${SORTED_DIR}/${BASENAME}_sorted.fasta
CLEANED_ASSEMBLY=${COMP_GENOMICS}/cleaned-genomes/${BASENAME}_cleaned.fasta
REPEATMASKED_ASSEMBLY=${MASKED_DIR}/${BASENAME}_sorted.cleaned.masked.fasta

echo "Processing genome: ${BASENAME}"
echo "Removing the previous output of ${BASENAME} if it exists"
rm -r /hpc/group/bio1/ewhisnant/comp-genomics/funannotate2-out/lecanoromycetes/incertae_sedis_incertae_sedis_NCBI_GCA_964254515.1
date 

#########################################################################################################
# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2
   
################################################################################################
############                          CLEANING GENOME                               ############
################################################################################################

echo "Cleaning ${BASENAME} genome file"
date

cd ${GENOMES}

funannotate2 clean \
    -f ${GFILE} \
    -o ${CLEANED_ASSEMBLY}
echo "Genome cleaned"

conda deactivate

################################################################################################
############                           MASKING GENOME                               ############
################################################################################################
source $(conda info --base)/etc/profile.d/conda.sh
conda activate RepeatSuite
echo "Starting RepeatMasker pipeline"

RepeatMasker \
    --species "Fungi" \
    ${CLEANED_ASSEMBLY} \
    --dir ${MASKED_DIR} \
    -pa 11

# CHECK IF THE MASKED FILE EXISTS, THEN RENAME IT 
if [ -f ${MASKED_DIR}/${BASENAME}_cleaned.fasta.masked ]; then
    mv ${MASKED_DIR}/${BASENAME}_cleaned.fasta.masked ${REPEATMASKED_ASSEMBLY}
    echo "Genome soft-masked"
else
    echo "Error: Masked file not found for ${BASENAME}!"
    exit 1
fi

conda deactivate

################################################################################################
############                TRAINING AB INITIO GENE PREDICTIONS                     ############
################################################################################################
# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

# Using a pre-masked genome from RepeatMasker
echo "Training on ${BASENAME} genome"
date

funannotate2 train \
    -f ${REPEATMASKED_ASSEMBLY} \
    --cpus 12  \
    -s Lecanoromycetes \
    -o ${OUTPUT}/${BASENAME}

################################################################################################
############                        RUN GENE PREDICTION                             ############
################################################################################################
echo "Predicting genes from ${BASENAME} genome"
date

funannotate2 predict -i ${OUTPUT}/${BASENAME}/ --cpus 12

################################################################################################
############                        RUN GENE ANNOTATION                             ############
################################################################################################
echo "Annotating genes from ${BASENAME} genome"
date

funannotate2 annotate -i ${OUTPUT}/${BASENAME}/ --cpus 12

conda deactivate