FROM centos:latest 

# Provide newer git for newinstall and eupspkg
#
RUN yum install -y git python3-pip
RUN curl -O https://raw.githubusercontent.com/lsst/pipelines_lsst_io/master/requirements.txt && \
    pip3 install -r requirements.txt
RUN pip3 install ltd-conveyor==0.6.1

COPY rootfs /

