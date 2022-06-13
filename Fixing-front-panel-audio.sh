#!/bin/bash
fL=0
fLp=0
Aurl="/usr/share/alsa-card-profile/mixer/paths/analog-output-lineout.conf"
Burl="/usr/share/alsa-card-profile/mixer/paths/analog-output-headphones.conf"
fL=$(grep -n "Jack Headphone" $Aurl | awk -F ":" '{print $1}')
echo "$fL"
echo "$fLp"
fLp=$(($fL + 2))
sudo sed -i "$fL,$fLp s/= no/= yes/" $Aurl

if ! grep -qPzo "Element Line Out]\s+switch = mute\s+volume = merge" $Aurl; then
    echo -e "[Element Line Out]\nswitch = mute\nvolume = merge" | sudo tee -a  $Aurl
fi

if ! grep -qPzo "Element Line Out]\s+switch = off\s+volume = off" $Burl; then
	echo -e "[Element Line Out]\nswitch = off\nvolume = off" | sudo tee -a $Burl
fi

fL=$(grep -n "Element Front" $Burl | awk -F ":" '{print $1}')
fLp=$(($fL + 2))
echo "$fL"
echo "$fLp"
sudo sed -i "$fL,$fLp s/switch = mute/switch = off/" $Burl
sudo sed -i "$fL,$fLp s/volume = zero/volume = off/" $Burl

amixer -c 1 set 'Auto-Mute Mode' Disabled
sudo alsactl store
echo -e "\033[0;31mNow you can reboot your pc to see effect"
