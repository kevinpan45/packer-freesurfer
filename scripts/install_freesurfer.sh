#! /bin/bash

# From freesurfer wiki link https://surfer.nmr.mgh.harvard.edu/fswiki/rel6downloads

# Install system dependencies
apt-get -y install bc binutils libgomp1 perl psmisc sudo tar tcsh unzip uuid-dev vim-common libjpeg62-dev libgl-dev wget

# Download freesurfer package and decompression to path /usr/local/freesurfer
wget -q https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
tar -C /usr/local -xzf freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz

# Setup & Configuration
chmod a+x -R /usr/local/freesurfer