#!/bin/bash
#ssmv.sh

# last edit: Thu Feb 16 06:39:00 PM EST 2023

scriptname="$(realpath $0)"

function editscript(){
if [[ "$1" == "edit" ]]; then
 (/usr/bin/nano "$scriptname")
 exit
fi
}


editscript "$1"

# defines the screenshot directories.  May eventually want to parse them from ~/.config/user-dirs.dirs:
watch="$HOME/pictures/Screenshots"
ssdir="$HOME/pictures/screenshots"

mv "$watch"/* "$ssdir/" && rmdir --ignore-fail-on-non-empty "$watch"

