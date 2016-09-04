FROM ubuntu:latest

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 5E6DA83306132997 && \
    apt-add-repository "deb http://zeroc.com/download/apt/ubuntu`lsb_release -rs` stable main" && \
    apt-get update && \
    apt-get install -y curl git wget unzip mono-complete mono-xsp4 && \
    apt-get install zeroc-ice-all-runtime zeroc-ice-all-dev && \
    mozroots --import --sync && \
    cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*