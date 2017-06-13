#! /bin/sh
if ping -q -c 1 -W 1 google.com >/dev/null; then
  notify-send "You are connected to Internet, Syncing begins.Stay connected."
  sudo /home/kolibri/kolibri-v0.4.0-beta10.pex manage syncdata -- nalanda
  sleep 10
  zenity --info --text="Sync Complete! Thank you."
else
   zenity --error --text="Please connect to internet and try again!"
fi
