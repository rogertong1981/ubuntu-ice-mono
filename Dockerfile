FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:maxmind/ppa && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 && \
    apt-add-repository "deb http://zeroc.com/download/apt/ubuntu$(lsb_release -rs) stable main" && \
    apt-get update && apt-get install -y zeroc-ice-all-runtime mono-complete && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
