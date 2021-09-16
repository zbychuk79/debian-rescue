#!/bin/bash
echo "rescue" > /etc/hostname
echo "Ustaw hasło dla użytkownika 'root':"
passwd

cat > /root/install.sh << EOF
dpkg-reconfigure tzdata
echo "deb http://security.debian.org/ stable/updates main" >> /etc/apt/sources.list.d/security.list
apt update
apt upgrade -y
apt install tasksel dialog -y
tasksel install standard
apt install mc git openssh-client wget sudo net-tools curl aptitude zstd -y
apt install unzip gnupg links debtags python3-pip debootstick debootstrap git -y
apt install restic rsync fsarchiver dar asciinema -y
apt clean

cd /root
git clone https://github.com/zbychuk79/debian-rescue.git
cd debian-rescue
mv scripts/restic-script /usr/local/bin
mv scripts/sysupdate /usr/local/bin
mv scripts/rescue /usr/local/bin
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
chmod +x *

rm -rf ~/.cache
rm ~/install.sh
EOF
chmod +x /root/install.sh
rm /setup.sh
