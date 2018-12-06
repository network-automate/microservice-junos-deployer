# Dockerfile to build deployer microservice using current repository
# Docker Hub address is jnprautomate/deployer

# Use same image as from CI process
FROM python:2.7.15-slim-jessie

# Generic Tags
MAINTAINER Thomas Grimonet <tgrimonet@juniper.net>
LABEL com.company.key="Juniper Networks"

# Environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Provisioning
ADD . /
WORKDIR /

# Baseline configuration

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -qq -y git vim sshpass openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/local/bin/python /usr/bin/python

# Microservice specific configuration specific configuration

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    ansible-galaxy install -r requirements.ansible.yaml


ENTRYPOINT sh /microservice-deploy-junos.sh