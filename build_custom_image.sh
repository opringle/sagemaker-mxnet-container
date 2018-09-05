#!/usr/bin/env bash

cd docker/1.2.1/base
docker build -t mxnet-base:1.2.1-gpu-py3 -f Dockerfile.gpu .
cd ../../../
python setup.py dist
cp dist/sagemaker_mxnet_container-1.0.0.tar.gz docker/1.2.1/final
docker/1.2.1/final
wget https://files.pythonhosted.org/packages/bb/53/5d33f71c5224a676112679458714eb728f6db8cae15f39fcdf27226f6e41/mxnet-1.2.1.post1-py2.py3-none-manylinux1_x86_64.whl
docker build -t mxnet-gluonnlp-pandas-cu92:1.2.1-gpu-py3 --build-arg py_version=3 --build-arg framework_installable=mxnet-1.2.1.post1-py2.py3-none-manylinux1_x86_64.whl -f Dockerfile-gluonnlp-pandas.gpu