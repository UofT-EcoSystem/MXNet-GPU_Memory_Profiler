MXNET_ROOT=$(cd $(dirname $BASH_SOURCE[0])/mxnet && pwd)

export LD_LIBRARY_PATH=${MXNET_ROOT}/cmake_build
export PYTHONPATH=${MXNET_ROOT}/python/build/lib
