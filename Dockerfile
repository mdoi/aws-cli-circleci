FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  ca-certificates \
  apt-transport-https \
  gnupg-agent \
  software-properties-common \
  tar \
  unzip \
  curl \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*
