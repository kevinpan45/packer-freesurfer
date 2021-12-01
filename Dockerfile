FROM ubuntu:20.04
USER root
ENV FREESURFER_HOME=/usr/local/freesurfer
COPY config/sources.list /etc/apt/sources.list
ADD scripts /tmp/scripts
RUN cd /tmp/scripts && sh install.sh
RUN rm -rf /tmp/scripts
ENTRYPOINT [ "source", "$FREESURFER_HOME/SetUpFreeSurfer.sh" ]