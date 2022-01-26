FROM python:3.10.2-bullseye

# Provide newer git for newinstall and eupspkg
#
RUN apt-get update -y && apt-get install -y git python3-pip
RUN pip3 install ltd-conveyor=0.8.1

COPY rootfs /

