#!/usr/bin/bash

#SBATCH --mem-per-cpu=32G   # Memory per CPU
#SBATCH -c 12               # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/comp-genomics/funannotate2-logs/lecanoromycetes/lecanoromyctes_%A_%a.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/comp-genomics/funannotate2-logs/lecanoromycetes/lecanoromycetes_%A_%a.err
#SBATCH --partition=common
#SBATCH --array=1-107%11 # Array range (change after quality control step)

################################################################################################
#############                   RUNNING FUNANNOTATE2 PIPELINE                       ############
################################################################################################

COMP_GENOMICS=/hpc/group/bio1/ewhisnant/comp-genomics  # Base directory for outputs for comp-genomics
GENOMES=${COMP_GENOMICS}/filtered-genomes/lecanoromycetes # Directory containing genome files
GENOME_FILES=($(ls ${GENOMES}/*.fa)) #List of genome files to process
GFILE=${GENOME_FILES[$SLURM_ARRAY_TASK_ID]} # Create the index for the array job
BASENAME=$(basename "${GFILE}" .fa) # Extract the base name of the genome file
MASKED_DIR=${COMP_GENOMICS}/masked-genomes/lecanoromycetes/${BASENAME} # Directory for masked genomes

OUTPUT=/hpc/group/bio1/ewhisnant/comp-genomics/funannotate2-out/lecanoromycetes

# Create directories for sorted, masked, and predicted genomes
mkdir -p ${MASKED_DIR}

# Remove the previous cleaned genome if it exists
CLEANED_ASSEMBLY=${COMP_GENOMICS}/cleaned-genomes/${BASENAME}_cleaned.fasta
echo "Removing the previous cleaned genome if it exists"
rm $CLEANED_ASSEMBLY

# Remove the previous masked genome if it exists
REPEATMASKED_ASSEMBLY=${MASKED_DIR}/${BASENAME}_sorted.cleaned.masked.fasta
echo "Removing the previous masked genome if it exists"
rm $REPEATMASKED_ASSEMBLY

# Remove the previous output of ${BASENAME} if it exists
echo "Removing the previous output of ${BASENAME} if it exists"
rm -r ${OUTPUT}/${BASENAME} # Remove the previous output of ${BASENAME} if it exists


###############################################################################################

echo "Processing genome: ${BASENAME}"

cd ${COMP_GENOMICS}
date 

################################################################################################
############                          CLEANING GENOME                               ############
################################################################################################
# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

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
date

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
    -s ${BASENAME} \
    -o ${OUTPUT}/${BASENAME}

################################################################################################
############                        RUN GENE PREDICTION                             ############
################################################################################################
echo "Predicting genes from ${BASENAME} genome"
date

funannotate2 predict -i ${OUTPUT}/${BASENAME} --cpus 12

################################################################################################
############                        RUN GENE ANNOTATION                             ############
################################################################################################
echo "Annotating genes from ${BASENAME} genome"
date

funannotate2 annotate -i ${OUTPUT}/${BASENAME} --cpus 12

conda deactivate

################################################################################################
############             ENSURE FILES ARE RENAMED TO PROPER FORMAT                  ############
################################################################################################
echo "Renaming files in ${OUTPUT}/${BASENAME}/annotate_results"
date
TARGET_DIR=${OUTPUT}/${BASENAME}/annotate_results # Directory containing the files to rename

# Change to the target directory
cd "${TARGET_DIR}"

# Define the extensions to match
EXTENSIONS=("fasta" "gbk" "gff3" "proteins.fa" "summary.json" "tbl" "transcripts.fa")

# Loop through all files with the specified extensions
for ext in "${EXTENSIONS[@]}"; do
    for file in *."${ext}"; do
        # Check if the file exists
        if [ -e "$file" ]; then
            # Rename the file
            mv "$file" "${BASENAME}.${ext}"
            
            # Check if the rename was successful
            if [ $? -eq 0 ]; then
                echo "Renamed $file to ${BASENAME}.${ext}"
            else
                echo "Error in renaming $file. Skipping."
            fi
        fi
    done
done