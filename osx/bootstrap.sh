#!/usr/bin/env sh

# add the current user to wheel
sudo dscl . -append "/Groups/wheel" GroupMembership `whoami`

# make sure /usr/local exists, with the correct permissions
sudo mkdir -p "/usr/local"
sudo chown root:wheel "/usr/local"
sudo chmod ug=rwx,o=rx "/usr/local"

# update GUI preferences
sh $DOTFILES/osx/preferences.sh
