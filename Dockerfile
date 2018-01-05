FROM ubuntu:16.04

RUN apt update
RUN apt-get update
RUN apt-get install -y \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    curl \
    xz-utils

CMD = ['tox']
