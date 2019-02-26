#!/usr/bin/env bash
if sudo apt-get install x11-xserver-utils -y;then
	:
else
	echo "I can't install x11-xserver-utils,please manual install it!"
	exit 1
fi
xhost + &>/dev/null
docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE --name docker-wine-$RANDOM --privileged=true xs020105/docker-wine /bin/bash