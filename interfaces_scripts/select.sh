#!/bin/sh

gw=192.168.2.1

if [ -z "$1" ]
then
      echo "   "
      echo "   "
      echo "missing argument : static|iphone|ics"
      echo "you need an addition preceeding dot: . ./select.sh"
      echo "   "
      exit 1
fi


ifdown eth || true
ifdown wlan0 || true
wait 3

echo " select interfaces : " $1

if [ $1 = 'static' ]
then
   cp ./interfaces.static /etc/network/interfaces
   gw=192.168.2.1
   echo "nameserver ${gw}" >/etc/resolv.conf
   echo " done " $1
fi

if [ $1 = 'ics' ]
then
   cp ./interfaces.ics /etc/network/interfaces
   wait 2
   gw=192.168.137.1
   echo "nameserver ${gw}" >/etc/resolv.conf
   echo " done " $1
fi


if [ $1 = 'iphone' ]
then
   cp ./interfaces.iphone /etc/network/interfaces
   wait 2
   gw=172.20.10.1
   echo "nameserver ${gw}" >/etc/resolv.conf
   echo " done " $1
fi

ifup eth0 || true
ifup wlan0 || true

wait 2
#/etc/init.d/networking start
route add default gw $gw wlan0 || true
ifconfig
ping -c 3 www.opel.de
