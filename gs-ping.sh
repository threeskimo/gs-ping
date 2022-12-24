#!/bin/bash

#NOTE: You may have to enable advanced sharing options on Moonlight PC to allow ICMP ping responses

#CHANGE THESE:--------------------
moonlight_ip="192.168.1.185"
ping_threshold=25
#---------------------------------

RED='\033[0;31m' # Red
NC='\033[0m'     # No Color

while true; do
    # Ping the Moonlight Server IP address (config'd above) and extract the "time=" value
    time=$(ping -c 1 $moonlight_ip | grep "time=" | awk '{print $7}' | cut -d "=" -f 2)

    # Check if the "time=" value is above ping threshold (config'd above). Also, remove the decimals from $time since it messes with the comparison
    if (( ${time%.*} >= $ping_threshold )); then
        # Trigger sound and show ping in red if the "time=" value is above ping threshold
        printf "${RED}ping = ${time} ms\n${RED}"
        aplay -q ~/.local/share/Steam/resource/warning.wav
    else
        # If below ping theshold, just show ping data
        printf "${NC}ping = ${time} ms\n"
    fi

    # Sleep for 1 second before pinging again
    sleep 1
done
