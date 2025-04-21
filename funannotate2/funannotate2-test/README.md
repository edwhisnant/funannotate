# A test of Funannotate2

I have run funannotate2 as suggested previously. I have run 4 different tests: 1) the `A. nidulans` genome without and 2) with GeneMark AND the same programs on a `Cladonia grayi` genome I downloaded from JGI, 3) witout GeneMark and 4) with GeneMark.

# Aspergillus nidulans

Script:

```{}
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

cd /hpc/group/bio1/ewhisnant/armaleo-data/funannotate2

mkdir -p test-genome

cd test-genome

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/011/425/GCF_000011425.1_ASM1142v1/GCF_000011425.1_ASM1142v1_genomic.fna.gz

cd ..

echo "Testing funannotate2 on A. nidualans genome"
echo "$date"

funannotate2 train -f test-genome/GCF_000011425.1_ASM1142v1_genomic.fna.gz --cpus 12  -s "Aspergillus nidulans" --strain FGSCA4 -o anid_f2

funannotate2 predict -i anid_f2/ --cpus 12

funannotate2 annotate -i anid_f2/ --cpus 12

conda deactivate
```

## 1. A. nidulans without GeneMark:

* See output: [link](funannotate2/funannotate2-test/clagr3-test/f2_clagr3_test.err)

## 2) A. nidulans with GeneMark


# Cladonia grayi 

Script:

```{}
source $(conda info --base)/etc/profile.d/conda.sh
conda activate funannotate2

funannotate2 train \
    -f /hpc/group/bio1/ewhisnant/armaleo-data/Clagr3/funannotations/masked-assemblies/repeat-masker/Clagr3_AssemblyScaffolds_cleaned_RMtest.masked.fasta \
    --cpus 12  \
    -s "Cladonia grayi" \
    -o clagr3_f2

funannotate2 predict -i clagr3_f2/ --cpus 12

funannotate2 annotate -i clagr3_f2/ --cpus 12

conda deactivate

```
## 3. C. grayi without GeneMark


## 4. C grayi w/ GeneMark

An issue arose with GeneMark:

```{}

[92m[Apr 21 02:37 PM] [0m[38;20mTraining GeneMark-ES using self-training[0m
[92m[Apr 21 02:37 PM] [0m[31;20mCMD ERROR: gmes_petap.pl --ES --cores 12 --work_dir genemark --training --fungus --sequence genome.fasta[0m
[92m[Apr 21 02:37 PM] [0m[31;20mCan't locate Hash/Merge.pm in @INC (you may need to install the Hash::Merge module) (@INC contains: /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/5.32/site_perl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/site_perl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/5.32/vendor_perl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/vendor_perl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/5.32/core_perl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/perl5/core_perl .) at /hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64/gmes_petap.pl line 88.
BEGIN failed--compilation aborted at /hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64/gmes_petap.pl line 88.
[0m
WARNING: unable to find params file in clagr3_f2/train_results
['Clagr3_AssemblyScaffolds_cleaned_RMtest.masked.fasta']Traceback (most recent call last):
  File "/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/bin/funannotate2", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/python3.12/site-packages/funannotate2/__main__.py", line 26, in main
    predict(args)
  File "/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate2/lib/python3.12/site-packages/funannotate2/predict.py", line 81, in predict
    args.species = params.get("species")
                   ^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'get'

```

This error was solved by installing the missing perl modules:

```{}
conda install -c bioconda perl-hash-merge
conda install -c bioconda perl-mce
```
