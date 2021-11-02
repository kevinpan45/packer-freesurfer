#! /bin/bash

# Install python3.8 and pip3
add-apt-repository ppa:deadsnakes/ppa
apt-get install -y -qq python3.8 python3-pip
# Set python command default to python3.8
alias python=python3
# Test install
python --version
pip --version
