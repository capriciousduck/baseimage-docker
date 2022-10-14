FROM ubuntu:20.04
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
ENV WASABI_URL=https://s3.fr-1.wasabisys.com

WORKDIR /root

RUN apt-get update; apt upgrade -y; apt-get install -y --no-install-recommends \
	fuse \
	cmatrix \
	bash-completion \
	rclone \
	tar \
	make \
	cmake \
	gcc \
	gcc+ \
	net-tools \
	iputils-ping \
	neofetch \
	groff \
	tree \
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
	
# Some packages for fun!!

# https://www.makeuseof.com/fun-linux-command-line-programs/?utm_source=pocket_mylist

RUN apt-get update; apt-get install -y cowsay \
        sl \
	figlet \
	fortune \
	rig


#Installing minio client
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && chmod +x /usr/local/bin/mc && mc --autocompletion

# #Installing gupload
# RUN curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s

#RUN yes | unminimize

#Installing nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get update && sudo apt install nodejs -y && rm -rf nodesource_setup.sh

#Install Railway CLI
RUN sh -c "$(curl -sSL https://raw.githubusercontent.com/railwayapp/cli/master/install.sh)"

#Installing heroku cli
RUN curl https://cli-assets.heroku.com/install.sh | sh

#Installing Speedtest-CLI
RUN curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash \
     && sudo apt update \
     && sudo apt-get -y install speedtest




#RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.1/ttyd.x86_64 -O /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd


#Installing http-server
RUN npm install -g http-server

# Installing Fly.io CLI

RUN curl -L https://fly.io/install.sh | sh \
    && echo 'FLYCTL_INSTALL="/root/.fly"' >> /root/.bashrc \
    && echo 'PATH="$FLYCTL_INSTALL/bin:$PATH"' >> /root.bashrc

# RUN curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb" && dpkg -i gitlab-runner_amd64.deb && rm gitlab-runner_amd64.deb
