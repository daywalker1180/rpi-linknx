#! /bin/bash


VERSION=0.0.1.32

sudo docker run -t -d --net=host -v $(pwd)/linknx_config:/linknx_config -v $(pwd)/linknx_persist:/linknx_persist -v $(pwd)/linknx_log:/linknx_log --name="linknx" heziegl/rpi-linknx:$VERSION

