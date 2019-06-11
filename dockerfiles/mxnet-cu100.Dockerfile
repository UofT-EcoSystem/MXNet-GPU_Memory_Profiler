FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl vim build-essential python3-dev \
        libopencv-dev \
        libatlas-base-dev \
        libopenblas-dev \
        libjemalloc-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && rm -f get-pip.py && \
    apt-get purge curl -y && apt-get autoremove -y

RUN pip3 install pylint cpplint numpy cmake
