FROM ubuntu:18.04
RUN apt-get update; apt upgrade -y; apt-get install -y --no-install-recommends \
	groff \
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
	&& pip3 install speedtest-cli \
	&& pip3 install gdown \
	&& pip3 install youtube-dl \
	&& pip3 install llvd

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && chmod +x /usr/local/bin/mc
RUN curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s
RUN yes | unminimize

