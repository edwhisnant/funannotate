# How to install Funannotate2

## Create the funannotate2 conda env

* `mamba` is needed to install funannotate2 dependencies

Run in order:
```{}
mamba create -n funannotate2 gfftk gapmm2 minimap2 miniprot snap "augustus==3.5.0" glimmerhmm diamond trnascan-se buscolite
conda activate funannotate2
python -m pip install git+https://github.com/nextgenusfs/funannotate2.git

```

Test the installation:

```{}
funannotate2 -h
usage: funannotate2 [-h] [--version] {install,clean,train,predict,annotate,species} ...

Funannotate: eukaryotic genome annotation pipeline

Commands:
  install     Install funannotate2 database files.
  clean       Find and remove duplicated contigs, sort by size, rename headers.
  train       Train ab intio gene prediction algorithms.
  predict     Predict primary gene models in a eukaryotic genome.
  annotate    Add functional annotation to gene models.
  species     View and manage species in F2 database.

Help:
  -h, --help  Show this help message and exit
  --version   show program's version number and exit

```

## Install databases:

Run this first:

```{}
export FUNANNOTATE2_DB=/hpc/group/bio1/ewhisnant/databases/funannotate2_db
```

Then run:

```{}
funannotate2 install -d all
```

Set the database as a variable in the conda env

```{}
# Ensure the env is active
conda activate funannotate2

# Run:
conda env config vars set FUNANNOTATE2_DB=/hpc/group/bio1/ewhisnant/databases/funannotate2_db

# Deactivate the env to ensure the variable is set
```

## If GeneMark is already downloaded. Simply add to PATH

To check PATH:

```{}
echo $PATH | tr ":" "\n"
```

To add to PATH:

```{}
export PATH=$PATH:/hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64
```

Then run:

```{}
source ~/.bashrc
```

Re-activate funannotate2

```{}
conda activate funannotate2
```

You will need to install for GeneMark to function properly

```{}
conda install -c bioconda perl-hash-merge
conda install -c bioconda perl-mce
```
## If you want to update funannotate2 to the latest version from Git:

```{}
python -m pip install git+https://github.com/nextgenusfs/funannotate2.git --upgrade --force --no-deps
```

## Installing RepeatModeler for *ab initio* repeat masking

* Rmodeler is great *in principle* but installation is a pain in the ass and requires manual installation of a dozen dependencies that are a nightmare to install or are no longer supported. Honestly, screw using this.
  
