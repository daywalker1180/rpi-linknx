#! /bin/bash


# grafana git tag to build
VERSION=0.0.1.38
DOCKERHUBUSER=daywalker1180

# docker image to build
IMAGE_NAME=$DOCKERHUBUSER/rpi-linknx:$VERSION

# build runtime
sudo docker build --build-arg VERSION=$VERSION -t $IMAGE_NAME .

# push to docker hub
sudo docker push $IMAGE_NAME

