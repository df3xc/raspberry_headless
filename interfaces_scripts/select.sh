#!/bin/sh
echo " select interfaces : " $1

if [ -z "$1" ]
then
   echo " missing argument : static | ihone | ics"
   exit 1
fi

if [ $1 = 'static' ]
then
   ifconfig wlan0 down
   cp interfaces.static interfaces
   echo "nameserver 192.168.2.1" >/etc/resolv.conf
   ifup wlan0
   route add default gw 192.168.2.1 wlan0
   echo " done " $1
fi

if [ $1 = 'ics' ]
then
   ifconfig wlan0 down
   cp interfaces.ics interfaces
   echo "nameserver 192.168.137.1" >/etc/resolv.conf
   ifup wlan0
   route add default gw 192.168.137.1 wlan0
   echo " done " $1
fi

if [ $1 = 'iphone' ]
then
   ifconfig wlan0 down
   cp interfaces.iphone interfaces
   echo "nameserver 172.20.10.1" >/etc/resolv.conf
   ifup wlan0
   route add default gw 172.20.10.1 wlan0
   echo " done " $1
fi
