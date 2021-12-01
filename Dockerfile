FROM ubuntu:20.04
USER root
ENV FREESURFER_HOME=/usr/local/freesurfer
COPY config/sources.list /etc/apt/sources.list
COPY freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz .
RUN apt-get update && \
    apt-get install -y -qq net-tools lrzsz zip unzip cockpit software-properties-common  && \
    apt-get install -y bc binutils libgomp1 perl psmisc sudo tar tcsh uuid-dev vim-common libjpeg62-dev libgl-dev wget && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y -qq python3.8 python3-pip && \
    alias python=python3 && \
    wget -q https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz  && \
    tar -C /usr/local -xzf freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz && \
    chmod a+x -R /usr/local/freesurfer  && \
    rm freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
COPY entrypoint.sh .
ENTRYPOINT [ "sh", "entrypoint.sh" ]