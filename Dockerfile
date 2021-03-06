FROM debian:wheezy

RUN apt-get update && \
	apt-get install -y sudo git vim wget procps curl automake libtool maven2 openjdk-6-jdk tomcat6 libvncserver-dev libpango1.0-dev libpng12-dev libcairo2-dev libssl-dev libx11-dev libxext-dev libxinerama-dev libxcursor-dev libxkbfile-dev libxv-dev libxi-dev libxdamage-dev libxrender-dev libxrandr-dev libasound2-dev libcups2-dev libpulse-dev libavutil-dev libavcodec-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev && \
	wget http://www.cmake.org/files/v2.8/cmake-2.8.11.2.tar.gz  && \
	tar zxvf cmake-2.8.11.2.tar.gz  && \
	cd cmake-2.8.11.2  && \
	./configure  && \
	make  && \
	make install   && \
	cd ../   && \
	rm -r -f cmake-2.8.11.2*  && \
	wget http://pub.freerdp.com/releases/freerdp-1.0.2.tar.gz  && \
	tar zxvf freerdp-1.0.2.tar.gz  && \
	cd freerdp-1.0.2  && \
	cmake .  && \
	make  && \
	make install  && \
	cd ../  && \
	rm -r -f freerdp-1.0.2*  && \
	wget https://red.libssh.org/attachments/download/121/libssh-0.6.5.tar.xz && \
	xz -d libssh-0.6.5.tar.xz  && \
	tar xvf libssh-0.6.5.tar  && \
	mkdir -p build/libssh && \
	cd build/libssh && \
	cmake  -DCMAKE_INSTALL_PREFIX=/usr/local/  ../../libssh-0.6.5 && \
	make install && \
	cd /root && \
	rm -r -f libssh-0.6.5* && \
	rm -r -f build && \
	rm -r -f /tmp/*
