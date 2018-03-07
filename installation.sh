#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or use sudo" 
   exit 1
fi

if [ "$#" -ne 1 ]
then
  echo "You need to pass the logged in username."
  exit 1
fi

echo "***apt-get update is running...***"
sudo apt-get update

echo "***python-pip installation...***"
sudo apt-get install python-pip


echo "*** installation***"
sudo apt-get install nginx


echo "***Chrome browser installation***"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update

sudo apt-get install google-chrome-stable

echo "***Installing teamviewer***"
sudo wget  https://download.teamviewer.com/download/teamviewer_i386.deb

sudo dpkg -i teamviewer*.deb

sudo apt update && sudo apt -f install

echo "***setting up nginx...***"
sudo bash script_2.sh $1

echo "***apt-get update is running...***"
sudo apt-get update

echo "***setting kolibri hotspot...***"
sudo bash setup_hotspot.sh

echo "***Done...***"
