#!/bin/bash
installdir=/usr/local/sbin

if [[ ! -f "$installdir/ssmv.sh" ]]; then
 sudo cp ./ssmv.sh "$installdir"
 sudo chmod +X "$installdir/ssmv.sh"
 sudo chown root:root "$installdir/ssmv.sh"
fi

if [[ ! -L "$installdir/ssmv" ]]; then
 sudo ln -s "$installdir/ssmv.sh" "$installdir/ssmv"
fi

if [[ ! -f "/etc/systemd/user/ssmv.{service,path}" ]]; then
 sudo cp ssmv.{service,path} /etc/systemd/user
 sudo chown root:root /etc/systemd/user/ssmv.{service,path}
fi

#
systemctl --user daemon-reload
systemctl --user enable ssmv.path && systemctl --user start ssmv.path && systemctl --user enable ssmv.service
#systemctl --user --machine=%u@.host daemon-reload
#systemctl --user --machine=%u@.host enable ssmv.path && systemctl --machine=%u@.host --user start ssmv.path && systemctl -machine=%u@.host --user enable ssmv.service

