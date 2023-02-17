#!/bin/bash
#ssmv.sh: relocates screenshots from XDG_PICTURE_DIR/Screenshots to XDG_PICTURES_DIR/$ssdir
#however, the XDG_PICTURES_DIR is not necessary and can be removed by editing the script

# last edit: Fri Feb 17 04:53:15 PM EST 2023

ssdir=screenshots
scriptname="$(realpath $0)"

function editscript(){
if [[ "$1" == "edit" ]]; then
 (/usr/bin/nano "$scriptname")
 exit
fi
}

editscript "$1"

# defines the screenshot directories:
xdg_pictures=$(xdg-user-dir PICTURES)
watch="$xdg_pictures/Screenshots"
ssdest="$xdg_pictures/$ssdir"

mv "$watch"/* "$ssdest"/ && rmdir --ignore-fail-on-non-empty "$watch"
