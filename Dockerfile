FROM jenkins:latest

USER root
RUN apt-get update && apt-get -y dist-upgrade && \
apt-get --no-install-recommends -y install sudo libapparmor1 libsystemd-journal0 python-pip && \
echo "jenkins ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools requests 

ENV DOCKER_GID_ON_HOST ""
COPY jenkins.sh /usr/local/bin/jenkins.sh

RUN cd /tmp && git clone https://github.com/mjdev/docker-flow && cd docker-flow && python setup.py install


USER jenkins