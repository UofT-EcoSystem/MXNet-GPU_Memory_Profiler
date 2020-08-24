FROM nvidia/cuda:10.0-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN chmod ugo+rwXt /tmp

ENV CUDNN_VERSION 7.6.3.30-1
ENV CUDNN_MAJOR_VERSION 7
ENV CUDNN_MINOR_VERSION 6

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libcudnn7=${CUDNN_VERSION}+cuda10.0 \
        libcudnn7-dev=${CUDNN_VERSION}+cuda10.0 \
        vim curl build-essential python3-dev \
        libatlas-base-dev \
        libopenblas-dev \
        libopencv-dev \
        libjemalloc-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && rm -f get-pip.py
    # Cannot uninstall `curl` because it is needed by MKL-DNN.

RUN pip3 install pylint==2.4.4 cpplint==1.4.4 \
                 numpy==1.17.4 cmake==3.12.0

RUN ln -s /usr/bin/python3 /usr/bin/python
