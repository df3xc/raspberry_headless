#!/bin/sh

if [ -z "$1" ]
then
      echo "   "
      echo "   "
      echo "missing argument : static|iphone|ics"
      echo "you need an addition preceeding dot: . ./select.sh"
      echo "   "
      exit 1
fi


checkError() 
{
if [ $? -eq 0 ]; then
       echo OK
else
       echo FAIL
fi
}

echo " select interfaces : " $1

if [ $1 = 'static' ]
then   
   ifdown wlan0 || true
   ifconfig wlan0 down || true
   cp interfaces.static /etc/network/interfaces
   echo "nameserver 192.168.2.1" >/etc/resolv.conf
#   checkError
   wait 2
   echo "WLAN0 UP"
   ifup wlan0 || true
   wait 2
#   checkError
   route add default gw 192.168.2.1 wlan0 || true
   echo " done " $1
fi

if [ $1 = 'ics' ]
then
   cp interfaces.ics /etc/network/interfaces
   echo "nameserver 192.168.137.1" >/etc/resolv.conf
#   checkError 
   ifdown wlan0 || true
   ifconfig wlan0 down || true
   wait 2
#   checkError
   ifup wlan0 || true
   wait 2
   route add default gw 192.168.137.1 wlan0 || true
   echo " done " $1
fi


if [ $1 = 'iphone' ]
then
   cp interfaces.iphone /etc/network/interfaces
   echo "nameserver 172.20.10.1" >/etc/resolv.conf
   ifdown wlan0 || true
   ifconfig wlan0 down || true
   checkError
   wait 2
   ifup wlan0 || true
   checkError
   wait 2
   echo " adding route "
   route add default gw 172.20.10.1 wlan0 || true 
   echo " done " $1
fi

ifconfig | grep 'inet '
