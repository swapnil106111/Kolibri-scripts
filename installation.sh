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

echo "***git installation...***"
sudo apt-get install git

echo "*** installation***"
sudo apt-get install nginx


echo "***Kolibri-scrips is cloning***"
git clone https://github.com/swapnil106111/Kolibri-scripts.git


cd Kolibri-scripts

echo "***Chrome browser installation***"
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


echo "***Installing teamviewer***"
sudo wget  https://download.teamviewer.com/download/teamviewer_i386.deb

sudo dpkg -i teamviewer*.deb

echo "***setting up nginx...***"
sudo bash script_2.sh $1

echo "***apt-get update is running...***"
sudo apt-get update

echo "***setting kolibri hotspot...***"
sudo bash setup_hotspot.sh

echo "***Done...***"
