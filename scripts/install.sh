#! /bin/bash

# Update apt repository
apt-get update
# Install freesurfer
apt-get install -y -qq bc binutils libgomp1 perl psmisc sudo tar tcsh uuid-dev vim-common libjpeg62-dev libgl-dev wget
tar -C /usr/local -xzf /tmp/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
chmod a+x -R /usr/local/freesurfer
rm /tmp/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz