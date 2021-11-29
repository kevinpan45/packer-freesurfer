FROM ubuntu:20.04
USER root
ADD scripts /tmp/scripts
RUN cd /tmp/scripts && sh install.sh