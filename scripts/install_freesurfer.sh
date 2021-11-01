#! /bin/bash

# From freesurfer wiki link https://surfer.nmr.mgh.harvard.edu/fswiki/rel6downloads

# Download freesurfer package and decompression to path /usr/local/freesurfer
wget https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
tar -C /usr/local -xzvf freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz

# Install system dependencies
apt-get -y install bc binutils libgomp1 perl psmisc sudo tar tcsh unzip uuid-dev vim-common libjpeg62-dev

# Setup & Configuration
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# Test installation
cp $FREESURFER_HOME/subjects/sample-001.mgz .
mri_convert sample-001.mgz sample-001.nii.gz