#!/bin/bash
yum -y update
yum -y install nano

sudo yum -y install gcc kernel-headers openssl-devel autoconf automake
wget https://github.com/acassen/keepalived/archive/v2.0.18.tar.gz
tar -zxvf v2.0.18.tar.gz
cd keepalived-2.0.18/
./build_setup
./configure
make
sudo make install
systemctl daemon-reload
systemctl enable keepalived
