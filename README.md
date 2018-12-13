# dotfiles


# Getting Spotify to work on Polybar

The following three lines are addded to i3's config in order to start the service correctly
```
exec --no-startup-id sudo rm /tmp/mname.txt
exec --no-startup-id polybar -r top & echo $! >> /tmp/mname.txt
exec --no-startup-id ../../.scripts/spotify/launchlistener.sh
```
The first line removes the temporary created last time Polybar started. Then, when launching Polybar, the second line saves in mname.txt the PID of the bar. This file is read when the Spotify Listener .py file opens, in order to get the correct PID and properly send commands to the open bar.

The IPC modules in polybar's config listen for bash commands sent out by the Python script. These commands are sent out when a song begins to play or is paused. 

