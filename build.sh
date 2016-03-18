#! /bin/bash


# grafana git tag to build
VERSION=0.0.1.32

# docker image to build
IMAGE_NAME=heziegl/rpi-linknx:$VERSION

# build grafana runtime
sudo docker build --build-arg VERSION=$VERSION -t $IMAGE_NAME .

