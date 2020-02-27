#!/bin/bash -e

cd $(cd $(dirname $0) && pwd)

python3 train_imagenet.py --gpus 0,1 \
                          --batch-size 32 \
                          --image-shape 3,224,224 \
                          --num-epoch 1 \
                          --num-steps 100 \
                          --network resnet \
                          --num-layers 50 \
                          --data-train /dataset/imagenet1k_train_240.rec
