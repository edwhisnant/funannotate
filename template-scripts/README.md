# Running funannotate scripts:

## 01_clean_mask_predict_template.sh

Runs genomes through several steps, including:

* `funannotate sort`: Sorts contigs by size and renames fasta headers

* `funannotate clean`: Removes duplicated contigs or scaffolds using minimap2

* `RepeatMasker`: Runs the cleaned genomes through RepeatMasker to mask repetitive genomic sequences

* `funannotate predict`: Runs the genomes through the gene prediction pipeline funannotate.

## 02_intermediate_annotations_template.sh


## 03_final_annotation_template.sh


