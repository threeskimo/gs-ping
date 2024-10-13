#!/bin/bash

#NOTE: You may have to enable advanced sharing options on Moonlight PC to allow ICMP ping responses

#CHANGE THESE:--------------------
moonlight_ip="192.168.1.185"
ping_threshold=25
#---------------------------------

RED='\033[0;31m' 	# Red
GREEN='\033[0;32m'	# Green
NC='\033[0m'     	# No Color

while true; do
    # Ping the Moonlight Server IP address (config'd above) and extract the "time=" value
    ping_output=$(ping -c 1 $moonlight_ip 2>/dev/null)

    if [[ $? -ne 0 ]]; then
        # Ping failed (no response from the server or unreachable network)
        printf "${RED}[-] Error: Unable to reach $moonlight_ip\n${NC}"
    else
        # Extract the time value from the ping output
        time=$(echo "$ping_output" | grep "time=" | awk '{print $7}' | cut -d "=" -f 2)

        # Only proceed if the time value is valid (non-empty)
        if [[ -n $time ]]; then
            # Check if the "time=" value is above the ping threshold
            if (( ${time%.*} >= $ping_threshold )); then
                # Trigger sound and show ping in red if the "time=" value is above ping threshold
                printf "${RED}[-] Ping = ${time} ms\n${NC}"
                printf "\a"
            else
                # If below ping threshold, just show ping data
                printf "${GREEN}[+] Ping = ${time} ms\n${NC}"
            fi
        else
            # Handle cases where the time value is missing from the ping output
            printf "${RED}[-] Error: Could not extract ping time from $moonlight_ip\n${NC}"
        fi
    fi

    # Sleep for 1 second before pinging again
    sleep 1
done
