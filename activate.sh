MXNET_ROOT=$(cd $(dirname $BASH_SOURCE[0])/mxnet && pwd)

export LD_LIBRARY_PATH=${MXNET_ROOT}/lib
export PYTHONPATH=${MXNET_ROOT}/python/build/lib
