#!/usr/bin/env bash
echo "You should have docker environment"
if sudo apt-get install x11-xserver-utils -y;then
	:
else
	echo "I can't install x11-xserver-utils,please manual install it!"
	exit 1
fi
xhost + &>/dev/null
docker rm -f docker-wine
docker pull xs020105/docker-wine
docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e AUDIO_GID=`getent group audio | cut -d: -f3` \
    -e VIDEO_GID=`getent group video | cut -d: -f3` \
    -e GID=`id -g` \
    -e UID=`id -u` \
	-e DISPLAY=unix$DISPLAY \
	-e GDK_SCALE \
	-e GDK_DPI_SCALE \
	--name docker-wine \
	--privileged=true xs020105/docker-wine /bin/bash
