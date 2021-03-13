#!/bin/sh
apt-get update
echo '--------------------------------------'
echo ' install TCPDUMP'
echo '--------------------------------------'
apt-get install -y tcpdump
echo '--------------------------------------'
apt-get install -y iperf3
echo "--------------------------------------"
echo ' install VLAN '
echo "--------------------------------------"
apt-get install -y vlan
echo "--------------------------------------"
echo '  install I2C TOOLS '
echo "--------------------------------------"
apt install -y i2c-tools
echo "--------------------------------------"
echo '  install MONO '
echo "--------------------------------------"
#apt-get install -y mono-runtime
apt-get install -y mono-complete
echo "--------------------------------------"
echo ' install SAMBA '
echo "--------------------------------------"
apt-get install -y samba samba-common-bin
echo "--------------------------------------"
echo ' install APACHE '
echo "--------------------------------------"
apt-get install -y apache2
echo "--------------------------------------"
echo ' install PHP '
echo "--------------------------------------"
#apt-get install -y php7.0 php7.0-gd php7.0-dev php-pear
apt-get install -y php

