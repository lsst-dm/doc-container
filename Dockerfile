FROM ubuntu:20.04

# Provide newer git for newinstall and eupspkg
#
RUN apt-get update -y && apt-get install -y git python3-pip
COPY rootfs /
RUN pip3 install -r /ltd/requirements.txt
RUN pip3 install sphinx-jinja==1.4.0 sphinx-prompt==1.5.0 sphinxcontrib-autoprogram==0.1.7 numpydoc==1.2 sphinx-automodapi==0.14.1

RUN pip3 install ltd-conveyor==0.8.1


