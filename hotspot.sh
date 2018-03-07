INTERFACE_WLAN=$(iwconfig 2>&1 | grep "^wl" | sed -e 's/ .*//g' | tail -n 1)

# If we still haven't found any candidate interfaces, bail
if [[ ! $INTERFACE_WLAN ]]; then
	zenity --error --text="Please connect dongle and run hotspot.desktop"
	exit 1
else
	sudo service kolibri-hotspot start
fi
