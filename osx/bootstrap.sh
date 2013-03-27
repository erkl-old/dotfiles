#!/usr/bin/env sh

# add the current user to wheel
sudo dscl . -append "/Groups/wheel" GroupMembership `whoami`

# make sure /usr/local exists, with the correct permissions
sudo mkdir -p "/usr/local"
sudo chown root:wheel "/usr/local"
sudo chmod ug=rwx,o=rx "/usr/local"

# install http://whomwah.github.com/qlstephen/
mkdir -p "$HOME/Library/QuickLook"
tar -C "$HOME/Library/QuickLook" -xzf "$DOTFILES/osx/QLStephen.tar.gz"
open "$HOME/Library/QuickLook/QLStephen.qlgenerator"

# update GUI preferences
sh $DOTFILES/osx/preferences.sh
