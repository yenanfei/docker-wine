FROM ubuntu:latest

COPY link.sh /root/
RUN apt-get update

RUN apt-get install wget git locales ttf-wqy-zenhei sudo -y
RUN apt-get clean && apt-get autoclean
ENV LC_CTYPE=zh_CN.UTF-8

WORKDIR /root
RUN git clone https://github.com/wszqkzqk/deepin-wine-ubuntu.git
COPY deepin.com.weixin.work.deb /root/deepin-wine-ubuntu/deepin.com.weixin.work.deb
COPY deepin.com.baidu.pan_5.7.3deepin0_i386.deb /root/deepin-wine-ubuntu/deepin.com.baidu.pan_5.7.3deepin0_i386.deb
RUN yes|bash /root/deepin-wine-ubuntu/install.sh
RUN /bin/bash /root/link.sh && rm -f /root/link.sh
RUN rm -rf /root/deepin-wine-ubuntu

RUN \
  locale-gen en_US.UTF-8 zh_CN.UTF-8 \
  zh_CN.GBK && \
  update-locale LANG=zh_CN.UTF-8
