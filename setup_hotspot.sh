#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or use sudo" 
   exit 1
fi
apt-get -y purge dnsmasq hostapd kolibri-hotspot
apt-get install -y dnsmasq git
rm -rf kolibri-hotspot/
git clone https://github.com/swapnil106111/kolibri-hotspot.git
dpkg -i kolibri-hotspot/hostapd/hostapd*.deb
dpkg -i kolibri-hotspot/kolibri-hotspot*.deb
