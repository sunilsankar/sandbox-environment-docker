#!/bin/bash
echo $FULLNAME
dnf install epel-release -y
dnf clean all
dnf update -y
dnf install sshpass python python3-pip gcc git cmake make gcc vim curl libnsl -y
echo "
[user]
    name = $FULLNAME
    email = $EMAILID
" > /home/vagrant/.gitconfig
chown vagrant:vagrant /home/vagrant/.gitconfig
echo "$PUBLICKEY" >> /home/vagrant/.ssh/authorized_keys
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
CHECK_SYSTEMCTL=$(systemctl --version |grep systemd |awk '{print $2}')
cp /vagrant/tasks/files/motd.sh /etc/profile.d/
\cp /vagrant/tasks/files/login.py /usr/local/lib/python3.9/site-packages/molecule/command/login.py
if [ "$CHECK_SYSTEMCTL" -gt "248" ]; then
\cp /vagrant/tasks/files/grub /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.
else 
echo ""
fi 
