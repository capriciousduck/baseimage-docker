FROM ubuntu:24.04
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root

RUN apt-get update; apt upgrade -y; apt-get install -y --no-install-recommends \
        fuse \
	bash-completion \
	tar \
	build-essential \
	net-tools \
	iputils-ping \
	neofetch \
	groff \
	tree \
	openssh-server \
	sshpass \
	ffmpeg \
	python3 \
	python3-setuptools \
	python3-pip \
	zip \
	unzip \
	unrar \
	p7zip-full \
	wget \
	curl \
	nano \
	detox \
	tmux \
        htop \
	file \
	sudo \
	software-properties-common \
	git \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* \
	&& pip3 install gdown \
	&& pip3 install yt-dlp

# Install Latest RClone
RUN curl https://rclone.org/install.sh | sudo bash

#Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get update && sudo apt install nodejs -y && rm -rf nodesource_setup.sh

#Installing Speedtest-CLI
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash \
    && sudo apt-get install speedtest -y
	
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -O /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd

### Installing Exatorrent
# RUN wget https://github.com/varbhat/exatorrent/releases/download/v0.1.1/exatorrent-linux-amd64 -O /usr/local/bin/exatorrent && chmod +x /usr/local/bin/exatorrent
COPY exatorrent /usr/local/bin/exatorrent
RUN chmod +x /usr/local/bin/exatorrent

RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && chmod +x /usr/local/bin/cloudflared

# Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh
