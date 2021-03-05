#!/bin/bash

# デバッグを開始する
# set -x
echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m データベース インストール           \e[m'
echo -e $'\e[1;31m ================================= \e[m'
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum -y install postgresql13-server

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m インストール 確認                  \e[m'
echo -e $'\e[1;31m ================================= \e[m'
ls /usr/pgsql-13
id postgres

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m データベース設定                    \e[m'
echo -e $'\e[1;31m ================================= \e[m'
su - postgres -c '/usr/pgsql-13/bin/initdb -E UTF8 --locale=C -A scram-sha-256 -W'
ls /var/lib/pgsql/13/data

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m データベース起動                   \e[m'
echo -e $'\e[1;31m ================================= \e[m'
systemctl start postgresql-13.service
systemctl enable postgresql-13.service

echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m スーパーユーザの環境変数設定         \e[m'
echo -e $'\e[1;31m ================================= \e[m'


echo -e $'\e[1;31m ================================= \e[m'
echo -e $'\e[1;31m ホストOSから仮想マシンのDBへpgAdminで接続               \e[m'
echo -e $'\e[1;31m ================================= \e[m'
# vi /var/lib/pgsql/13/data/postgresql.conf
# listen_addresses = '*'     # what IP address(es) to listen on;
#                            # comma-separated list of addresses;
#                            # defaults to 'localhost'; use '*' for all
#                            # (change requires restart)
# port = 5432                # (change requires restart)

# vi /var/lib/pgsql/13/data/pg_hba.conf
# IPv4 local connections:
# host    all             all             all                     trust

set +x