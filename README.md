# gs-ping.sh
A bash script to ping a local IP and display the milliseconds (ms) of latency.  If used on a Steam Deck, this script will play a warning sound if the ms of latency is above a threshold (set in script as 25ms by default).

## Why?
I was trying to figure out why my game streaming setup (over Moonlight) on my Steam Deck wasn't as smooth as it used to be and this script helped me determine that my issue was due to network latency between my game streaming machine and my Steam Deck, as it would dip above 25ms occassionally causing noticable stutters.  I loaded up Moonlight on my Deck, ran this script, and watched for stuttering in-game, then viewed the results of the script to see if my latency had jumped, which would signify a network issue.

## Usage
Edit `gs-ping.sh` and make sure the `moonlight_ip` is the IP of your local machine running Nvidia GameStream and `ping_threshold` is set to the threshold (in milliseconds) you want the script to use to notify you of an issue by beeping at you and showing the ping result in red. 

```
chmod +x gs-ping.sh
./gs-ping.sh
```

