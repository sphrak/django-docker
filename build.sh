#!/bin/bash

# builds all the test containers

BUILD_CONTEXT=environments/
FILES=environments/py3*
PROJECT_NAME=django-docker

for f in $FILES
do
    echo "Building ${f##*/} -- Tagged as ${f##*/}:${TAG}"
    sudo docker build -t $PROJECT_NAME:${f##*/} -f $f $BUILD_CONTEXT
done
