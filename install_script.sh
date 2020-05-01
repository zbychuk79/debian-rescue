#!/bin/bash
echo "Ustaw hasło dla użytkownika 'root':"
passwd
dpkg-reconfigure tzdata
echo "deb http://security.debian.org/ buster/updates main" >> /etc/apt/sources.list.d/security.list
apt update
apt upgrade -y
apt install tasksel dialog -y
tasksel install standard
apt install mc openssh-client wget sudo net-tools curl aptitude zstd -y
apt install unzip gnupg links debtags python3-pip debootstick debootstrap -y
apt install restic rsync fsarchiver dar git -y
apt clean
pip3 install telegram-send


cd /root
git clone https://github.com/zbychuk79/debian-rescue.git


mkdir -p /root/.config
cd /root/.config



cd /root
git clone https://github.com/zbychuk79/aptitude.git
mv aptitude/.aptitude .
#rm -rf aptitude


cd /usr/local/bin
chmod +x *
echo "rescue" > /etc/hostname
rm -rf ~/.cache
#rm /install_script.sh
