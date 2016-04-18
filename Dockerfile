FROM jenkins:latest

USER root
RUN apt-get update && \
apt-get --no-install-recommends -y install sudo libapparmor1 libsystemd-journal0 && \
echo "jenkins ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
rm -rf /var/lib/apt/lists/*

ENV DOCKER_GID_ON_HOST ""
COPY jenkins.sh /usr/local/bin/jenkins.sh

USER jenkins