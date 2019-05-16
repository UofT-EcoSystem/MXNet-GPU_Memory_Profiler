#!/bin/bash

set -e

for container in $(docker ps -a --filter ancestor=${MXNET_IMAGE_NAME} \
                                --format "{{.Names}}")
do
	docker stop ${container} || true && \
	docker rm   ${container} || true	
done
docker rmi ${MXNET_IMAGE_NAME} || true

# ==============================================================================

docker build -f ${MXNET_IMAGE_NAME}.Dockerfile \
	     -t ${MXNET_IMAGE_NAME} .
