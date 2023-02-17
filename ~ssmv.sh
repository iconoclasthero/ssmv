#!/bin/bash
#ssmv.sh

# last edit: Fri Feb 17 03:22:10 PM EST 2023

scriptname="$(realpath $0)"

function editscript(){
if [[ "$1" == "edit" ]]; then
 (/usr/bin/nano "$scriptname")
 exit
fi
}

editscript "$1"

# defines the screenshot directories.  May eventually want to parse them from ~/.config/user-dirs.dirs:
while read -r line;
 do
  if [[ "$line" =~ XDG_PICTURES ]];
   then
    xdg_pictures="${line#*=}";
     while [[ "$xdg_pictures" =~ \" ]];
      do
       xdg_pictures="${xdg_pictures/\"}";
      done
  fi
done < "$HOME/.config/user-dirs.dirs"

watch="$xdg_pictures/Screenshots"
ssdir="$xdg_pictures/screenshots"

mv "$watch"/* "$ssdir/" && rmdir --ignore-fail-on-non-empty "$watch"
