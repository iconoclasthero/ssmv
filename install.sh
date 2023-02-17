#!/bin/bash
installdir=/usr/local/sbin

sudo cp ./ssmv.sh "$installdir"
sudo chmod +X "$installdir/ssmv.sh"
sudo chown root:root "$installdir/ssmv.sh"

if [[ ! -L "$installdir/ssmv.sh" ]]; then
 sudo ln -s "$installdir/ssmv.sh" "$installdir/ssmv"
fi

sudo cp ssmv.{service,path} /etc/systemd/user
sudo chown root:root /etc/systemd/user/ssmv.{service,path}
systemctl --user daemon-reload
systemctl --user enable ssmv.path && systemctl --user start ssmv.path && systemctl --user enable ssmv.service

