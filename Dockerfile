FROM ubuntu:20.04
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update; apt upgrade -y; apt-get install -y --no-install-recommends \
        net-tools \
	iputils-ping \
	neofetch \
	groff \
	tree \
	ubuntu-server \
	openssh-server \
	build-essential \
	sshpass \
	aria2 \
	ffmpeg \
	plowshare \
	python3 \
	python3-setuptools \
	python3-pip \
	zip \
	unzip \
	unrar \
	p7zip-full \
	wget \
	nano \
	detox \
	tmux \
  curl \
  htop \
	file \
  net-tools \
	sudo \
	software-properties-common \
	git \
	docker.io \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* \
	&& plowmod --install \
	&& pip3 install tidal-dl \
	&& pip3 install gdown \
	&& pip3 install youtube-dl \
	&& pip3 install llvd \
	&& pip3 install awscli \
	&& pip3 install spotdl

#Installing minio client
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && chmod +x /usr/local/bin/mc && mc --autocompletion

#Installing gupload
RUN curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s

#RUN yes | unminimize

#Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get update && sudo apt install nodejs -y

#Install Railway CLI

RUN sh -c "$(curl -sSL https://raw.githubusercontent.com/railwayapp/cli/master/install.sh)"

#Installing aws cli
#RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install

#Installing heroku cli
RUN curl https://cli-assets.heroku.com/install.sh | sh

#Installing Speedtest-CLI
RUN curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
RUN sudo apt-get -y install speedtest

##Installing TTyD
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd

## Installing Simple-Torrent
RUN cd /tmp && wget https://github.com/boypt/simple-torrent/releases/download/1.3.4/cloud-torrent_linux_amd64.gz && 7z x cloud-torrent_linux_amd64.gz && chmod +x cloud-torrent_linux_amd64 \
    && mv cloud-torrent_linux_amd64 cloud-torrent && mv cloud-torrent /usr/local/bin/

#Installing Linkedin Learning Downloader
RUN pip3 install llvd

#Installing http-server
RUN npm install -g http-server

