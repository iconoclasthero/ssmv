#!/bin/bash
installdir=/usr/local/sbin

if [[ -f "$installdir/ssmv.sh" ]]; then
 sudo rm "$installdir/ssmv.sh"
fi

if [[ -L "$installdir/ssmv" ]]; then
 sudo rm "$installdir/ssmv"
fi

if [[ -f "/etc/systemd/user/ssmv.{service,path}" ]]; then
 sudo rm /etc/systemd/user/ssmv.{service,path} /etc/systemd/user
fi

echo "$XDG_RUNTIME_DIR"
systemctl --user daemon-reload
#systemctl --user --global disable ssmv.path && systemctl --user --global stop ssmv.path && systemctl --user disable ssmv.service

#systemctl --user --machine=%u@.host daemon-reload
#systemctl --user --machine=%u@.host enable ssmv.path && systemctl --machine=%u@.host --user start ssmv.path && systemctl -machine=%u@.host --user enable ssmv.service

