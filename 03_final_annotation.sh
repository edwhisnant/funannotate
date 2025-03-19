#!/usr/bin/bash

#SBATCH --mem-per-cpu=16G  # adjust as needed
#SBATCH -c 12 # Number of threads per process
#SBATCH --output=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-repeatmasker.out
#SBATCH --error=/hpc/group/bio1/ewhisnant/armaleo-data/logs/funannotate-logs/trial-hydra-04/trial-hydra-repeatmasker.err
#SBATCH --partition=common

# This script is for compiling and finalizing the annotatiosn from the intermediate annotations
    # The intermediate annotations produce the following:
    # 1. InterProScan5 XML file
    # 2. SignalP pre-computed results (a .txt file)
    # 3. antiSMASH secondary metabolism results (GBK file from output)
    # 4. DeepLoc pre-computed results (a .csv file)
    # 5. EffectorP pre-computed results (a .txt file)

# NOTE: This is untested as of (3.19.25) and is incomplete
funannotate annotate \
    -i initial_annotation \
    --species $species \
    --isolate $genome \
    --name $locus_tag \
    --antismash ./initial_annotation/annotate_misc/antismash_results/antismash_results.gbk \
    --iprscan ./initial_annotation/interproscan_results/${genome}.xml \
    --signalp ./initial_annotation/annotate_misc/signalp/prediction_results.txt \
    --deeploc ./initial_annotation/deeploc_out/results.csv \
    --effectorp ./initial_annotation/annotate_misc/effectors.txt \
    --busco_db ascomycota \
    --renumber_antismash \
    --no-progress \
    --cpus 12

conda deactivate
