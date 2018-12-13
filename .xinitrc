#! /bin/bash
exec VBoxClient-all  &
exec i3
exec . ~/scripts/spotify/launchlistener.sh
