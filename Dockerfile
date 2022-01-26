FROM python:3.10.2-bullseye

# Provide newer git for newinstall and eupspkg
#
RUN apt-get update -y && apt-get install -y git python3-pip
RUN curl -O https://raw.githubusercontent.com/lsst/pipelines_lsst_io/master/requirements.txt && \
    pip3 install -r requirements.txt

RUN pip3 install ltd-conveyor==0.8.1

COPY rootfs /

