#!/bin/bash

set -e

MXNET_CONTAINER_NAME=mxnet-gpu_memory_profiler

docker stop ${MXNET_CONTAINER_NAME} || true && \
docker rm   ${MXNET_CONTAINER_NAME} || true

# ==============================================================================

PROJECT_ROOT=$(cd $(dirname $0)/.. && pwd)

docker run -dit --runtime=nvidia --privileged \
           -v ${PROJECT_ROOT}:/mnt \
           --name ${MXNET_CONTAINER_NAME} ${MXNET_IMAGE_NAME}

docker exec -it -w /mnt/mxnet \
        ${MXNET_CONTAINER_NAME} make -j $(nproc) \
                USE_OPENCV=1 \
                USE_BLAS=openblas \
                USE_CUDA=1 \
                USE_CUDA_PATH=/usr/local/cuda \
                USE_CUDNN=1

docker exec -it -w /mnt/mxnet/python \
        ${MXNET_CONTAINER_NAME} python3 setup.py install
