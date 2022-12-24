# gs-ping.sh
A bash script to continuously ping a local IP and display the milliseconds (ms) of latency.  This script will play a warning sound and display the result in red if the ms of latency is above a threshold (set in script as 25ms by default).

## Why?
I was trying to figure out why my game streaming setup (over Moonlight) on my Steam Deck wasn't as smooth as it used to be and this script helped me determine that my issue was due to network latency between my game streaming machine and my Steam Deck, as it would dip above 25ms occassionally causing noticable stutters.  I did this by loaded Moonlight on my Deck, running this script, and then I watched for stuttering in-game.  Then I viewed the results of the script to see if my latency had jumped, which would signify a network issue instead of an issue involving something else like encoding/etc.

## Usage
Edit `gs-ping.sh` and make sure the `moonlight_ip` var is the IP of your local machine running Nvidia GameStream and yhe `ping_threshold` var is set to the threshold (in milliseconds) you want the script to use to notify you of an issue by beeping at you and showing the ping result in red.  For me, 25ms was a good threshold to use as anything above that was when I started to notice the most stuttering in-game. 

After that:

```
chmod +x gs-ping.sh
./gs-ping.sh
```

>**NOTE:** If your PC running Moonlight is Windows, you may have to enable advanced sharing options to allow ICMP ping responses.
