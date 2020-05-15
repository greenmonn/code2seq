#!/usr/bin/env bash

docker run --name code2seq-exp --runtime=nvidia -v /home/coinse/Projects/greenmon/code2seq:/home/root/code2seq -it code2seq /bin/bash