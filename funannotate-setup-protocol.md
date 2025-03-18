# Funannotate User Guide

**Author:** Eric Whisnant
**Date**: 03/06/2025

## What is funannotate?

Funannotate is a pipeline designed to do complete genomic analysis, taking a genome assembly through cleaning, masking, gene prediction, to annotations. In principle, it is very good at glueing numerous programs together. The source code is designed to be modular, where different programs can be integrated directly into the pipeline.

# Installing Funannotate

Programs that run on Funannotate are computationally and memory intense. Therefore, they are typically run on computing clusters. In my case, I run on the Duke Computing Cluster.

[Funannotate Installation Guide](https://github.com/nextgenusfs/funannotate/blob/master/docs/conda.rst)

1. On the DCC, funannotate needs to be installed in a conda environment.

* If you need to install conda (miniconda), follow these instructions from the [Miniconda installation guide](https://www.anaconda.com/docs/getting-started/miniconda/install#quickstart-install-instructions).

2. Install funannotate

```{}

# IN BASH:

#add appropriate channels
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

#then create environment
conda create -n funannotate "python>=3.6,<3.9" funannotate

```

* In my case, I am using a version of funannotate that was designed for the Smithsonian Cluster 'hydra'. In my case, I call it `funannotate_hydra`.


3. Configure the funannotate (funannotate_hydra) environment by running:

```{}
# IN BASH:
conda env update -n funannotate_hydra --file funannotate_hydra.yaml

```

**The YAML file with the dependencies are BELOW**
**HERE IS THE CONTENTS OF THE YAML FILE FROM IAN MEDEIROS**

* *NOTE: I HAD TO REMOVE EVERYTING FROM `PIP:` to get the YAML TO INSTALL CORRECTLY.*

```{}
name: funannotate_hydra
channels:
  - conda-forge
  - bioconda
  - r
  - defaults
dependencies:
  - _libgcc_mutex=0.1=conda_forge
  - _openmp_mutex=4.5=2_gnu
  - _r-mutex=1.0.1=anacondar_1
  - alsa-lib=1.2.7.2=h166bdaf_0
  - aria2=1.23.0=0
  - atk-1.0=2.38.0=hd4edc92_1
  - attr=2.5.1=h166bdaf_1
  - augustus=3.5.0=pl5321h700735d_3
  - bamtools=2.5.1=hd03093a_10
  - barrnap=0.9=hdfd78af_4
  - bedtools=2.31.1=hf5e1c6e_1
  - binutils_impl_linux-64=2.40=ha885e6a_0
  - bioconductor-seqlogo=1.64.0=r42hdfd78af_0
  - biopython=1.79=py38h0a891b7_3
  - blas=1.1=openblas
  - blast=2.15.0=pl5321h6f7f691_1
  - blis=0.9.0=h4ab18f5_2
  - boost-cpp=1.78.0=h5adbc97_2
  - bowtie=1.3.1=py38he293eaa_3
  - bowtie2=2.4.5=py38hfbc8389_3
  - brotli-python=1.0.9=py38hfa26641_9
  - bwidget=1.9.14=ha770c72_1
  - bzip2=1.0.8=hd590300_5
  - c-ares=1.28.1=hd590300_0
  - ca-certificates=2024.8.30=hbcca054_0
  - cairo=1.16.0=ha61ee94_1014
  - cdbtools=0.99=hdcf5f25_10
  - certifi=2024.8.30=pyhd8ed1ab_0
  - charset-normalizer=3.3.2=pyhd8ed1ab_0
  - codingquarry=2.0=py38h2494328_8
  - curl=7.87.0=h5eee18b_0
  - cycler=0.12.1=pyhd8ed1ab_0
  - cyrus-sasl=2.1.27=h230043b_5
  - dbus=1.13.6=h5008d03_3
  - diamond=2.1.9=h43eeafb_0
  - distro=1.9.0=pyhd8ed1ab_0
  - docopt=0.6.2=py_1
  - easel=0.49=h031d066_0
  - eggnog-mapper=2.1.12=pyhdfd78af_0
  - entrez-direct=21.6=he881be0_0
  - et_xmlfile=1.1.0=pyhd8ed1ab_0
  - ete3=3.1.3=pyhd8ed1ab_0
  - evidencemodeler=1.1.1=hdfd78af_3
  - exonerate=2.4.0=hf34a1b8_7
  - expat=2.6.2=h59595ed_0
  - fasta3=36.3.8=hec16e2b_7
  - fftw=3.3.10=nompi_hc118613_108
  - font-ttf-dejavu-sans-mono=2.37=hab24e00_0
  - font-ttf-inconsolata=3.000=h77eed37_0
  - font-ttf-source-code-pro=2.038=h77eed37_0
  - font-ttf-ubuntu=0.83=h77eed37_2
  - fontconfig=2.14.2=h14ed4e7_0
  - fonts-conda-ecosystem=1=0
  - fonts-conda-forge=1=0
  - freetype=2.12.1=h267a509_2
  - fribidi=1.0.10=h36c2ea0_0
  - funannotate=1.8.15=pyhdfd78af_2
  - gawk=5.3.0=ha916aea_0
  - gcc_impl_linux-64=13.2.0=h9eb54c0_7
  - gdk-pixbuf=2.42.10=h5eee18b_0
  - gettext=0.22.5=h59595ed_2
  - gettext-tools=0.22.5=h59595ed_2
  - gfortran_impl_linux-64=13.2.0=h738fc78_7
  - giflib=5.2.2=hd590300_0
  - glib=2.78.1=hfc55251_0
  - glib-tools=2.78.1=hfc55251_0
  - glimmerhmm=3.0.4=pl5321hdbdd923_7
  - gmap=2024.03.15=pl5321h9d449c0_2
  - gmp=6.3.0=h59595ed_1
  - gnutls=3.7.8=hf3e180e_0
  - goatools=1.4.4=pyhd8ed1ab_0
  - graphite2=1.3.13=h59595ed_1003
  - graphviz=7.1.0=h2e5815a_0
  - gsl=2.7=he838d99_0
  - gst-plugins-base=1.20.3=h57caac4_2
  - gstreamer=1.20.3=hd4edc92_2
  - gstreamer-orc=0.4.38=hd590300_0
  - gtk2=2.24.33=h90689f9_2
  - gts=0.7.6=h977cf35_4
  - gxx_impl_linux-64=13.2.0=h2a599c4_7
  - harfbuzz=5.3.0=h418a68e_0
  - hdf5=1.10.5=nompi_h5b725eb_1114
  - hisat2=2.2.1=hdbdd923_6
  - hmmer=3.4=hdbdd923_1
  - htslib=1.17=h6bc39ce_1
  - icu=70.1=h27087fc_0
  - idna=3.7=pyhd8ed1ab_0
  - infernal=1.1.5=pl5321h031d066_1
  - iqtree=2.3.3=h21ec9f0_0
  - itsx=1.1.3=hdfd78af_1
  - jack=1.9.21=h2a1e645_0
  - joblib=1.4.2=pyhd8ed1ab_0
  - jpeg=9e=h0b41bf4_3
  - k8=0.2.5=hdcf5f25_4
  - kallisto=0.46.1=h4f7b962_0
  - kernel-headers_linux-64=2.6.32=he073ed8_17
  - keyutils=1.6.1=h166bdaf_0
  - kiwisolver=1.4.5=py38h7f3f72f_1
  - kmer-jellyfish=2.3.1=h4ac6f70_0
  - krb5=1.19.3=h3790be6_0
  - lame=3.100=h166bdaf_1003
  - lcms2=2.14=h6ed2654_0
  - ld_impl_linux-64=2.40=h55db66e_0
  - lerc=4.0.0=h27087fc_0
  - libasprintf=0.22.5=h661eb56_2
  - libasprintf-devel=0.22.5=h661eb56_2
  - libblas=3.9.0=22_linux64_openblas
  - libbrotlicommon=1.0.9=h166bdaf_9
  - libbrotlidec=1.0.9=h166bdaf_9
  - libbrotlienc=1.0.9=h166bdaf_9
  - libcap=2.66=ha37c62d_0
  - libcblas=3.9.0=22_linux64_openblas
  - libclang=14.0.6=default_h7634d5b_1
  - libclang13=14.0.6=default_h9986a30_1
  - libcups=2.3.3=h3e49a29_2
  - libcurl=7.87.0=h91b91d3_0
  - libdb=6.2.32=h9c3ff4c_0
  - libdeflate=1.14=h166bdaf_0
  - libedit=3.1.20191231=he28a2e2_2
  - libev=4.33=hd590300_2
  - libevent=2.1.10=h9b69904_4
  - libexpat=2.6.2=h59595ed_0
  - libffi=3.4.2=h7f98852_5
  - libflac=1.4.3=h59595ed_0
  - libgcc=7.2.0=h69d50b8_2
  - libgcc-devel_linux-64=13.2.0=hceb6213_107
  - libgcc-ng=13.2.0=h77fa898_7
  - libgcrypt=1.10.3=hd590300_0
  - libgd=2.3.3=h695aa2c_1
  - libgettextpo=0.22.5=h59595ed_2
  - libgettextpo-devel=0.22.5=h59595ed_2
  - libgfortran-ng=13.2.0=h69a702a_7
  - libgfortran5=13.2.0=hca663fb_7
  - libglib=2.78.1=hebfc3b9_0
  - libgomp=13.2.0=h77fa898_7
  - libgpg-error=1.49=h4f305b6_0
  - libiconv=1.17=hd590300_2
  - libidn11=1.34=h1cef754_0
  - libidn2=2.3.7=hd590300_0
  - liblapack=3.9.0=22_linux64_openblas
  - libllvm14=14.0.6=hcd5def8_4
  - libllvm15=15.0.7=hadd5161_1
  - libnghttp2=1.51.0=hdcd2b5c_0
  - libnsl=2.0.1=hd590300_0
  - libntlm=1.4=h7f98852_1002
  - libogg=1.3.4=h7f98852_1
  - libopenblas=0.3.27=pthreads_h413a1c8_0
  - libopus=1.3.1=h7f98852_1
  - libpng=1.6.43=h2797004_0
  - libpq=14.5=h72a31a5_3
  - librsvg=2.54.4=h7abd40a_0
  - libsanitizer=13.2.0=h6ddb7a1_7
  - libsndfile=1.1.0=hcb278e6_1
  - libsqlite=3.45.3=h2797004_0
  - libssh2=1.10.0=haa6b8db_3
  - libstdcxx-devel_linux-64=13.2.0=hceb6213_107
  - libstdcxx-ng=13.2.0=hc0a3c3a_7
  - libsystemd0=252=h2a991cd_0
  - libtasn1=4.19.0=h166bdaf_0
  - libtiff=4.4.0=h82bc61c_5
  - libtool=2.4.7=h27087fc_0
  - libudev1=253=h0b41bf4_0
  - libunistring=0.9.10=h7f98852_0
  - libuuid=2.38.1=h0b41bf4_0
  - libvorbis=1.3.7=h9c3ff4c_0
  - libwebp-base=1.4.0=hd590300_0
  - libxcb=1.13=h7f98852_1004
  - libxcrypt=4.4.36=hd590300_1
  - libxkbcommon=1.5.0=h79f4944_1
  - libxml2=2.10.3=hca2bb57_4
  - libxslt=1.1.37=h873f0b0_0
  - libzlib=1.2.13=hd590300_5
  - lighttpd=1.4.64=lua54h145e673_2
  - lp_solve=5.5.2.11=hd590300_0
  - lua=5.4.6=h9627803_0
  - lxml=4.9.2=py38h215a2d7_0
  - lz4-c=1.9.4=hcb278e6_0
  - mafft=7.526=h4ab18f5_0
  - make=4.3=hd18ef5c_1
  - markdown-it-py=3.0.0=pyhd8ed1ab_0
  - matplotlib-base=3.4.3=py38hf4fb855_1
  - mdurl=0.1.2=pyhd8ed1ab_0
  - metis=5.1.0=h59595ed_1007
  - minimap2=2.28=he4a0461_0
  - mmseqs2=15.6f452=pl5321h6a68c12_2
  - mpfr=4.2.1=h9458935_1
  - mpg123=1.31.3=hcb278e6_0
  - mpi=1.0=openmpi
  - mysql-common=8.0.32=h14678bc_0
  - mysql-connector-c=6.1.11=h6eb9d5d_1007
  - mysql-libs=8.0.32=h54cf53e_0
  - natsort=8.4.0=pyhd8ed1ab_0
  - ncbi-vdb=3.1.0=h4ac6f70_2
  - ncurses=6.4.20240210=h59595ed_0
  - nettle=3.8.1=hc379101_1
  - nspr=4.35=h27087fc_0
  - nss=3.98=h1d7d5a4_0
  - numpy=1.24.4=py38h59b608b_0
  - openblas=0.3.27=pthreads_h7a3da1a_0
  - openjdk=11.0.15=hea3dc9f_3
  - openjpeg=2.5.0=h7d73246_1
  - openldap=2.6.3=h2cfb03e_1
  - openmpi=4.1.6=hc5af2df_101
  - openpyxl=3.1.2=py38h01eb140_1
  - openssl=1.1.1w=hd590300_0
  - p11-kit=0.24.1=hc5aa10d_0
  - packaging=24.0=pyhd8ed1ab_0
  - pandas=1.5.3=py38hdc8b05c_1
  - pango=1.50.12=h382ae3d_0
  - pasa=2.5.3=h4ac6f70_1
  - patsy=0.5.6=pyhd8ed1ab_0
  - pblat=2.5.1=h0e0aaa8_1
  - pcre=8.45=h9c3ff4c_0
  - pcre2=10.40=hc3806b6_0
  - perl=5.32.1=7_hd590300_perl5
  - perl-app-cpanminus=1.7047=pl5321hd8ed1ab_0
  - perl-archive-tar=2.40=pl5321hdfd78af_0
  - perl-b-cow=0.007=pl5321hd590300_0
  - perl-base=2.23=pl5321hd8ed1ab_0
  - perl-business-isbn=3.007=pl5321hd8ed1ab_0
  - perl-business-isbn-data=20210112.006=pl5321hd8ed1ab_0
  - perl-carp=1.50=pl5321hd8ed1ab_0
  - perl-cgi=4.56=pl5321h031d066_1
  - perl-class-data-inheritable=0.09=pl5321ha770c72_0
  - perl-class-inspector=1.36=pl5321hdfd78af_0
  - perl-class-method-modifiers=2.13=pl5321ha770c72_0
  - perl-clone=0.46=pl5321h166bdaf_0
  - perl-clone-choose=0.010=pl5321hd8ed1ab_0
  - perl-common-sense=3.75=pl5321hd8ed1ab_0
  - perl-compress-raw-bzip2=2.201=pl5321h166bdaf_0
  - perl-compress-raw-zlib=2.202=pl5321h166bdaf_0
  - perl-constant=1.33=pl5321hd8ed1ab_0
  - perl-convert-binhex=1.125=pl5321hdfd78af_2
  - perl-data-dumper=2.183=pl5321hd590300_0
  - perl-db-file=1.855=pl5321h779adbc_1
  - perl-db_file=1.858=pl5321h166bdaf_0
  - perl-dbd-mysql=4.046=pl5321h9f5acd7_4
  - perl-dbd-sqlite=1.72=pl5321h031d066_1
  - perl-dbi=1.643=pl5321h166bdaf_0
  - perl-devel-stacktrace=2.04=pl5321ha770c72_0
  - perl-digest-hmac=1.04=pl5321hdfd78af_0
  - perl-digest-md5=2.58=pl5321h166bdaf_0
  - perl-email-date-format=1.006=pl5321hd8ed1ab_0
  - perl-encode=3.21=pl5321hd590300_0
  - perl-encode-locale=1.05=pl5321hdfd78af_7
  - perl-exception-class=1.45=pl5321ha770c72_0
  - perl-exporter=5.74=pl5321hd8ed1ab_0
  - perl-exporter-tiny=1.002002=pl5321hd8ed1ab_0
  - perl-extutils-makemaker=7.70=pl5321hd8ed1ab_0
  - perl-file-listing=6.16=pl5321hdfd78af_0
  - perl-file-path=2.18=pl5321hd8ed1ab_0
  - perl-file-spec=3.48_01=pl5321hdfd78af_2
  - perl-file-temp=0.2304=pl5321hd8ed1ab_0
  - perl-file-util=4.201720=pl5321hdfd78af_0
  - perl-file-which=1.24=pl5321hd8ed1ab_0
  - perl-getopt-long=2.54=pl5321hdfd78af_0
  - perl-hash-merge=0.302=pl5321hd8ed1ab_0
  - perl-html-parser=3.81=pl5321h4ac6f70_1
  - perl-html-tagset=3.20=pl5321hdfd78af_4
  - perl-http-cookies=6.10=pl5321hdfd78af_0
  - perl-http-daemon=6.16=pl5321hdfd78af_0
  - perl-http-date=6.06=pl5321hdfd78af_0
  - perl-http-message=6.36=pl5321hdfd78af_0
  - perl-http-negotiate=6.01=pl5321hdfd78af_4
  - perl-inc-latest=0.500=pl5321ha770c72_0
  - perl-io-compress=2.201=pl5321hdbdd923_2
  - perl-io-html=1.004=pl5321hdfd78af_0
  - perl-io-sessiondata=1.03=pl5321hdfd78af_2
  - perl-io-socket-ssl=2.075=pl5321hd8ed1ab_0
  - perl-io-zlib=1.14=pl5321hdfd78af_0
  - perl-json=4.10=pl5321hdfd78af_0
  - perl-json-xs=2.34=pl5321h4ac6f70_6
  - perl-lib=0.63=pl5321hd8ed1ab_0
  - perl-libwww-perl=6.67=pl5321hdfd78af_0
  - perl-list-moreutils=0.430=pl5321hdfd78af_0
  - perl-list-moreutils-xs=0.430=pl5321h031d066_2
  - perl-local-lib=2.000029=pl5321hdfd78af_0
  - perl-logger-simple=2.0=pl5321hdfd78af_1
  - perl-lwp-mediatypes=6.04=pl5321hdfd78af_1
  - perl-lwp-protocol-https=6.10=pl5321hdfd78af_0
  - perl-mailtools=2.21=pl5321hdfd78af_1
  - perl-math-utils=1.14=pl5321hdfd78af_0
  - perl-mce=1.888=pl5321hdfd78af_0
  - perl-mime-base64=3.16=pl5321h166bdaf_0
  - perl-mime-lite=3.030=pl5321hdfd78af_2
  - perl-mime-tools=5.508=pl5321hdfd78af_2
  - perl-mime-types=2.24=pl5321hdfd78af_0
  - perl-module-build=0.4234=pl5321ha770c72_0
  - perl-moo=2.005004=pl5321ha770c72_0
  - perl-mozilla-ca=20211001=pl5321hdfd78af_0
  - perl-net-http=6.22=pl5321hdfd78af_0
  - perl-net-ssleay=1.92=pl5321haa6b8db_1
  - perl-ntlm=1.09=pl5321hdfd78af_5
  - perl-object-insideout=4.05=pl5321hdfd78af_1
  - perl-parallel-forkmanager=2.02=pl5321hdfd78af_1
  - perl-parent=0.241=pl5321hd8ed1ab_0
  - perl-pathtools=3.75=pl5321h166bdaf_0
  - perl-role-tiny=2.002004=pl5321ha770c72_0
  - perl-scalar-list-utils=1.63=pl5321h166bdaf_0
  - perl-scalar-util-numeric=0.40=pl5321h031d066_5
  - perl-soap-lite=1.27=pl5321hdfd78af_0
  - perl-socket=2.027=pl5321h031d066_4
  - perl-storable=3.15=pl5321h166bdaf_0
  - perl-sub-quote=2.006006=pl5321ha770c72_0
  - perl-task-weaken=1.06=pl5321hdfd78af_1
  - perl-test-fatal=0.016=pl5321ha770c72_0
  - perl-test-harness=3.44=pl5321hd8ed1ab_0
  - perl-test-nowarnings=1.06=pl5321ha770c72_0
  - perl-test-pod=1.52=pl5321hdfd78af_1
  - perl-test-requiresinternet=0.05=pl5321hdfd78af_1
  - perl-test-warnings=0.031=pl5321ha770c72_0
  - perl-text-soundex=3.05=pl5321hd8ed1ab_1001
  - perl-time-hires=1.9764=pl5321h031d066_4
  - perl-time-local=1.35=pl5321hdfd78af_0
  - perl-timedate=2.33=pl5321hdfd78af_2
  - perl-try-tiny=0.31=pl5321ha770c72_0
  - perl-types-serialiser=1.01=pl5321hdfd78af_0
  - perl-uri=5.17=pl5321ha770c72_0
  - perl-url-encode=0.03=pl5321h9ee0642_0
  - perl-www-robotrules=6.02=pl5321hdfd78af_4
  - perl-xml-parser=2.44_01=pl5321hc3e0081_1003
  - perl-yaml=1.30=pl5321hdfd78af_0
  - phyml=3.3.20220408=h37cc20f_1
  - pigz=2.8=h2797004_0
  - pillow=9.2.0=py38h9eb91d8_3
  - pip=24.0=pyhd8ed1ab_0
  - pixman=0.43.2=h59595ed_0
  - platformdirs=4.2.1=pyhd8ed1ab_0
  - ply=3.11=pyhd8ed1ab_2
  - pooch=1.8.1=pyhd8ed1ab_0
  - prodigal=2.6.3=h031d066_8
  - proteinortho=6.3.1=h70414c8_0
  - psutil=5.9.8=py38h01eb140_0
  - pthread-stubs=0.4=h36c2ea0_1001
  - pulseaudio=14.0=habe0971_10
  - pydot=2.0.0=py38h578d9bd_0
  - pygments=2.18.0=pyhd8ed1ab_0
  - pyparsing=3.1.2=pyhd8ed1ab_0
  - pyqt=5.15.7=py38ha0d8c90_3
  - pyqt5-sip=12.11.0=py38h8dc9893_3
  - pysocks=1.7.1=pyha2e5f31_6
  - python=3.8.15=h257c98d_0_cpython
  - python-dateutil=2.9.0=pyhd8ed1ab_0
  - python_abi=3.8=4_cp38
  - pytz=2024.1=pyhd8ed1ab_0
  - qt-main=5.15.6=hc525480_0
  - r-base=4.2.2=hb87df5d_1
  - r-cli=3.6.2=r42ha503ecb_0
  - r-colorspace=2.1_0=r42h57805ef_1
  - r-crayon=1.5.2=r42hc72bb7e_2
  - r-ellipsis=0.3.2=r42h57805ef_2
  - r-fansi=1.0.6=r42h57805ef_0
  - r-farver=2.1.1=r42ha503ecb_2
  - r-ggplot2=3.5.1=r42hc72bb7e_0
  - r-glue=1.7.0=r42h57805ef_0
  - r-gtable=0.3.5=r42hc72bb7e_0
  - r-isoband=0.2.7=r42ha503ecb_2
  - r-labeling=0.4.3=r42hc72bb7e_0
  - r-lattice=0.22_6=r42h57805ef_0
  - r-lifecycle=1.0.4=r42hc72bb7e_0
  - r-magrittr=2.0.3=r42h57805ef_2
  - r-mass=7.3_60.0.1=r42h57805ef_0
  - r-matrix=1.6_5=r42h316c678_0
  - r-mgcv=1.9_1=r42h316c678_0
  - r-munsell=0.5.1=r42hc72bb7e_0
  - r-nlme=3.1_164=r42h61816a4_0
  - r-pillar=1.9.0=r42hc72bb7e_1
  - r-pkgconfig=2.0.3=r42hc72bb7e_3
  - r-r6=2.5.1=r42hc72bb7e_2
  - r-rcolorbrewer=1.1_3=r42h785f33e_2
  - r-rlang=1.1.3=r42ha503ecb_0
  - r-scales=1.3.0=r42hc72bb7e_0
  - r-tibble=3.2.1=r42h57805ef_2
  - r-utf8=1.2.4=r42h57805ef_0
  - r-vctrs=0.6.5=r42ha503ecb_0
  - r-viridislite=0.4.2=r42hc72bb7e_1
  - r-withr=3.0.0=r42hc72bb7e_0
  - raxml=8.2.13=h031d066_1
  - readline=8.2=h8228510_1
  - requests=2.31.0=pyhd8ed1ab_0
  - rich=13.7.1=pyhd8ed1ab_0
  - salmon=0.14.2=ha0cc327_0
  - samtools=1.18=hd87286a_0
  - scikit-learn=1.3.2=py38ha25d942_2
  - scipy=1.10.1=py38h32ae08f_1
  - seaborn=0.13.2=hd8ed1ab_2
  - seaborn-base=0.13.2=pyhd8ed1ab_2
  - sed=4.8=he412f7d_0
  - setuptools=69.5.1=pyhd8ed1ab_0
  - sip=6.7.12=py38h17151c0_0
  - six=1.16.0=pyh6c4a22f_0
  - slclust=02022010=1
  - snap=2013_11_29=h031d066_6
  - sqlite=3.45.3=h2c6b66d_0
  - statsmodels=0.14.1=py38h7f0c24c_0
  - stringtie=2.2.1=h6b7c446_4
  - suitesparse=5.10.1=hd8046ac_0
  - sysroot_linux-64=2.12=he073ed8_17
  - tantan=49=h43eeafb_0
  - tar=1.34=hb2e2bae_1
  - tbb=2020.2=h4bd325d_4
  - tbl2asn=25.7=h9ee0642_1
  - threadpoolctl=3.5.0=pyhc1e730c_0
  - tk=8.6.13=noxft_h4845f30_101
  - tktable=2.10=h0c5db8f_5
  - toml=0.10.2=pyhd8ed1ab_0
  - tomli=2.0.1=pyhd8ed1ab_0
  - tornado=6.4=py38h01eb140_0
  - transdecoder=5.7.1=pl5321hdfd78af_0
  - trimal=1.4.1=h4ac6f70_9
  - trimmomatic=0.39=hdfd78af_2
  - trinity=2.8.5=h8b12597_5
  - trnascan-se=2.0.12=pl5321h031d066_0
  - typing_extensions=4.11.0=pyha770c72_0
  - ucsc-blat=445=h954228d_0
  - ucsc-fatotwobit=447=h954228d_0
  - ucsc-pslcdnafilter=445=h954228d_0
  - ucsc-twobitinfo=447=h954228d_0
  - urllib3=2.2.1=pyhd8ed1ab_0
  - wget=1.20.3=ha56f1ee_1
  - wheel=0.43.0=pyhd8ed1ab_1
  - xcb-util=0.4.0=h516909a_0
  - xcb-util-image=0.4.0=h166bdaf_0
  - xcb-util-keysyms=0.4.0=h516909a_0
  - xcb-util-renderutil=0.3.9=h166bdaf_0
  - xcb-util-wm=0.4.1=h516909a_0
  - xkeyboard-config=2.38=h0b41bf4_0
  - xlsxwriter=3.1.9=pyhd8ed1ab_0
  - xorg-fixesproto=5.0=h7f98852_1002
  - xorg-inputproto=2.3.2=h7f98852_1002
  - xorg-kbproto=1.0.7=h7f98852_1002
  - xorg-libice=1.0.10=h7f98852_0
  - xorg-libsm=1.2.3=hd9c2040_1000
  - xorg-libx11=1.8.4=h0b41bf4_0
  - xorg-libxau=1.0.11=hd590300_0
  - xorg-libxdmcp=1.1.3=h7f98852_0
  - xorg-libxext=1.3.4=h0b41bf4_2
  - xorg-libxfixes=5.0.3=h7f98852_1004
  - xorg-libxi=1.7.10=h7f98852_0
  - xorg-libxrender=0.9.10=h7f98852_1003
  - xorg-libxt=1.3.0=hd590300_0
  - xorg-libxtst=1.2.3=h7f98852_1002
  - xorg-recordproto=1.14.2=h7f98852_1002
  - xorg-renderproto=0.11.1=h7f98852_1002
  - xorg-xextproto=7.3.0=h0b41bf4_1003
  - xorg-xproto=7.0.31=h7f98852_1007
  - xz=5.2.6=h166bdaf_0
  - zlib=1.2.13=hd590300_5
  - zstd=1.5.6=ha6fb4c9_0
  - pip:
      - filelock==3.15.4
      - fsspec==2024.6.1
      - jinja2==3.1.4
      - markupsafe==2.1.5
      - mpmath==1.3.0
      - networkx==3.1
      - nvidia-cublas-cu12==12.1.3.1
      - nvidia-cuda-cupti-cu12==12.1.105
      - nvidia-cuda-nvrtc-cu12==12.1.105
      - nvidia-cuda-runtime-cu12==12.1.105
      - nvidia-cudnn-cu12==8.9.2.26
      - nvidia-cufft-cu12==11.0.2.54
      - nvidia-curand-cu12==10.3.2.106
      - nvidia-cusolver-cu12==11.4.5.107
      - nvidia-cusparse-cu12==12.1.0.106
      - nvidia-nccl-cu12==2.20.5
      - nvidia-nvjitlink-cu12==12.5.82
      - nvidia-nvtx-cu12==12.1.105
      - signalp6==6.0+g
      - sympy==1.13.1
      - torch==2.3.1
      - tqdm==4.66.4
      - triton==2.3.1
prefix: /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra

```

**Here is the output of the installation:**

```{}
All Users:
  You will need to setup the funannotate databases using funannotate setup.
  The location of these databases on the file system is your decision and the
  location can be defined using the FUNANNOTATE_DB environmental variable.
  
  To set this up in your conda environment you can run the following:
    echo "export FUNANNOTATE_DB=/your/path" > /hpc/group/bio1/ewhisnant/miniconda3/envs/RepeatSuite/etc/conda/activate.d/funannotate.sh
    echo "unset FUNANNOTATE_DB" > /hpc/group/bio1/ewhisnant/miniconda3/envs/RepeatSuite/etc/conda/deactivate.d/funannotate.sh
  
  You can then run your database setup using funannotate:
    funannotate setup -i all
    
  Due to licensing restrictions, if you want to use GeneMark-ES/ET, you will need to install manually:
  download and follow directions at http://topaz.gatech.edu/GeneMark/license_download.cgi
  ** note you will likely need to change shebang line for all perl scripts:
    change: #!/usr/bin/perl to #!/usr/bin/env perl
     
      
Mac OSX Users:
  Augustus and Trinity cannot be properly installed via conda/bioconda at this time. However,
  they are able to be installed manually using a local copy of GCC (gcc-8 in example below).

  Install augustus using this repo:
    https://github.com/nextgenusfs/augustus
  
  To install Trinity v2.8.6, download the source code and compile using GCC/G++:
    wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/v2.8.6/trinityrnaseq-v2.8.6.FULL.tar.gz
    tar xzvf trinityrnaseq-v2.8.6.FULL.tar.gz
    cd trinityrnaseq-v2.8.6
    make CC=gcc-8 CXX=g++-8
    echo "export TRINITY_HOME=/your/path" > /hpc/group/bio1/ewhisnant/miniconda3/envs/RepeatSuite/etc/conda/activate.d/trinity.sh
    echo "unset TRINITY_HOME" > /hpc/group/bio1/ewhisnant/miniconda3/envs/RepeatSuite/etc/conda/deactivate.d/trinity.sh    

##########################################################################################

done

```

4. Get GenMark installed

    a. Go to the GeneMark website [here](https://exon.gatech.edu/GeneMark/license_download.cgi)

    b. Download GeneMark-Es/ET/EP

    c. Once downloaded, move to an appropriate directory (such as where software is stored)

    * In my case, I have it installed in /hpc/group/bio1/ewhisnant/software/gene-mark-software

    d. Set to $PATH by running:



5. Download RepeatMasker

The default installation for masking your genomes is tantan. It is not sufficient for masking whole assemblies.

*Ensure your funannotate/ funannotate_hydra environment is activated:* `conda activate funannotate_hydra`

* Here is the [RepeatMasker installation site](https://www.repeatmasker.org/RepeatMasker/)

    a. Install RepeatMasker with: `wget https://www.repeatmasker.org/RepeatMasker/RepeatMasker-4.1.7-p1.tar.gz`

    b. Unpack RepeatMasker with: `tar -xvzf RepeatMasker-4.1.7-p1.tar.gz`

    c. Move into the RepeatMasker directory. Then, install [RepBase libraries](https://www.girinst.org/server/RepBase/index.php)

      * Run: `wget https://www.girinst.org/server/RepBase/protected/repeatmaskerlibraries/RepBaseRepeatMaskerEdition-20181026.tar.gz`

      * Unpack RebBase: `tar -xvzf RepBaseRepeatMaskerEdition-20181026.tar.gz`

    d. Run the configuration: `perl ./configure` OR `perl configure`

      * You will be prompted to press enter; Press `Enter`

      * Then, you will be prompted to set up the TRF.pm (it is in the RepeatMasker directory): 

        * Enter the path to TRF.pm: `/hpc/group/bio1/ewhisnant/software/RepeatMasker/TRF.pm`

      * Finally, you will be asked to configure a Search Engine

        * HMMER is a default for funannotate, so choose this. RepeatMasker identifies this (if funannoate was configured correctly). I used the path that was prompted. Copy and paste the file-path that is prompted, and press `Enter`

        * When HMMER and DFAM are configured, press `5` and then `Enter`

        * Here is the output:

        ```{}

                Add a Search Engine:
          1. Crossmatch: [ Un-configured ]
          2. RMBlast: [ Un-configured ]
          3. HMMER3.1 & DFAM: [ Configured, Default ]
          4. ABBlast: [ Un-configured ]

          5. Done


        Enter Selection: 5
        Building FASTA version of RepeatMasker.lib ....
        The program is installed with a the following repeat libraries:

        FamDB Directory     : /hpc/group/bio1/ewhisnant/software/RepeatMasker/Libraries/famdb
        FamDB Generator     : famdb.py v1.0.2
        FamDB Format Version: 1.0
        FamDB Creation Date : 2024-09-03 13:17:04.814370

        Database: Dfam
        Version : 3.8
        Date    : 2023-11-14

        Dfam - A database of transposable element (TE) sequence alignments and HMMs.

        1 Partitions Present
        Total consensus sequences present: 38
        Total HMMs present               : 0


        Partition Details
        -----------------
        Partition 0 [min_init.0.h5]: root 
            Consensi: 38, HMMs: 0


        Further documentation on the program may be found here:
          /hpc/group/bio1/ewhisnant/software/RepeatMasker/repeatmasker.help
        ```

    e. Create a symbolic link to the environment bin directory: 
    
      * `ln -s /hpc/group/bio1/ewhisnant/software/RepeatMasker/util/rmOutToGFF3.pl /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/bin/rmOutToGFF3.pl`

    f. Export to $PATH: `export PATH="/hpc/group/bio1/ewhisnant/software/RepeatMasker/RepeatMasker:$PATH"`

6. Set up RepeatModeler

**NOTE:** To use RepeatMasker, you must provide a repeat database for the genome you are masking. You must use RepeatModeler.

    a. *Ensure the funannotate_hydra environment is activated.* Install RepeatModeler via conda: `conda install -c bioconda repeatmodeler`

    b. Check to see if RepeatModeler was installed correctly:

      ```{}
      # RUN THIS:
      conda list | grep repeatmodeler

      # THE CORRECT OUTPUT:
      repeatmodeler             1.0.8                         0    bioconda

      # THEN RUN THIS, TO SEE WHERE IT IS INSTALLED
      find $CONDA_PREFIX -name RepeatModeler

      # OUTPUT:
      /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/bin/RepeatModeler
      /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/share/RepeatModeler
      /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/share/RepeatModeler/RepeatModeler

      # COPY THE FILE PATH ENDING IN `.../bin/RepeatModeler`


      ```

    c. Open the `/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/etc/conda/activate.d/funannotate_hydra.sh` BASH script

    d. Check to see what is in there:

      * This is a script will run when the environment is activated.

    ```{}
    export GENEMARK_PATH=/hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64
    export EGGNOG_DATA_DIR=/hpc/group/bio1/ewhisnant/funannotate_db
    export FUNANNOTATE_DB=/hpc/group/bio1/ewhisnant/funannotate_db
    export PATH="/hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64:$PATH"

    # PASTE IN THE FOLLOWING LINES IN THIS BASH SCRIPT, TO ENSURE THE PATHS ARE SET UPON ACTIVATION
    export PATH="/hpc/group/bio1/ewhisnant/software/RepeatMasker/RepeatMasker:$PATH"
    export PATH="/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/bin/RepeatModeler:$PATH"

    ```

  e. Check to see if RepeatModeler is executable:

    ```{}
    # RUN:
    RepeatModeler

    # OUTPUT:

          No database indicated

      NAME
          RepeatModeler - Model repetitive DNA

      SYNOPSIS
            RepeatModeler [-options] -database <XDF Database>

      DESCRIPTION
          The options are:

          -h(elp)
              Detailed help

          -database
              The prefix name of a XDF formatted sequence database containing the
              genomic sequence to use when building repeat models. The database
              may be created with the WUBlast "xdformat" utility or with the
              RepeatModeler wrapper script "BuildXDFDatabase".

          -engine <abblast|wublast|ncbi>
              The name of the search engine we are using. I.e abblast/wublast or
              ncbi (rmblast version).

          -pa #
              Specify the number of shared-memory processors available to this
              program. RepeatModeler will use the processors to run BLAST searches
              in parallel. i.e on a machine with 10 cores one might use 1 core for
              the script and 9 cores for the BLAST searches by running with "-pa
              9".

          -recoverDir <Previous Output Directory>
              If a run fails in the middle of processing, it may be possible
              recover some results and continue where the previous run left off.
              Simply supply the output directory where the results of the failed
              run were saved and the program will attempt to recover and continue
              the run.

      SEE ALSO
              RepeatMasker, WUBlast

      COPYRIGHT
          Copyright 2005-2014 Institute for Systems Biology

      AUTHOR
          Robert Hubley <rhubley@systemsbiology.org>
          Arian Smit <asmit@systemsbiology.org>



    ```


  **[Information for running RepeatModeler and Masker](https://darencard.net/blog/2022-07-09-genome-repeat-annotation/#:~:text=You%20will%20see%20subdirectories%20for,%3A%20reference%2Dgenome%2Dfamilies.)**

 ########################### **OR**  ########################### 

Another option I experimented with was creating a seperate conda environment for RepeatMasker/Modeler. An issue that came up was a dependency conflict for h5py, so I decided to create a seperate conda environment `RepeatSuite` so I would not totally fuck my `funannotate_hydra` environment.

  a. Create the environment using the following commands:

  ```{}
  
  conda create -n RepeatSuite python=3.8

  # SAVE THE repeatsuite.yaml (below)

  # THEN RUN:
  conda env update -n RepeatSuite -f repeatsuite.yml
  

  # WHEN THAT IS DONE, YOU MAY NEED TO UPGRADE H5PY
    # RUN:
  conda activate RepeatSuite
    # THEN RUN:
  pip install --upgrade h5py
  
  # TEST THE INSTALLATION:
    # RUN:
  RepeatMasker -h # The help page should come up in the terminal
    # RUN::
  RepeatModeler -h # The help page should come up in the terminal

  # HERE IS THE YAML FILE FOR REPEATSUITE
  # IT IS BASICALLY COPIED FROM THE FUNANNOTATE_HYDRA DEPENDENCIES
  ##################################################################
  ##                       repeatsuite.yml                        ##
  ##################################################################
      name: RepeatSuite
    channels:
      - conda-forge
      - bioconda
      - r
      - defaults
    dependencies:
      - _libgcc_mutex=0.1=conda_forge
      - _openmp_mutex=4.5=2_gnu
      - _r-mutex=1.0.1=anacondar_1
      - alsa-lib=1.2.7.2=h166bdaf_0
      - aria2=1.23.0=0
      - atk-1.0=2.38.0=hd4edc92_1
      - attr=2.5.1=h166bdaf_1
      - augustus=3.5.0=pl5321h700735d_3
      - bamtools=2.5.1=hd03093a_10
      - barrnap=0.9=hdfd78af_4
      - bedtools=2.31.1=hf5e1c6e_1
      - binutils_impl_linux-64=2.40=ha885e6a_0
      - bioconductor-seqlogo=1.64.0=r42hdfd78af_0
      - biopython=1.79=py38h0a891b7_3
      - blas=1.1=openblas
      - blast=2.15.0=pl5321h6f7f691_1
      - blis=0.9.0=h4ab18f5_2
      - boost-cpp=1.78.0=h5adbc97_2
      - bowtie=1.3.1=py38he293eaa_3
      - bowtie2=2.4.5=py38hfbc8389_3
      - brotli-python=1.0.9=py38hfa26641_9
      - bwidget=1.9.14=ha770c72_1
      - bzip2=1.0.8=hd590300_5
      - c-ares=1.28.1=hd590300_0
      - ca-certificates=2024.8.30=hbcca054_0
      - cairo=1.16.0=ha61ee94_1014
      - cdbtools=0.99=hdcf5f25_10
      - certifi=2024.8.30=pyhd8ed1ab_0
      - charset-normalizer=3.3.2=pyhd8ed1ab_0
      - codingquarry=2.0=py38h2494328_8
      - curl=7.87.0=h5eee18b_0
      - cycler=0.12.1=pyhd8ed1ab_0
      - cyrus-sasl=2.1.27=h230043b_5
      - dbus=1.13.6=h5008d03_3
      - diamond=2.1.9=h43eeafb_0
      - distro=1.9.0=pyhd8ed1ab_0
      - docopt=0.6.2=py_1
      - easel=0.49=h031d066_0
      - eggnog-mapper=2.1.12=pyhdfd78af_0
      - entrez-direct=21.6=he881be0_0
      - et_xmlfile=1.1.0=pyhd8ed1ab_0
      - ete3=3.1.3=pyhd8ed1ab_0
      - evidencemodeler=1.1.1=hdfd78af_3
      - exonerate=2.4.0=hf34a1b8_7
      - expat=2.6.2=h59595ed_0
      - fasta3=36.3.8=hec16e2b_7
      - fftw=3.3.10=nompi_hc118613_108
      - font-ttf-dejavu-sans-mono=2.37=hab24e00_0
      - font-ttf-inconsolata=3.000=h77eed37_0
      - font-ttf-source-code-pro=2.038=h77eed37_0
      - font-ttf-ubuntu=0.83=h77eed37_2
      - fontconfig=2.14.2=h14ed4e7_0
      - fonts-conda-ecosystem=1=0
      - fonts-conda-forge=1=0
      - freetype=2.12.1=h267a509_2
      - fribidi=1.0.10=h36c2ea0_0
      - funannotate=1.8.15=pyhdfd78af_2
      - gawk=5.3.0=ha916aea_0
      - gcc_impl_linux-64=13.2.0=h9eb54c0_7
      - gdk-pixbuf=2.42.10=h5eee18b_0
      - gettext=0.22.5=h59595ed_2
      - gettext-tools=0.22.5=h59595ed_2
      - gfortran_impl_linux-64=13.2.0=h738fc78_7
      - giflib=5.2.2=hd590300_0
      - glib=2.78.1=hfc55251_0
      - glib-tools=2.78.1=hfc55251_0
      - glimmerhmm=3.0.4=pl5321hdbdd923_7
      - gmap=2024.03.15=pl5321h9d449c0_2
      - gmp=6.3.0=h59595ed_1
      - gnutls=3.7.8=hf3e180e_0
      - goatools=1.4.4=pyhd8ed1ab_0
      - graphite2=1.3.13=h59595ed_1003
      - graphviz=7.1.0=h2e5815a_0
      - gsl=2.7=he838d99_0
      - gst-plugins-base=1.20.3=h57caac4_2
      - gstreamer=1.20.3=hd4edc92_2
      - gstreamer-orc=0.4.38=hd590300_0
      - gtk2=2.24.33=h90689f9_2
      - gts=0.7.6=h977cf35_4
      - gxx_impl_linux-64=13.2.0=h2a599c4_7
      - harfbuzz=5.3.0=h418a68e_0
      - hdf5=1.10.5=nompi_h5b725eb_1114
      - hisat2=2.2.1=hdbdd923_6
      - hmmer=3.4=hdbdd923_1
      - htslib=1.17=h6bc39ce_1
      - icu=70.1=h27087fc_0
      - idna=3.7=pyhd8ed1ab_0
      - infernal=1.1.5=pl5321h031d066_1
      - iqtree=2.3.3=h21ec9f0_0
      - itsx=1.1.3=hdfd78af_1
      - jack=1.9.21=h2a1e645_0
      - joblib=1.4.2=pyhd8ed1ab_0
      - jpeg=9e=h0b41bf4_3
      - k8=0.2.5=hdcf5f25_4
      - kallisto=0.46.1=h4f7b962_0
      - kernel-headers_linux-64=2.6.32=he073ed8_17
      - keyutils=1.6.1=h166bdaf_0
      - kiwisolver=1.4.5=py38h7f3f72f_1
      - kmer-jellyfish=2.3.1=h4ac6f70_0
      - krb5=1.19.3=h3790be6_0
      - lame=3.100=h166bdaf_1003
      - lcms2=2.14=h6ed2654_0
      - ld_impl_linux-64=2.40=h55db66e_0
      - lerc=4.0.0=h27087fc_0
      - libasprintf=0.22.5=h661eb56_2
      - libasprintf-devel=0.22.5=h661eb56_2
      - libblas=3.9.0=22_linux64_openblas
      - libbrotlicommon=1.0.9=h166bdaf_9
      - libbrotlidec=1.0.9=h166bdaf_9
      - libbrotlienc=1.0.9=h166bdaf_9
      - libcap=2.66=ha37c62d_0
      - libcblas=3.9.0=22_linux64_openblas
      - libclang=14.0.6=default_h7634d5b_1
      - libclang13=14.0.6=default_h9986a30_1
      - libcups=2.3.3=h3e49a29_2
      - libcurl=7.87.0=h91b91d3_0
      - libdb=6.2.32=h9c3ff4c_0
      - libdeflate=1.14=h166bdaf_0
      - libedit=3.1.20191231=he28a2e2_2
      - libev=4.33=hd590300_2
      - libevent=2.1.10=h9b69904_4
      - libexpat=2.6.2=h59595ed_0
      - libffi=3.4.2=h7f98852_5
      - libflac=1.4.3=h59595ed_0
      - libgcc=7.2.0=h69d50b8_2
      - libgcc-devel_linux-64=13.2.0=hceb6213_107
      - libgcc-ng=13.2.0=h77fa898_7
      - libgcrypt=1.10.3=hd590300_0
      - libgd=2.3.3=h695aa2c_1
      - libgettextpo=0.22.5=h59595ed_2
      - libgettextpo-devel=0.22.5=h59595ed_2
      - libgfortran-ng=13.2.0=h69a702a_7
      - libgfortran5=13.2.0=hca663fb_7
      - libglib=2.78.1=hebfc3b9_0
      - libgomp=13.2.0=h77fa898_7
      - libgpg-error=1.49=h4f305b6_0
      - libiconv=1.17=hd590300_2
      - libidn11=1.34=h1cef754_0
      - libidn2=2.3.7=hd590300_0
      - liblapack=3.9.0=22_linux64_openblas
      - libllvm14=14.0.6=hcd5def8_4
      - libllvm15=15.0.7=hadd5161_1
      - libnghttp2=1.51.0=hdcd2b5c_0
      - libnsl=2.0.1=hd590300_0
      - libntlm=1.4=h7f98852_1002
      - libogg=1.3.4=h7f98852_1
      - libopenblas=0.3.27=pthreads_h413a1c8_0
      - libopus=1.3.1=h7f98852_1
      - libpng=1.6.43=h2797004_0
      - libpq=14.5=h72a31a5_3
      - librsvg=2.54.4=h7abd40a_0
      - libsanitizer=13.2.0=h6ddb7a1_7
      - libsndfile=1.1.0=hcb278e6_1
      - libsqlite=3.45.3=h2797004_0
      - libssh2=1.10.0=haa6b8db_3
      - libstdcxx-devel_linux-64=13.2.0=hceb6213_107
      - libstdcxx-ng=13.2.0=hc0a3c3a_7
      - libsystemd0=252=h2a991cd_0
      - libtasn1=4.19.0=h166bdaf_0
      - libtiff=4.4.0=h82bc61c_5
      - libtool=2.4.7=h27087fc_0
      - libudev1=253=h0b41bf4_0
      - libunistring=0.9.10=h7f98852_0
      - libuuid=2.38.1=h0b41bf4_0
      - libvorbis=1.3.7=h9c3ff4c_0
      - libwebp-base=1.4.0=hd590300_0
      - libxcb=1.13=h7f98852_1004
      - libxcrypt=4.4.36=hd590300_1
      - libxkbcommon=1.5.0=h79f4944_1
      - libxml2=2.10.3=hca2bb57_4
      - libxslt=1.1.37=h873f0b0_0
      - libzlib=1.2.13=hd590300_5
      - lighttpd=1.4.64=lua54h145e673_2
      - lp_solve=5.5.2.11=hd590300_0
      - lua=5.4.6=h9627803_0
      - lxml=4.9.2=py38h215a2d7_0
      - lz4-c=1.9.4=hcb278e6_0
      - mafft=7.526=h4ab18f5_0
      - make=4.3=hd18ef5c_1
      - markdown-it-py=3.0.0=pyhd8ed1ab_0
      - matplotlib-base=3.4.3=py38hf4fb855_1
      - mdurl=0.1.2=pyhd8ed1ab_0
      - metis=5.1.0=h59595ed_1007
      - minimap2=2.28=he4a0461_0
      - mmseqs2=15.6f452=pl5321h6a68c12_2
      - mpfr=4.2.1=h9458935_1
      - mpg123=1.31.3=hcb278e6_0
      - mpi=1.0=openmpi
      - mysql-common=8.0.32=h14678bc_0
      - mysql-connector-c=6.1.11=h6eb9d5d_1007
      - mysql-libs=8.0.32=h54cf53e_0
      - natsort=8.4.0=pyhd8ed1ab_0
      - ncbi-vdb=3.1.0=h4ac6f70_2
      - ncurses=6.4.20240210=h59595ed_0
      - nettle=3.8.1=hc379101_1
      - nspr=4.35=h27087fc_0
      - nss=3.98=h1d7d5a4_0
      - numpy=1.24.4=py38h59b608b_0
      - openblas=0.3.27=pthreads_h7a3da1a_0
      - openjdk=11.0.15=hea3dc9f_3
      - openjpeg=2.5.0=h7d73246_1
      - openldap=2.6.3=h2cfb03e_1
      - openmpi=4.1.6=hc5af2df_101
      - openpyxl=3.1.2=py38h01eb140_1
      - openssl=1.1.1w=hd590300_0
      - p11-kit=0.24.1=hc5aa10d_0
      - packaging=24.0=pyhd8ed1ab_0
      - pandas=1.5.3=py38hdc8b05c_1
      - pango=1.50.12=h382ae3d_0
      - pasa=2.5.3=h4ac6f70_1
      - patsy=0.5.6=pyhd8ed1ab_0
      - pblat=2.5.1=h0e0aaa8_1
      - pcre=8.45=h9c3ff4c_0
      - pcre2=10.40=hc3806b6_0
      - perl=5.32.1=7_hd590300_perl5
      - perl-app-cpanminus=1.7047=pl5321hd8ed1ab_0
      - perl-archive-tar=2.40=pl5321hdfd78af_0
      - perl-b-cow=0.007=pl5321hd590300_0
      - perl-base=2.23=pl5321hd8ed1ab_0
      - perl-business-isbn=3.007=pl5321hd8ed1ab_0
      - perl-business-isbn-data=20210112.006=pl5321hd8ed1ab_0
      - perl-carp=1.50=pl5321hd8ed1ab_0
      - perl-cgi=4.56=pl5321h031d066_1
      - perl-class-data-inheritable=0.09=pl5321ha770c72_0
      - perl-class-inspector=1.36=pl5321hdfd78af_0
      - perl-class-method-modifiers=2.13=pl5321ha770c72_0
      - perl-clone=0.46=pl5321h166bdaf_0
      - perl-clone-choose=0.010=pl5321hd8ed1ab_0
      - perl-common-sense=3.75=pl5321hd8ed1ab_0
      - perl-compress-raw-bzip2=2.201=pl5321h166bdaf_0
      - perl-compress-raw-zlib=2.202=pl5321h166bdaf_0
      - perl-constant=1.33=pl5321hd8ed1ab_0
      - perl-convert-binhex=1.125=pl5321hdfd78af_2
      - perl-data-dumper=2.183=pl5321hd590300_0
      - perl-db-file=1.855=pl5321h779adbc_1
      - perl-db_file=1.858=pl5321h166bdaf_0
      - perl-dbd-mysql=4.046=pl5321h9f5acd7_4
      - perl-dbd-sqlite=1.72=pl5321h031d066_1
      - perl-dbi=1.643=pl5321h166bdaf_0
      - perl-devel-stacktrace=2.04=pl5321ha770c72_0
      - perl-digest-hmac=1.04=pl5321hdfd78af_0
      - perl-digest-md5=2.58=pl5321h166bdaf_0
      - perl-email-date-format=1.006=pl5321hd8ed1ab_0
      - perl-encode=3.21=pl5321hd590300_0
      - perl-encode-locale=1.05=pl5321hdfd78af_7
      - perl-exception-class=1.45=pl5321ha770c72_0
      - perl-exporter=5.74=pl5321hd8ed1ab_0
      - perl-exporter-tiny=1.002002=pl5321hd8ed1ab_0
      - perl-extutils-makemaker=7.70=pl5321hd8ed1ab_0
      - perl-file-listing=6.16=pl5321hdfd78af_0
      - perl-file-path=2.18=pl5321hd8ed1ab_0
      - perl-file-spec=3.48_01=pl5321hdfd78af_2
      - perl-file-temp=0.2304=pl5321hd8ed1ab_0
      - perl-file-util=4.201720=pl5321hdfd78af_0
      - perl-file-which=1.24=pl5321hd8ed1ab_0
      - perl-getopt-long=2.54=pl5321hdfd78af_0
      - perl-hash-merge=0.302=pl5321hd8ed1ab_0
      - perl-html-parser=3.81=pl5321h4ac6f70_1
      - perl-html-tagset=3.20=pl5321hdfd78af_4
      - perl-http-cookies=6.10=pl5321hdfd78af_0
      - perl-http-daemon=6.16=pl5321hdfd78af_0
      - perl-http-date=6.06=pl5321hdfd78af_0
      - perl-http-message=6.36=pl5321hdfd78af_0
      - perl-http-negotiate=6.01=pl5321hdfd78af_4
      - perl-inc-latest=0.500=pl5321ha770c72_0
      - perl-io-compress=2.201=pl5321hdbdd923_2
      - perl-io-html=1.004=pl5321hdfd78af_0
      - perl-io-sessiondata=1.03=pl5321hdfd78af_2
      - perl-io-socket-ssl=2.075=pl5321hd8ed1ab_0
      - perl-io-zlib=1.14=pl5321hdfd78af_0
      - perl-json=4.10=pl5321hdfd78af_0
      - perl-json-xs=2.34=pl5321h4ac6f70_6
      - perl-lib=0.63=pl5321hd8ed1ab_0
      - perl-libwww-perl=6.67=pl5321hdfd78af_0
      - perl-list-moreutils=0.430=pl5321hdfd78af_0
      - perl-list-moreutils-xs=0.430=pl5321h031d066_2
      - perl-local-lib=2.000029=pl5321hdfd78af_0
      - perl-logger-simple=2.0=pl5321hdfd78af_1
      - perl-lwp-mediatypes=6.04=pl5321hdfd78af_1
      - perl-lwp-protocol-https=6.10=pl5321hdfd78af_0
      - perl-mailtools=2.21=pl5321hdfd78af_1
      - perl-math-utils=1.14=pl5321hdfd78af_0
      - perl-mce=1.888=pl5321hdfd78af_0
      - perl-mime-base64=3.16=pl5321h166bdaf_0
      - perl-mime-lite=3.030=pl5321hdfd78af_2
      - perl-mime-tools=5.508=pl5321hdfd78af_2
      - perl-mime-types=2.24=pl5321hdfd78af_0
      - perl-module-build=0.4234=pl5321ha770c72_0
      - perl-moo=2.005004=pl5321ha770c72_0
      - perl-mozilla-ca=20211001=pl5321hdfd78af_0
      - perl-net-http=6.22=pl5321hdfd78af_0
      - perl-net-ssleay=1.92=pl5321haa6b8db_1
      - perl-ntlm=1.09=pl5321hdfd78af_5
      - perl-object-insideout=4.05=pl5321hdfd78af_1
      - perl-parallel-forkmanager=2.02=pl5321hdfd78af_1
      - perl-parent=0.241=pl5321hd8ed1ab_0
      - perl-pathtools=3.75=pl5321h166bdaf_0
      - perl-role-tiny=2.002004=pl5321ha770c72_0
      - perl-scalar-list-utils=1.63=pl5321h166bdaf_0
      - perl-scalar-util-numeric=0.40=pl5321h031d066_5
      - perl-soap-lite=1.27=pl5321hdfd78af_0
      - perl-socket=2.027=pl5321h031d066_4
      - perl-storable=3.15=pl5321h166bdaf_0
      - perl-sub-quote=2.006006=pl5321ha770c72_0
      - perl-task-weaken=1.06=pl5321hdfd78af_1
      - perl-test-fatal=0.016=pl5321ha770c72_0
      - perl-test-harness=3.44=pl5321hd8ed1ab_0
      - perl-test-nowarnings=1.06=pl5321ha770c72_0
      - perl-test-pod=1.52=pl5321hdfd78af_1
      - perl-test-requiresinternet=0.05=pl5321hdfd78af_1
      - perl-test-warnings=0.031=pl5321ha770c72_0
      - perl-text-soundex=3.05=pl5321hd8ed1ab_1001
      - perl-time-hires=1.9764=pl5321h031d066_4
      - perl-time-local=1.35=pl5321hdfd78af_0
      - perl-timedate=2.33=pl5321hdfd78af_2
      - perl-try-tiny=0.31=pl5321ha770c72_0
      - perl-types-serialiser=1.01=pl5321hdfd78af_0
      - perl-uri=5.17=pl5321ha770c72_0
      - perl-url-encode=0.03=pl5321h9ee0642_0
      - perl-www-robotrules=6.02=pl5321hdfd78af_4
      - perl-xml-parser=2.44_01=pl5321hc3e0081_1003
      - perl-yaml=1.30=pl5321hdfd78af_0
      - phyml=3.3.20220408=h37cc20f_1
      - pigz=2.8=h2797004_0
      - pillow=9.2.0=py38h9eb91d8_3
      - pip=24.0=pyhd8ed1ab_0
      - pixman=0.43.2=h59595ed_0
      - platformdirs=4.2.1=pyhd8ed1ab_0
      - ply=3.11=pyhd8ed1ab_2
      - pooch=1.8.1=pyhd8ed1ab_0
      - prodigal=2.6.3=h031d066_8
      - proteinortho=6.3.1=h70414c8_0
      - psutil=5.9.8=py38h01eb140_0
      - pthread-stubs=0.4=h36c2ea0_1001
      - pulseaudio=14.0=habe0971_10
      - pydot=2.0.0=py38h578d9bd_0
      - pygments=2.18.0=pyhd8ed1ab_0
      - pyparsing=3.1.2=pyhd8ed1ab_0
      - pyqt=5.15.7=py38ha0d8c90_3
      - pyqt5-sip=12.11.0=py38h8dc9893_3
      - pysocks=1.7.1=pyha2e5f31_6
      - python=3.8.15=h257c98d_0_cpython
      - python-dateutil=2.9.0=pyhd8ed1ab_0
      - python_abi=3.8=4_cp38
      - pytz=2024.1=pyhd8ed1ab_0
      - qt-main=5.15.6=hc525480_0
      - r-base=4.2.2=hb87df5d_1
      - r-cli=3.6.2=r42ha503ecb_0
      - r-colorspace=2.1_0=r42h57805ef_1
      - r-crayon=1.5.2=r42hc72bb7e_2
      - r-ellipsis=0.3.2=r42h57805ef_2
      - r-fansi=1.0.6=r42h57805ef_0
      - r-farver=2.1.1=r42ha503ecb_2
      - r-ggplot2=3.5.1=r42hc72bb7e_0
      - r-glue=1.7.0=r42h57805ef_0
      - r-gtable=0.3.5=r42hc72bb7e_0
      - r-isoband=0.2.7=r42ha503ecb_2
      - r-labeling=0.4.3=r42hc72bb7e_0
      - r-lattice=0.22_6=r42h57805ef_0
      - r-lifecycle=1.0.4=r42hc72bb7e_0
      - r-magrittr=2.0.3=r42h57805ef_2
      - r-mass=7.3_60.0.1=r42h57805ef_0
      - r-matrix=1.6_5=r42h316c678_0
      - r-mgcv=1.9_1=r42h316c678_0
      - r-munsell=0.5.1=r42hc72bb7e_0
      - r-nlme=3.1_164=r42h61816a4_0
      - r-pillar=1.9.0=r42hc72bb7e_1
      - r-pkgconfig=2.0.3=r42hc72bb7e_3
      - r-r6=2.5.1=r42hc72bb7e_2
      - r-rcolorbrewer=1.1_3=r42h785f33e_2
      - r-rlang=1.1.3=r42ha503ecb_0
      - r-scales=1.3.0=r42hc72bb7e_0
      - r-tibble=3.2.1=r42h57805ef_2
      - r-utf8=1.2.4=r42h57805ef_0
      - r-vctrs=0.6.5=r42ha503ecb_0
      - r-viridislite=0.4.2=r42hc72bb7e_1
      - r-withr=3.0.0=r42hc72bb7e_0
      - raxml=8.2.13=h031d066_1
      - readline=8.2=h8228510_1
      - requests=2.31.0=pyhd8ed1ab_0
      - rich=13.7.1=pyhd8ed1ab_0
      - salmon=0.14.2=ha0cc327_0
      - samtools=1.18=hd87286a_0
      - scikit-learn=1.3.2=py38ha25d942_2
      - scipy=1.10.1=py38h32ae08f_1
      - seaborn=0.13.2=hd8ed1ab_2
      - seaborn-base=0.13.2=pyhd8ed1ab_2
      - sed=4.8=he412f7d_0
      - setuptools=69.5.1=pyhd8ed1ab_0
      - sip=6.7.12=py38h17151c0_0
      - six=1.16.0=pyh6c4a22f_0
      - slclust=02022010=1
      - snap=2013_11_29=h031d066_6
      - sqlite=3.45.3=h2c6b66d_0
      - statsmodels=0.14.1=py38h7f0c24c_0
      - stringtie=2.2.1=h6b7c446_4
      - suitesparse=5.10.1=hd8046ac_0
      - sysroot_linux-64=2.12=he073ed8_17
      - tantan=49=h43eeafb_0
      - tar=1.34=hb2e2bae_1
      - tbb=2020.2=h4bd325d_4
      - tbl2asn=25.7=h9ee0642_1
      - threadpoolctl=3.5.0=pyhc1e730c_0
      - tk=8.6.13=noxft_h4845f30_101
      - tktable=2.10=h0c5db8f_5
      - toml=0.10.2=pyhd8ed1ab_0
      - tomli=2.0.1=pyhd8ed1ab_0
      - tornado=6.4=py38h01eb140_0
      - transdecoder=5.7.1=pl5321hdfd78af_0
      - trimal=1.4.1=h4ac6f70_9
      - trimmomatic=0.39=hdfd78af_2
      - trinity=2.8.5=h8b12597_5
      - trnascan-se=2.0.12=pl5321h031d066_0
      - typing_extensions=4.11.0=pyha770c72_0
      - ucsc-blat=445=h954228d_0
      - ucsc-fatotwobit=447=h954228d_0
      - ucsc-pslcdnafilter=445=h954228d_0
      - ucsc-twobitinfo=447=h954228d_0
      - urllib3=2.2.1=pyhd8ed1ab_0
      - wget=1.20.3=ha56f1ee_1
      - wheel=0.43.0=pyhd8ed1ab_1
      - xcb-util=0.4.0=h516909a_0
      - xcb-util-image=0.4.0=h166bdaf_0
      - xcb-util-keysyms=0.4.0=h516909a_0
      - xcb-util-renderutil=0.3.9=h166bdaf_0
      - xcb-util-wm=0.4.1=h516909a_0
      - xkeyboard-config=2.38=h0b41bf4_0
      - xlsxwriter=3.1.9=pyhd8ed1ab_0
      - xorg-fixesproto=5.0=h7f98852_1002
      - xorg-inputproto=2.3.2=h7f98852_1002
      - xorg-kbproto=1.0.7=h7f98852_1002
      - xorg-libice=1.0.10=h7f98852_0
      - xorg-libsm=1.2.3=hd9c2040_1000
      - xorg-libx11=1.8.4=h0b41bf4_0
      - xorg-libxau=1.0.11=hd590300_0
      - xorg-libxdmcp=1.1.3=h7f98852_0
      - xorg-libxext=1.3.4=h0b41bf4_2
      - xorg-libxfixes=5.0.3=h7f98852_1004
      - xorg-libxi=1.7.10=h7f98852_0
      - xorg-libxrender=0.9.10=h7f98852_1003
      - xorg-libxt=1.3.0=hd590300_0
      - xorg-libxtst=1.2.3=h7f98852_1002
      - xorg-recordproto=1.14.2=h7f98852_1002
      - xorg-renderproto=0.11.1=h7f98852_1002
      - xorg-xextproto=7.3.0=h0b41bf4_1003
      - xorg-xproto=7.0.31=h7f98852_1007
      - xz=5.2.6=h166bdaf_0
      - zlib=1.2.13=hd590300_5
      - zstd=1.5.6=ha6fb4c9_0
      - repeatmodeler
      - repeatmasker
    prefix: /hpc/group/bio1/ewhisnant/miniconda3/envs/RepeatSuite




  ```

6. Set up the funannotate database

```{}
# Activate conda environment:

conda activate funannotate_hydra

# Install the databases; you will need to adjust this file path (but end with /funannotate_db)

funannotate setup -d /hpc/group/bio1/ewhisnant/funannotate_db

# Once this has been installed, set ENV variable for $FUNANNOTATE_DB
    # This code will 
echo "export FUNANNOTATE_DB=FUNANNOTATE_DB=/hpc/group/bio1/ewhisnant/funannotate_db" > /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/etc/conda/activate.d/funannotate.sh
echo "unset FUNANNOTATE_DB" > /hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/etc/conda/deactivate.d/funannotate.sh


```

7. Ensure that all environmental variables are set:

  * GenMark should be set

  * funannotate_db should be set


```{}
# Activate conda environment:

conda activate funannotate_hydra

# Install the databases; you will need to adjust this file path (but end with /funannotate_db)

funannotate setup -d /hpc/group/ewhisnant/funannotate_db

```

```{}

$FUNANNOTATE_DB=/hpc/group/bio1/ewhisnant/funannotate_db
$PASAHOME=/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/opt/pasa-2.5.3
$TRINITY_HOME=/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/opt/trinity-2.8.5
$EVM_HOME=/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/opt/evidencemodeler-1.1.1
$AUGUSTUS_CONFIG_PATH=/hpc/group/bio1/ewhisnant/miniconda3/envs/funannotate_hydra/config/
$GENEMARK_PATH=/hpc/group/bio1/ewhisnant/software/gene-mark-software/gmes_linux_64

```

8. Installing EffectorP

 a. Move to your your 'software' directory, install EffectorP.

 ```{}
  wget https://github.com/JanaSperschneider/EffectorP-3.0/releases/tag/v3.0.0-beta

 ```
 b. Then follow these instructions for setting up [EffectorP](https://github.com/JanaSperschneider/EffectorP-3.0). It should be pretty easy to install.

9. Install antiSMASH - secondary metabolite gene prediction. Here is the [antiSMASH website](https://docs.antismash.secondarymetabolites.org/install/).

  a. Create an antismash conda environment

  ```{}
  # Create the conda environment
  conda create -n antismash antismash

  # Activate antismash env
  conda activate antismash

  # Run the line below to download the antismash databases
  download-antismash-databases

  # To deactivate the antismash env, then 
  conda deactivate


  ```

  b. Here is information on how to run antiSMASH and its components. To run antiSMASH, activate the environment and call `antismash` followed by inputs and all options that you would like to include.

  ```{}
    antismash --help-showall

    ########### antiSMASH 7.1.0 #############

    usage: antismash [-h] [--help-showall] [-t {bacteria,fungi}] [-c CPUS] [--databases PATH]
                    [--output-dir OUTPUT_DIR] [--output-basename OUTPUT_BASENAME]
                    [--reuse-results PATH] [--limit LIMIT]
                    [--abort-on-invalid-records | --no-abort-on-invalid-records]
                    [--minlength MINLENGTH] [--start START] [--end END] [--write-config-file PATH]
                    [--without-fimo] [--executable-paths EXECUTABLE=PATH,EXECUTABLE2=PATH2,...]
                    [--allow-long-headers | --no-allow-long-headers] [-v] [-d] [--logfile PATH]
                    [--list-plugins] [--check-prereqs] [--limit-to-record RECORD_ID] [-V]
                    [--profiling] [--skip-sanitisation] [--skip-zip-file] [--minimal]
                    [--enable-genefunctions] [--enable-lanthipeptides] [--enable-lassopeptides]
                    [--enable-nrps-pks] [--enable-sactipeptides] [--enable-t2pks]
                    [--enable-thiopeptides] [--enable-tta] [--enable-html] [--fullhmmer]
                    [--fullhmmer-pfamdb-version FULLHMMER_PFAMDB_VERSION] [--sideload JSON]
                    [--sideload-simple ACCESSION:START-END] [--sideload-by-cds LOCUS1,LOCUS2,...]
                    [--sideload-size-by-cds NUCLEOTIDES]
                    [--hmmdetection-strictness {strict,relaxed,loose}]
                    [--hmmdetection-fungal-cutoff-multiplier HMMDETECTION_FUNGAL_CUTOFF_MULTIPLIER]
                    [--hmmdetection-fungal-neighbourhood-multiplier HMMDETECTION_FUNGAL_NEIGHBOURHOOD_MULTIPLIER]
                    [--hmmdetection-limit-to-rule-names RULE1[,RULE2,...]]
                    [--hmmdetection-limit-to-rule-categories CATEGORY1[,CATEGORY2,...]] [--cassis]
                    [--clusterhmmer] [--clusterhmmer-pfamdb-version CLUSTERHMMER_PFAMDB_VERSION]
                    [--tigrfam] [--asf] [--cc-mibig] [--cc-custom-dbs FILE1,FILE2,...] [--cb-general]
                    [--cb-subclusters] [--cb-knownclusters] [--cb-nclusters count]
                    [--cb-min-homology-scale LIMIT] [--pfam2go] [--rre] [--rre-cutoff RRE_CUTOFF]
                    [--rre-minlength RRE_MIN_LENGTH] [--smcog-trees] [--tfbs]
                    [--tfbs-pvalue TFBS_PVALUE] [--tfbs-range TFBS_RANGE]
                    [--tta-threshold TTA_THRESHOLD] [--html-title HTML_TITLE]
                    [--html-description HTML_DESCRIPTION] [--html-start-compact]
                    [--html-ncbi-context | --no-html-ncbi-context]
                    [--genefinding-tool {glimmerhmm,prodigal,prodigal-m,none,error}]
                    [--genefinding-gff3 GFF3_FILE]
                    [SEQUENCE ...]


    arguments:
      SEQUENCE  GenBank/EMBL/FASTA file(s) containing DNA.

    --------
    Options
    --------
    options:

    Help options:

      -h, --help            Show basic help text.
      --help-showall        Show full list of arguments.

    Basic analysis options:

      -t {bacteria,fungi}, --taxon {bacteria,fungi}
                            Taxonomic classification of input sequence. (default: bacteria)
      -c CPUS, --cpus CPUS  How many CPUs to use in parallel. (default for this machine: 8)
      --databases PATH      Root directory of the databases (default:
                            /hpc/group/bio1/ewhisnant/miniconda3/envs/antismash/lib/python3.10/site-
                            packages/antismash/databases).

    Output options:

      --output-dir OUTPUT_DIR
                            Directory to write results to.
      --output-basename OUTPUT_BASENAME
                            Base filename to use for output files within the output directory.
      --html-title HTML_TITLE
                            Custom title for the HTML output page (default is input filename).
      --html-description HTML_DESCRIPTION
                            Custom description to add to the output.
      --html-start-compact  Use compact view by default for overview page.
      --html-ncbi-context, --no-html-ncbi-context
                            Show NCBI genomic context links for genes (default: False). (default:
                            False)

    Additional analysis:

      --fullhmmer           Run a whole-genome HMMer analysis using Pfam profiles.
      --cassis              Motif based prediction of SM gene cluster regions.
      --clusterhmmer        Run a cluster-limited HMMer analysis using Pfam profiles.
      --tigrfam             Annotate clusters using TIGRFam profiles.
      --asf                 Run active site finder analysis.
      --cc-mibig            Run a comparison against the MIBiG dataset
      --cb-general          Compare identified clusters against a database of antiSMASH-predicted
                            clusters.
      --cb-subclusters      Compare identified clusters against known subclusters responsible for
                            synthesising precursors.
      --cb-knownclusters    Compare identified clusters against known gene clusters from the MIBiG
                            database.
      --pfam2go             Run Pfam to Gene Ontology mapping module.
      --rre                 Run RREFinder precision mode on all RiPP gene clusters.
      --smcog-trees         Generate phylogenetic trees of sec. met. cluster orthologous groups.
      --tfbs                Run TFBS finder on all gene clusters.
      --tta-threshold TTA_THRESHOLD
                            Lowest GC content to annotate TTA codons at (default: 0.65).

    Advanced options:

      --reuse-results PATH  Use the previous results from the specified json datafile
      --limit LIMIT         Only process the largest <limit> records (default: -1). -1 to disable
      --abort-on-invalid-records, --no-abort-on-invalid-records
                            Abort runs when encountering invalid records instead of skipping them
                            (default: True)
      --minlength MINLENGTH
                            Only process sequences larger than <minlength> (default: 1000).
      --start START         Start analysis at nucleotide specified.
      --end END             End analysis at nucleotide specified
      --write-config-file PATH
                            Write a config file to the supplied path
      --without-fimo        Run without FIMO (lowers accuracy of RiPP precursor predictions)
      --executable-paths EXECUTABLE=PATH,EXECUTABLE2=PATH2,...
                            A comma separated list of executable name->path pairs to override any on
                            the system path.E.g. diamond=/alternate/path/to/diamond,hmmpfam2=hmm2pfam
      --allow-long-headers, --no-allow-long-headers
                            Should sequence identifiers longer than 16 characters be allowed (default:
                            True)

    Debugging & Logging options:

      -v, --verbose         Print verbose status information to stderr.
      -d, --debug           Print debugging information to stderr.
      --logfile PATH        Also write logging output to a file.
      --list-plugins        List all available sec. met. detection modules.
      --check-prereqs, --prepare-data
                            Check if all prerequisites are met, preparing data files where possible.
      --limit-to-record RECORD_ID
                            Limit analysis to the record with ID record_id
      -V, --version         Display the version number and exit.
      --profiling           Generate a profiling report, disables multiprocess python.
      --skip-sanitisation   Skip input record sanitisation. Use with care.
      --skip-zip-file       Do not create a zip of the output

    Debugging options for cluster-specific analyses:

      --minimal             Only run core detection modules, no analysis modules unless explicitly
                            enabled
      --enable-genefunctions
                            Enable Gene function annotations (default: enabled, unless --minimal is
                            specified)
      --enable-lanthipeptides
                            Enable Lanthipeptides (default: enabled, unless --minimal is specified)
      --enable-lassopeptides
                            Enable lassopeptide precursor prediction (default: enabled, unless
                            --minimal is specified)
      --enable-nrps-pks     Enable NRPS/PKS analysis (default: enabled, unless --minimal is specified)
      --enable-sactipeptides
                            Enable sactipeptide detection (default: enabled, unless --minimal is
                            specified)
      --enable-t2pks        Enable type II PKS analysis (default: enabled, unless --minimal is
                            specified)
      --enable-thiopeptides
                            Enable Thiopeptides (default: enabled, unless --minimal is specified)
      --enable-tta          Enable TTA detection (default: enabled, unless --minimal is specified)
      --enable-html         Enable HTML output (default: enabled, unless --minimal is specified)

    Full HMMer options:

      --fullhmmer-pfamdb-version FULLHMMER_PFAMDB_VERSION
                            PFAM database version number (e.g. 27.0) (default: latest).

    Sideload options:

      --sideload JSON       Sideload annotations from the JSON file in the given paths. Multiple files
                            can be provided, separated by a comma.
      --sideload-simple ACCESSION:START-END
                            Sideload a single subregion in record ACCESSION from START to END.
                            Positions are expected to be 0-indexed, with START inclusive and END
                            exclusive.
      --sideload-by-cds LOCUS1,LOCUS2,...
                            Sideload a subregion around each CDS with the given locus tags.
      --sideload-size-by-cds NUCLEOTIDES
                            Additional padding, in nucleotides, of subregions to create for sideloaded
                            subregions by CDS. (default: 20000)

    HMM detection options:

      --hmmdetection-strictness {strict,relaxed,loose}
                            Defines which level of strictness to use for HMM-based cluster detection,
                            (default: relaxed).
      --hmmdetection-fungal-cutoff-multiplier HMMDETECTION_FUNGAL_CUTOFF_MULTIPLIER
                            Sets the multiplier for rule cutoffs in fungal inputs (default: 1.0).
      --hmmdetection-fungal-neighbourhood-multiplier HMMDETECTION_FUNGAL_NEIGHBOURHOOD_MULTIPLIER
                            Sets the multiplier for rule neighbourhoods in fungal inputs (default:
                            1.5).
      --hmmdetection-limit-to-rule-names RULE1[,RULE2,...]
                            Restrict detection to the named rules (default: no limits).
      --hmmdetection-limit-to-rule-categories CATEGORY1[,CATEGORY2,...]
                            Restrict detection to the given rules (default: no limits).

    Cluster HMMer options:

      --clusterhmmer-pfamdb-version CLUSTERHMMER_PFAMDB_VERSION
                            PFAM database version number (e.g. 27.0) (default: latest).

    TIGRFam options:

    ClusterCompare options:

      --cc-custom-dbs FILE1,FILE2,...
                            A comma separated list of database config files to run with

    ClusterBlast options:

      --cb-nclusters count  Number of clusters from ClusterBlast to display, cannot be greater than 50.
                            (default: 10)
      --cb-min-homology-scale LIMIT
                            A minimum scaling factor for the query BGC in ClusterBlast results. Valid
                            range: 0.0 - 1.0. Warning: some homologous genes may no longer be visible!
                            (default: 0.0)

    NRPS/PKS options:

    RREfinder options:

      --rre-cutoff RRE_CUTOFF
                            Bitscore cutoff for RRE pHMM detection (default: 25.0).
      --rre-minlength RRE_MIN_LENGTH
                            Minimum amino acid length of RRE domains (default: 50).

    Transcription Factor Binding Site options:

      --tfbs-pvalue TFBS_PVALUE
                            P-value for TFBS threshold setting (default: 1e-05).
      --tfbs-range TFBS_RANGE
                            The allowable overlap with gene start positions for TFBSs in coding regions
                            (default: 50).

    Gene finding options (ignored when ORFs are annotated):

      --genefinding-tool {glimmerhmm,prodigal,prodigal-m,none,error}
                            Specify algorithm used for gene finding: GlimmerHMM, Prodigal, Prodigal
                            Metagenomic/Anonymous mode, or none. The 'error' option will raise an error
                            if genefinding is attempted. The 'none' option will not run genefinding.
                            (default: error).
      --genefinding-gff3 GFF3_FILE
                            Specify GFF3 file to extract features from.

  ```

10. Install deeploc

Deeploc explanation:

"DeepLoc 2.1 predicts the subcellular localization(s) and the associated membrane type(s) of eukaryotic proteins. DeepLoc 2.1 is a multi-label predictor, which means that is able to predict one or more localizations for any given protein. It can differentiate between 10 different localizations and 4 different membrane associations. The localization labels are defined by the 10 classes: Nucleus, Cytoplasm, Extracellular, Mitochondrion, Cell membrane, Endoplasmic reticulum, Chloroplast, Golgi apparatus, Lysosome/Vacuole and Peroxisome. The membrane association of a protein is defined by the flw. four labels: Peripheral, Transmembrane, Lipid anchor and Soluble (non-membrane). Additionally, DeepLoc 2.1 can predict the presence of the sorting signal(s) that had an influence on the prediction of the subcellular localization(s)."

  a. Go to the [DeepLoc website](https://services.healthtech.dtu.dk/services/DeepLoc-2.1/), click on `Downloads` and click Version 2.1 `All`.

    * You can also look at the [DeepLoc GitHub repo](https://github.com/TviNet/DeepLoc-2.0/tree/main)

  b. Enter your information and agree to the licence agreement. DeepLoc URL installation will be EMAILED to the email address provided.

  c. Open the email and follow the link provided.

  d. Create a conda env `deeploc`

 ```{}
  conda create -n deeploc20

  
  conda activate deeploc20
 ```
  e. Go back the email and link provided. Click on the .ALL.tar.gz and copy the link address

 ```{}
  # Install deeploc from the link provided:
  wget https://services.healthtech.dtu.dk/download/56458e66-5d5d-4583-9002-8378086e1dc2/deeploc-2.1.All.tar.gz

  # Unpack the tar ball:

  tar -xvzf deeploc-2.1.All.tar.gz
 ```

  f. Move into the deeploc directory. Create the yaml file with the dependencies:

 ```{}
 # If working in vscode
 code environment.yml

 # OR

 # In the terminal:
 nano environment.yml
 ```
Create the yaml file from [environment.yml -- deeploc](https://github.com/TviNet/DeepLoc-2.0/blob/main/environment.yml)

 ```{}
  name: deeploc20
  dependencies:
    - python=3.8
    - pip
    - numpy
    - matplotlib
    - pandas<2.0.0
    - scipy
    - setuptools
    - scikit-learn
    - pip:
      - Bio
      - torch
      - onnxruntime>=1.7.0
      - fair-esm==0.4.0
      - transformers
      - pytorch_lightning
      - sentencepiece 
      - pickle5
      - h5py
 ```

  g. Update the environment dependencies:

  ```{}
  conda env update --file environment.yml

  ```

  f. Deactivate (`conda deactivate`) and reactivate (`conda activate deeploc20`)




 
