#!/bin/bash
#ssmv.sh: relocates screenshots from XDG_PICTURE_DIR/Screenshots to XDG_PICTURES_DIR/$ssdir

# last edit: Fri Feb 17 03:22:10 PM EST 2023

ssdir=screenshots
scriptname="$(realpath $0)"

function editscript(){
if [[ "$1" == "edit" ]]; then
 (/usr/bin/nano "$scriptname")
 exit
fi
}

editscript "$1"

# defines the screenshot directories.  May eventually want to parse them from ~/.config/user-dirs.dirs:
#while read -r line;
# do
#  if [[ "$line" =~ XDG_PICTURES ]];
#   then
#    xdg_pictures="${line#*=}";
#     while [[ "$xdg_pictures" =~ \" ]];
#      do
#       xdg_pictures="${xdg_pictures/\"}";
#      done
#  fi
#done < "$HOME/.config/user-dirs.dirs"

xdg_pictures=$(xdg-user-dir PICTURES)
watch="$xdg_pictures/Screenshots"
ssdest="$xdg_pictures/$ssdir"
echo "xdg_pictures: $xdg_pictures"
echo "watch: $watch"
echo "ssdest: $ssdest"

mv "$watch"/* "$ssdest"/ && rmdir --ignore-fail-on-non-empty "$watch"
