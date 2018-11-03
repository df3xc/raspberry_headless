#!/bin/sh
echo '-------------------------------------------------------------------'
echo ' Remove packages from BeagleBone not needed for headless operation'
echo '-------------------------------------------------------------------'
apt-get remove connman
apt-get remove xserver*
apt-get autoremove
apt-get remove x11*
apt-get remove libqt*
apt-get autoremove
apt-get remove xfo*
apt-get autoremove
apt-get remove xorg*
apt-get remove ruby*
apt-get autoremove
echo ' ------------- done --------------'
