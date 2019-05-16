FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        vim g++ make cmake \
        wget pkg-config \
        libopencv-dev \
        libopenblas-dev \
        libjemalloc-dev \
        python3-dev \
        python3-setuptools \
        python3-pip \
        python3-six \
        python3-numpy && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
