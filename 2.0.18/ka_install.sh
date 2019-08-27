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
yum -y install psmisc
systemctl daemon-reload
systemctl enable keepalived
sudo useradd -g users -M keepalived_script

cat <<EOF > /etc/keepalived/keepalived.conf
! Configuration File for keepalived

global_defs {
    router_id 51
}

vrrp_script chk_haproxy {
    script "killall -0 haproxy"
    interval 2
    weight 2
}

vrrp_instance VI_1 {
    interface eth0
    state MASTER
    virtual_router_id 51
    priority 100 # 101 on master, 100 on backup

    authentication {
        auth_type PASS
        auth_pass 0000
    }

    unicast_src_ip 192.168.0.1    # IP address of local interface
    unicast_peer {                # IP address of peer interface
        192.168.0.2
    }

    virtual_ipaddress {
        192.168.0.3
    }

    track_script {
        chk_haproxy
    }
}
EOF
