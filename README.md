# [Keepalived](https://www.keepalived.org/ "Keepalived Homepage") Install Script

Version 0.0.1

This is a simple installation script for different versions of Keepalived. Initially created for yum based linux distros and tested for CentOS 7.

## Current versions

#### CentOS 7
- 2.0.18: https://raw.githubusercontent.com/ozkuran/keepalived-installation/master/2.0.18/ka_install.sh

## Installation procedure

#### 1. Download the script:
```
sudo wget https://raw.githubusercontent.com/ozkuran/keepalived-installation/master/[VERSION_TO_INSTALL]/ka_install.sh
```
#### 2. Make the script executable
```
sudo chmod +x ka_install.sh
```
#### 3. Execute the script:
```
sudo ./ka_install.sh
```

## Post-Installation steps

#### 1. Update configuration file 
Load keepalived.cfg file.
```
sudo nano /usr/local/etc/keepalived/keepalived.conf
```
Save and quit document. Then start Keepalived service.

```
    sudo systemctl start keepalived
```

Check status of Keepalived.

```
    sudo systemctl status keepalived
```
