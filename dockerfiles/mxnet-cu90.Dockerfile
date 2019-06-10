FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cuda-samples-9-0 \
        curl wget \
        vim git build-essential python3 \
        libopencv-dev \
        libatlas-base-dev \
        libopenblas-dev \
        libjemalloc-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && rm -f get-pip.py

RUN pip3 install pylint cpplint numpy cmake
