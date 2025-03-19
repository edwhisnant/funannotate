#!/usr/bin/bash

#SBATCH --mem-per-cpu=16G  # adjust as needed
#SBATCH -c 12 # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-repeatmasker.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-repeatmasker.err
#SBATCH --partition=common

# SET VARIABLES
# Inputs/outputs for cleaning and masking steps
ASSEMBLY=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/assemblies/Clagr3_AssemblyScaffolds.fasta
CLEANED_ASSEMBLY=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/cleaned-assemblies/Clagr3_AssemblyScaffolds_cleaned_RMtest.fasta
MASKED_DIR=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/masked-assemblies/repeat-masker-02

#Computing resources
CPUS=12

# Use the masked assembly as the input for the prediction step
# For the prediction step:
PREDICT_DIR=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/test-w-repeatsuite
SPECIES="Cladonia grayi"  # Ensure that the species is set in the predict step
TRANSCRIPT_EVIDENCE_01=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/assemblies/Clagr3_ESTs_20111121_454_ESTs.fasta
TRANSCRIPT_EVIDENCE_02=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/assemblies/Clagr3_ESTs_20111209_Velvet_and_Trinity_contigs.fasta
TRANSCRIPT_EVIDENCE_03=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/assemblies/Clagr3_ESTs_20111209_Newbler_contigs.fasta
BUSCO_DB=pezizomycotina

################################################################################################
############                  STEP 1: CLEAN | MASK | PREDICT                        ############
################################################################################################

echo "Starting funannotate pipeline"

################################################################################################
############                          CLEANING GENOME                               ############
################################################################################################

# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate_hydra #This is Ian's custom environment for funannotate

# CLEANING THE GENOME

 echo "Cleaning the fasta file"
 funannotate clean \
     -i ${ASSEMBLY} \
     -o ${CLEANED_ASSEMBLY} 
    
 echo "Genome cleaned"

 conda deactivate

################################################################################################
############                           MASKING GENOME                               ############
################################################################################################

# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
# Activate the RepeatSuite environment which contains tools for repeat masking such as RepeatMasker and RepeatModeler
conda activate RepeatSuite

echo "Starting RepeatMasker pipeline"

echo "Soft-masking the genome"

################################################################################################
#####          HERE YOU NEED TO SPECIFY IF YOU WANT TO RUN REPEAT MODELING OR NOT          #####
#####       If you want to run repeat modeling, uncomment the RepeatModeler command        #####
################################################################################################

# If you want to run RepeatModeler, uncomment the following lines
# Note that this will take a long time to run (nearly a whole day per genome)

################################################################################################
# Build the repeat database
# BuildDatabase -name Clagr3_repeatdb_2 -engine ncbi ${CLEANED_ASSEMBLY}

# Run RepeatModeler; ab initio repeat identification
    # "-pa 11" specifies the number of processors to use, which is the total number of SLURM CPUs minus 1.
    # "-pa 11" is the number of processors this number is function of total computing power from SLURM minus 1.
    # This is because the script will run on 1 processor, and the modeler will run on the rest.
# RepeatModeler -engine ncbi -database Clagr3_repeatdb_2 ${CLEANED_ASSEMBLY} -pa 11 

# if [ ! -d /hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/masked-assemblies/repeat-masker ]; then
#     mkdir /hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/masked-assemblies/repeat-masker
# else
#     echo "Directory repeat-masker already exists"
#     echo "Ensure you have specified a unique output directory for masked data"
#     exit 1
# fi
################################################################################################

# USING THE BUILT IN FUNGI DATABASE FOR REPEPEAT MASKING
echo "USING BUILT-IN FUNGI DATABASE"
echo "BYPASSING REPEAT MODELING"
RepeatMasker \
    --species "Fungi" \
    ${CLEANED_ASSEMBLY} \
    --dir ${MASKED_DIR} \
    -pa 11

# CHECK IF THE MASKED FILE EXISTS
if [ -f ${MASKED_DIR}/Clagr3_AssemblyScaffolds_cleaned_RMtest.fasta.masked ]; then
    mv ${MASKED_DIR}/Clagr3_AssemblyScaffolds_cleaned_RMtest.fasta.masked ${MASKED_DIR}/Clagr3_AssemblyScaffolds_cleaned_RMtest.masked.fasta
    echo "Genome soft-masked"
else
    echo "Error: Masked file not found!"
    exit 1
fi

conda deactivate

################################################################################################
############                         PREDICTING GENES                               ############
################################################################################################

source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate_hydra #This is Ian's custom environment for funannotate

# RENAME FILE TO CORRECT FORMAT AND REASSIGN VARIABLE
echo "Renaming masked file"

REPEATMASKED_ASSEMBLY=${MASKED_DIR}/Clagr3_AssemblyScaffolds_cleaned_RMtest.masked.fasta

# PREDICTING GENES FROM CLEANED AND MASKED ASSEMBLY
echo "Predicting genes from cleaned and masked assembly"

    # -i, -o, and -s are required arguments
    # Ensure that the output directory is unique and not the same as a previous run
funannotate predict \
    -i ${REPEATMASKED_ASSEMBLY} \
    -o ${PREDICT_DIR} \
    -s "Cladonia grayi" \
    --cpus ${CPUS} \
    --busco_db ${BUSCO_DB} \
    --optimize_augustus
    #--transcript_evidence ${TRANSCRIPT_EVIDENCE_01} \

# CHECK IF THE PREDICTION DIRECTORY EXISTS; EXIT IF IT DOES NOT
if [ ! -d ${PREDICT_DIR} ]; then
    echo "Error: Prediction directory not found!"
    exit 1
else
    echo "Prediction directory found"
    echo "Check the contents of the prediction directory":
    echo ${PREDICT_DIR}
fi
    
echo "Done with funannotate predict"

echo "This script was run: "`date` 

conda deactivate

################################################################################################
############             NEXT STEP IS STEP 2: INTERMEDIATE ANNOTATIONS              ############
################################################################################################
