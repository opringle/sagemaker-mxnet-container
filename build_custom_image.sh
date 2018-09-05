#!/usr/bin/env bash

cd docker/1.3.0/base
docker build -t mxnet-base:1.3.0-gpu-py3 -f Dockerfile.gpu .
cd ../../../
python setup.py sdist
cp dist/sagemaker_mxnet_container-1.0.0.tar.gz docker/1.3.0/final
cd docker/1.3.0/final
wget https://files.pythonhosted.org/packages/78/9e/35a2900125471b00a257a9301a2f197cfa82272a8a33fe914d7eb910921c/mxnet-1.3.0b20180831-py2.py3-none-manylinux1_x86_64.whl
docker build -t mxnet-pre-gluonnlp-pandas-cu92:1.3.0-gpu-py3 --build-arg py_version=3 --build-arg framework_installable=mxnet-1.3.0b20180831-py2.py3-none-manylinux1_x86_64.whl -f Dockerfile.gpu .