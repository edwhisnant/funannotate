#!/usr/bin/bash

#SBATCH --mem-per-cpu=16G  # adjust as needed
#SBATCH -c 12 # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-interpro.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-interpro.err
#SBATCH --partition=common

################################################################################################
# This script is for curating the intermediate annotations from funannotate predict
# The intermediate annotations consist of the following:
# 1. InterProScan5 XML file
# 2. SignalP pre-computed results (-org euk -format short)
# 3. antiSMASH secondary metabolism results (GBK file from output)
# 4. DeepLoc pre-computed results
# 5. EffectorP pre-computed results
################################################################################################
# Note: These processes will not be able to run at the same time, but must be done in tandem.
# This is because there will be issues removing temporary files if they are run in parallel.
################################################################################################

# SET VARIABLES
PREDICT_DIR=/hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/test-w-repeatsuite
INTERMEDIATE_FILES=${PREDICT_DIR}/intermediate_annotations

################################################################################################
############                   STEP 2: INTERMEDIATE ANNOTATIONS                     ############
################################################################################################

################################################################################################
############                           InterProScan5                                ############
################################################################################################

echo "Starting InterProScan5"

# CALLING CONDA ENVIRONMENT
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate_hydra #This is Ian's custom environment for funannotate

# INITIALIZE DIRECTORIES

if [ ! -d ${PREDICT_DIR}/interproscan_temp ]; then
    mkdir -p ${PREDICT_DIR}/interproscan_temp
else
    echo "The temporary directory already exists"
    echo "Please remove the temporary directory and try again"
    echo ${PREDICT_DIR}/interproscan_temp
    exit 1
fi

if [ ! -d ${INTERMEDIATE_FILES}/interproscan_results ]; then
    mkdir -p ${INTERMEDIATE_FILES}/interproscan_results
else
    echo "The temporary directory already exists"
    echo "Please remove the results directory and try again"
    echo ${INTERMEDIATE_FILES}/interproscan_results
    exit 1
fi

echo "Running InterProScan"
echo `date`

interproscan.sh \
    -i ${PREDICT_DIR}/predict_results/Cladonia_grayi.proteins.fa --seqtype p \
    --disable-precalc \
    --iprlookup --goterms --pathways \
    --output-file-base ${INTERMEDIATE_FILES}/interproscan_results \
    --tempdir ${PREDICT_DIR}/interproscan_temp \
    --verbose \
    -cpu 12

# REMOVE THE TEMPORARY DIRECTORY
# rm -r ${PREDICT_DIR}/interproscan_temp
conda deactivate

################################################################################################
############                              SIGNALP                                   ############
################################################################################################



################################################################################################
############                             ANTISMASH                                  ############
################################################################################################

# echo `date`
# echo "Starting antiSMASH"

# # CALLING CONDA ENVIRONMENT
# source $(conda info --base)/etc/profile.d/conda.sh
# conda activate antismash

# # RUN ANTISMASH
# antismash \
#     -t fungi \
#     --output-dir ${INTERMEDIATE_FILES}/antismash \
#     -c 12 \
#     --genefinding-tool none \
#     ${PREDICT_DIR}/predict_results/Cladonia_grayi.gbk

# conda deactivate

################################################################################################
############                              DEEPLOC                                   ############
################################################################################################

# source $(conda info --base)/etc/profile.d/conda.sh
# conda activate deeploc20

# deeploc2 \
#     -f ${PREDICT_DIR}/predict_results/Cladonia_grayi.proteins.fa \
#     -o ${INTERMEDIATE_FILES}/deeploc_out

# conda deactivate

# echo `date`
################################################################################################
############                             EFFECTORP                                  ############
################################################################################################

# EFFECTORP MUST BE RUN AFTER SIGNALP, AS SIGNALP CREATES THE INPUT FILE FOR EFFECTORP
# EffectorP is currently untested (as of 3.19.2025)
# echo 'EffectorP starting' `date`
# source $(conda info --base)/etc/profile.d/conda.sh
# conda activate funannotate_hydra

# cd /hpc/group/bio1/ewhisnant/software/EffectorP_3.0.0-beta

# python EffectorP.py \
# -i ${INTERMEDIATE_FILES}/signalp/processed_entries.fasta \
# -o ${INTERMEDIATE_FILES}/effectorp/effectors.txt

# conda deactivate

################################################################################################
############                 MOVE ON TO FINALIZE THE ANNOTATION                     ############
################################################################################################


