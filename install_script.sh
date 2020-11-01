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
apt install unzip gnupg links debtags python3-pip debootstick debootstrap git -y
apt install restic rsync fsarchiver dar -y
apt clean

cd /root
git clone https://github.com/zbychuk79/debian-rescue.git
cd debian-rescue
mv scripts/restic-script /usr/local/bin
mv scripts/sysupdate /usr/local/bin
cd ..
rm -rf debian-rescue

mkdir -p /root/.config
cd /root/.config
git clone https://github.com/zbychuk79/mc.git

cd /root
git clone https://github.com/zbychuk79/aptitude.git
mv aptitude/.aptitude .
rm -rf aptitude

cd /usr/local/bin
echo "rescue" > /etc/hostname
rm -rf ~/.cache
rm /install_script.sh
