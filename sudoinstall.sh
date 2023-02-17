#!/bin/bash
installdir=/usr/local/sbin

if [[ ! -f "$installdir/ssmv.sh" ]]; then
cp ./ssmv.sh "$installdir"
chmod +X "$installdir/ssmv.sh"
chown root:root "$installdir/ssmv.sh"
fi

if [[ ! -L "$installdir/ssmv" ]]; then
 ln -s "$installdir/ssmv.sh" "$installdir/ssmv"
fi

if [[ ! -f "/etc/systemd/user/ssmv.{service,path}" ]]; then
cp ssmv.{service,path} /etc/systemd/user
chown root:root /etc/systemd/user/ssmv.{service,path}
fi

#sudo -k
#systemctl --user -M %u@ daemon-reload
#systemctl --user -M %u@ enable ssmv.path && systemctl --user start ssmv.path && systemctl -machine=$USER@.host --user enable ssmv.service
systemctl --user --machine=%u@.host daemon-reload
systemctl --user --machine=%u@.host enable ssmv.path && systemctl --machine=%u@.host --user start ssmv.path && systemctl -machine=%u@.host --user enable ssmv.service
