#!/usr/bin/env bash

cd docker/1.3.1/base
docker build -t mxnet-base:1.3.0-gpu-py3 -f Dockerfile.gpu .
cd ../../../
python setup.py sdist
cp dist/sagemaker_mxnet_container-1.0.0.tar.gz docker/1.3.0/final
cd docker/1.3.0/final
wget https://files.pythonhosted.org/packages/e1/73/a6c15322ad509ebd156491a9e0342713a1e6d7cca6a94a110daf4f963db4/mxnet-1.3.0b20180906-py2.py3-none-win_amd64.whl
docker build -t mxnet-pre-gluonnlp-pandas-cu92:1.2.1-gpu-py3 --build-arg py_version=3 --build-arg framework_installable=mxnet-1.3.0b20180906-py2.py3-none-win_amd64.whl -f Dockerfile-gluonnlp-pandas.gpu .