# gs-ping.sh / gs-bing.bat
gs-ping (short for GameStream-ping) is a bash (and batch for windows) script to continuously ping a local IP and display the milliseconds (ms) of latency.  This script will play a warning sound if the ms of latency is above a threshold (set in script as 25ms by default).

## Why?
I was trying to figure out why my game streaming setup (over Moonlight) on my Steam Deck wasn't as smooth as it used to be and this script helped me determine that my steam degradation issue was due to network latency between my game streaming machine and my Steam Deck, as it would dip above 25ms latency occassionally causing noticable stutters.  I tested this by running this script on the Deck in the background and then loading and playing a game over Moonlight, then I'd watch for stuttering in-game.  I then viewed the results of the script to see if my latency had jumped, which would signify a network issue instead of an issue involving something else like encoding/etc.

## Usage
Edit `gs-ping.sh` / `gs-ping.bat` and make sure the `moonlight_ip` var is the IP of your local machine running Nvidia GameStream and the `ping_threshold` var is set to the threshold (in milliseconds) you want the script to use to notify you of an issue by beeping at you and showing the ping result in red.  For me, 25ms was a good threshold to use as anything above that was when I started to notice the most stuttering in-game. 

After that, if using `gs-ping.sh` do:

```
chmod +x gs-ping.sh
./gs-ping.sh
```

`gs-ping.bat` also allows the user to feed in `<ip>` and `<threshold>` parameters.  For example `gs-ping.bat 192.168.1.185 25` performs a latency test from the device running the script to 192.168.1.185 and will detect any issues above 25ms of latency.

>**NOTE:** If your PC running Moonlight is Windows, you may have to enable advanced sharing options to allow ICMP ping responses.
