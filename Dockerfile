FROM ubuntu:20.04
USER root
COPY config/sources.list /etc/apt/sources.list
ADD scripts /tmp/scripts
RUN cd /tmp/scripts && sh install.sh