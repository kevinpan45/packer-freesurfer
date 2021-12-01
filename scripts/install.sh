#! /bin/bash

apt-get update
apt-get install -y -qq net-tools lrzsz zip unzip cockpit software-properties-common
# Install python3.8 and pip3
add-apt-repository ppa:deadsnakes/ppa
apt-get install -y -qq python3.8 python3-pip
# Set python command default to python3.8
alias python=python3
# Install freesurfer
apt-get install -y -qq bc binutils libgomp1 perl psmisc sudo tar tcsh uuid-dev vim-common libjpeg62-dev libgl-dev wget
wget -q https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
tar -C /usr/local -xzf freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
chmod a+x -R /usr/local/freesurfer
rm freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz