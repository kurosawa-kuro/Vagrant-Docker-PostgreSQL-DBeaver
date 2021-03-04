#!/bin/bash

# デバッグを開始する
# set -x

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m update                            \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo yum update -y
sudo yum upgrade -y

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m 既存のdockerをアンインストール      \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker インストール                \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker起動設定           \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo systemctl start docker
sudo systemctl enable docker

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker-compose インストール        \e[m'
echo -e $'\e[1;31m ================================= \e[m'
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo usermod -aG docker $USER

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker確認          \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker --version

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m docker-compose -v確認             \e[m'
echo -e $'\e[1;31m ================================= \e[m'
docker-compose -v