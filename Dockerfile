ARG cuda_version=9.0
ARG cudnn_version=7
FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel

# Set up CUDA 9.0 dependent libraries
RUN apt-get update && apt-get install -y --allow-change-held-packages --allow-downgrades --no-install-recommends \
    libcudnn7=7.5.0.56-1+cuda9.0 \
    libcudnn7-dev=7.5.0.56-1+cuda9.0 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get -qq -y install git curl build-essential subversion perl wget unzip vim


RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3.5

RUN python3.5 -V
RUN apt-get install -y python3-pip
RUN python3.5 -m pip install --upgrade pip
RUN ln -s /usr/bin/python3.5 /usr/bin/python

COPY . /home/root/code2seq
WORKDIR /home/root/code2seq
