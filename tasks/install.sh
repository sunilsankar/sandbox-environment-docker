#!/bin/bash
dnf install epel-release -y
dnf clean all
dnf update -y
dnf install sshpass python python3-pip gcc git cmake make gcc vim curl libnsl -y
dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y
dnf install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant 
pip install --upgrade pip setuptools
pip install --ignore-installed PyYAML
pip install -r /vagrant/tasks/files/requirements.txt

cp /vagrant/tasks/files/motd.sh /etc/profile.d/
\cp /vagrant/tasks/files/login.py /usr/local/lib/python3.9/site-packages/molecule/command/login.py
